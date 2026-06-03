import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Typed wrapper around flutter_secure_storage.
///
/// All tokens are AES-256 encrypted via the OS keystore (Android Keystore /
/// iOS Secure Enclave). Never store tokens in SharedPreferences or plain files.
///
/// Key names are stable constants — changing them requires a migration.
class TokenStore {
  static const _kAccessToken = 'roadsos.access_token';
  static const _kMeshRelayKey = 'roadsos.mesh_relay_key';

  final FlutterSecureStorage _store;

  const TokenStore({
    FlutterSecureStorage? store,
  }) : _store = store ?? const FlutterSecureStorage(
          aOptions: AndroidOptions(encryptedSharedPreferences: true),
          iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
        );

  // ── Access Token ────────────────────────────────────────────────────────────

  Future<void> saveAccessToken(String token) async =>
      _store.write(key: _kAccessToken, value: token);

  Future<String?> getAccessToken() async =>
      _store.read(key: _kAccessToken);

  // ── Mesh Relay Key ──────────────────────────────────────────────────────────
  // Per-user HMAC sub-key fetched from GET /auth/mesh-relay-key at login.
  // Used to sign offline SOS payloads for BLE mesh relay.
  // The backend verifies by re-deriving HMAC(master_key, user_id).

  Future<void> saveMeshRelayKey(String key) async =>
      _store.write(key: _kMeshRelayKey, value: key);

  Future<String?> getMeshRelayKey() async =>
      _store.read(key: _kMeshRelayKey);

  Future<bool> hasMeshRelayKey() async =>
      (await getMeshRelayKey()) != null;

  // ── Lifecycle ───────────────────────────────────────────────────────────────

  /// Call on logout or 401 — wipes all stored credentials from the keystore.
  Future<void> clearAll() async => _store.deleteAll();
}
