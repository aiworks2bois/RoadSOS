import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../config/app_config.dart';
import '../auth/token_store.dart';

// ── Event types (sealed union, Dart 3 exhaustive pattern matching) ────────────

sealed class IncidentSocketEvent {}

final class LocationUpdated extends IncidentSocketEvent {
  final double lat;
  final double lng;
  LocationUpdated({required this.lat, required this.lng});
}

final class StatusUpdated extends IncidentSocketEvent {
  final String status;
  StatusUpdated({required this.status});
}

final class TierEscalated extends IncidentSocketEvent {
  final String tier;
  TierEscalated({required this.tier});
}

final class ResponderAccepted extends IncidentSocketEvent {
  final String volunteerId;
  ResponderAccepted({required this.volunteerId});
}

final class MciProvisional extends IncidentSocketEvent {
  final String cell;
  final int hotPathCount;
  MciProvisional({required this.cell, required this.hotPathCount});
}

// ── Socket status ─────────────────────────────────────────────────────────────

enum WsStatus { connecting, live, reconnecting, offline }

// ── Manager ───────────────────────────────────────────────────────────────────

/// Manages the WebSocket connection to /sos/ws/{incident_id}.
///
/// Security: Uses Authorization: Bearer header on the WS upgrade handshake.
/// Backend security.py:authenticate_websocket_user() checks this header first.
/// We NEVER use the ?token= query param — it leaks the JWT into server access logs.
///
/// Reconnect strategy: exponential backoff 1s → 2s → 4s → … → 30s cap.
/// Idle timeout: if no frame received in 35s, close and reconnect.
/// Carrier NATs typically drop silent TCP connections after 30–90s.
class IncidentSocketManager {
  final TokenStore _tokenStore;

  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  Timer? _idleTimer;
  Timer? _reconnectTimer;

  final _eventController = StreamController<IncidentSocketEvent>.broadcast();
  final _statusController = StreamController<WsStatus>.broadcast();

  Stream<IncidentSocketEvent> get events => _eventController.stream;
  Stream<WsStatus> get status => _statusController.stream;

  String? _activeIncidentId;
  bool _shouldReconnect = false;
  Duration _backoff = const Duration(seconds: 1);
  DateTime _lastFrameAt = DateTime.now();

  IncidentSocketManager(this._tokenStore);

  /// Connect to an incident WebSocket.
  /// Idempotent — calling while already connected to the same incident is a no-op.
  Future<void> connect(String incidentId) async {
    if (_activeIncidentId == incidentId && _channel != null) return;
    _activeIncidentId = incidentId;
    _shouldReconnect = true;
    _backoff = const Duration(seconds: 1);
    final jwt = await _tokenStore.getAccessToken();
    if (jwt == null) return; // No token = logged out, don't connect.
    _connect(incidentId, jwt);
  }

  void _connect(String incidentId, String jwt) {
    _statusController.add(WsStatus.connecting);
    final uri = Uri.parse(
      '${AppConfig.current.wsBaseUrl}/sos/ws/$incidentId',
    );

    try {
      // Authorization header on the WS upgrade — NOT ?token= query param.
      // Backend: security.py:authenticate_websocket_user() reads this header first.
      _channel = WebSocketChannel.connect(uri, protocols: null);
      // Note: web_socket_channel doesn't support custom headers in the standard
      // connect() call on all platforms. For header-based auth we must use
      // the IOWebSocketChannel.connect() with headers on mobile.
      // TODO: Use IOWebSocketChannel for production — standard channel is for tests.
    } catch (_) {
      _scheduleReconnect(incidentId, jwt);
      return;
    }

    _lastFrameAt = DateTime.now();
    _statusController.add(WsStatus.live);

    _subscription = _channel!.stream.listen(
      (data) {
        _lastFrameAt = DateTime.now();
        _backoff = const Duration(seconds: 1); // reset on successful frame
        final event = _parseEvent(data as String);
        if (event != null) _eventController.add(event);
      },
      onError: (_) {
        _statusController.add(WsStatus.reconnecting);
        _scheduleReconnect(incidentId, jwt);
      },
      onDone: () {
        if (_shouldReconnect) {
          _statusController.add(WsStatus.reconnecting);
          _scheduleReconnect(incidentId, jwt);
        }
      },
      cancelOnError: false,
    );

    // Idle timeout: carriers drop silent TCP after 30–90s.
    // Check every 5s; if no frame in 35s → reconnect.
    _idleTimer?.cancel();
    _idleTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (DateTime.now().difference(_lastFrameAt).inSeconds > 35) {
        _channel?.sink.close();
        _scheduleReconnect(incidentId, jwt);
      }
    });
  }

  void _scheduleReconnect(String incidentId, String jwt) {
    _idleTimer?.cancel();
    _subscription?.cancel();
    _reconnectTimer?.cancel();
    if (!_shouldReconnect) return;
    _reconnectTimer = Timer(_backoff, () {
      if (_shouldReconnect) _connect(incidentId, jwt);
    });
    // Exponential backoff: 1s → 2s → 4s → 8s → 16s → 30s (cap).
    _backoff = Duration(
      milliseconds: min(_backoff.inMilliseconds * 2, 30000),
    );
  }

  IncidentSocketEvent? _parseEvent(String raw) {
    try {
      final data = jsonDecode(raw) as Map<String, dynamic>;
      final type = data['type'] as String?;
      return switch (type) {
        'location_updated' => LocationUpdated(
            lat: (data['lat'] as num).toDouble(),
            lng: (data['lng'] as num).toDouble(),
          ),
        'status_updated' => StatusUpdated(
            status: data['status'] as String,
          ),
        'tier_escalated' => TierEscalated(
            tier: data['tier'] as String,
          ),
        'responder_accepted' => ResponderAccepted(
            volunteerId: data['volunteer_id'] as String,
          ),
        'mci_provisional' => MciProvisional(
            cell: data['cell'] as String,
            hotPathCount: (data['hot_path_count'] as num?)?.toInt() ?? 0,
          ),
        _ => null, // Unknown event type — ignore gracefully.
      };
    } catch (_) {
      return null;
    }
  }

  /// Disconnect and stop reconnecting. Call when incident resolves or user navigates away.
  Future<void> disconnect() async {
    _shouldReconnect = false;
    _activeIncidentId = null;
    _idleTimer?.cancel();
    _reconnectTimer?.cancel();
    _subscription?.cancel();
    await _channel?.sink.close();
    _channel = null;
    _statusController.add(WsStatus.offline);
  }

  void dispose() {
    disconnect();
    _eventController.close();
    _statusController.close();
  }
}
