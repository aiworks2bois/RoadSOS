import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../core/auth/token_store.dart';
import '../../core/network/dio_client.dart';
import '../../core/offline/offline_queue.dart';
import '../../core/location/location_service.dart';
import '../../data/local/database.dart';
import '../../data/remote/api/auth_api.dart';
import '../../data/remote/api/sos_api.dart';
import '../../data/remote/api/user_api.dart';
import '../../data/remote/api/volunteer_api.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/repositories/sos_repository.dart';
import '../../data/repositories/user_repository.dart';
import '../../data/repositories/volunteer_repository.dart';

// Core infrastructure
final tokenStoreProvider = Provider<TokenStore>((ref) => TokenStore());
final appDatabaseProvider = Provider<AppDatabase>((ref) => AppDatabase());
final offlineQueueProvider = Provider<OfflineQueue>((ref) {
  return OfflineQueue();
});

final locationServiceProvider = Provider<LocationService>((ref) {
  return LocationService();
});

// Dio
final dioClientProvider = Provider<Dio>((ref) {
  final tokenStore = ref.watch(tokenStoreProvider);
  return buildDioClient(tokenStore, ref);
});

// APIs
final authApiProvider = Provider<AuthApi>((ref) {
  final dio = ref.watch(dioClientProvider);
  return AuthApi(dio);
});

final sosApiProvider = Provider<SosApi>((ref) {
  final dio = ref.watch(dioClientProvider);
  return SosApi(dio);
});

// Repositories
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final api = ref.watch(authApiProvider);
  final tokenStore = ref.watch(tokenStoreProvider);
  return AuthRepository(api, tokenStore);
});

final sosRepositoryProvider = Provider<SosRepository>((ref) {
  final api = ref.watch(sosApiProvider);
  final queue = ref.watch(offlineQueueProvider);
  final db = ref.watch(appDatabaseProvider);
  return SosRepository(api, queue, db);
});

final userApiProvider = Provider<UserApi>((ref) {
  final dio = ref.watch(dioClientProvider);
  return UserApi(dio);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final api = ref.watch(userApiProvider);
  return UserRepository(api);
});

final volunteerApiProvider = Provider<VolunteerApi>((ref) {
  final dio = ref.watch(dioClientProvider);
  return VolunteerApi(dio);
});

final volunteerRepositoryProvider = Provider<VolunteerRepository>((ref) {
  final api = ref.watch(volunteerApiProvider);
  return VolunteerRepository(api);
});
