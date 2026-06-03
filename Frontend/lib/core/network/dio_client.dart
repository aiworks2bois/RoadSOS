import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../config/app_config.dart';
import '../auth/token_store.dart';

// ── Exceptions ───────────────────────────────────────────────────────────────

/// Thrown when the device has no real internet access.
/// Triggers the offline SOS queue path in [SosTriggerController].
class OfflineException implements Exception {
  const OfflineException();
  @override
  String toString() => 'OfflineException: No internet access';
}

/// Structured API error with status code and message.
class ApiException implements Exception {
  final int statusCode;
  final String message;
  final int? retryAfterSeconds; // from Retry-After header on 429

  const ApiException({
    required this.statusCode,
    required this.message,
    this.retryAfterSeconds,
  });

  bool get isRateLimited => statusCode == 429;
  bool get isUnauthorized => statusCode == 401;
  bool get isNotFound => statusCode == 404;

  @override
  String toString() => 'ApiException($statusCode): $message';
}

// ── Interceptors ─────────────────────────────────────────────────────────────

/// Injects Authorization: Bearer <token> on every outgoing request.
/// On 401 response: clears stored token and signals logout.
///
/// With 24h tokens, mid-SOS expiry cannot occur during a single incident.
/// Logout on 401 is the correct and safe response.
class JwtInterceptor extends Interceptor {
  final TokenStore _tokenStore;
  final Ref _ref;

  JwtInterceptor(this._tokenStore, this._ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenStore.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Token expired or revoked. Clear stored credentials.
      // The AuthNotifier will redirect to /auth/login via GoRouter.
      await _tokenStore.clearAll();
      // TODO: _ref.read(authNotifierProvider.notifier).logout();
    }
    handler.next(err);
  }
}

/// Checks for REAL internet connectivity before every request.
///
/// Why not connectivity_plus?
/// connectivity_plus only checks whether a network interface is UP (WiFi / mobile).
/// It does not verify packets can reach the internet. A phone on a captive portal
/// hotel WiFi returns ConnectivityResult.wifi but ALL API calls fail silently.
///
/// This is CRITICAL for the SOS path: we must not route away from the offline
/// queue based on a false positive. internet_connection_checker_plus sends a
/// real probe to confirm connectivity.
class ConnectivityInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final hasInternet = await InternetConnection().hasInternetAccess;
    if (!hasInternet) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: const OfflineException(),
          type: DioExceptionType.connectionError,
        ),
      );
    }
    handler.next(options);
  }
}

/// Maps HTTP error responses to typed [ApiException] instances.
/// Extracts retry_after_seconds from 429 response body.
class ErrorNormalizerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    if (response == null) {
      // Network error — let it bubble as-is.
      return handler.next(err);
    }

    final statusCode = response.statusCode ?? 0;
    final body = response.data;
    final message = (body is Map ? body['detail'] : null) as String? ??
        'Unexpected error ($statusCode)';

    // Extract Retry-After from header (standardised in Phase 0C backend change).
    int? retryAfterSeconds;
    if (statusCode == 429) {
      final retryHeader = response.headers.value('retry-after');
      if (retryHeader != null) {
        retryAfterSeconds = int.tryParse(retryHeader);
      }
      // Also check the body field as a fallback.
      if (retryAfterSeconds == null && body is Map) {
        retryAfterSeconds =
            (body['retry_after_seconds'] as num?)?.toInt();
      }
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: response,
        error: ApiException(
          statusCode: statusCode,
          message: message,
          retryAfterSeconds: retryAfterSeconds,
        ),
        type: err.type,
      ),
    );
  }
}

// ── Client Factory ───────────────────────────────────────────────────────────

/// Builds and configures the shared Dio instance.
Dio buildDioClient(TokenStore tokenStore, Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.current.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 10),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-App-Version': '1.0.0', // Updated via package_info_plus in prod
      },
    ),
  );

  // Order matters: ConnectivityInterceptor runs first so offline errors are
  // detected before JwtInterceptor reads secure storage (I/O cost).
  dio.interceptors.addAll([
    ConnectivityInterceptor(),
    JwtInterceptor(tokenStore, ref),
    ErrorNormalizerInterceptor(),
    if (AppConfig.current.isDev)
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        error: true,
        compact: false,
      ),
  ]);

  return dio;
}
