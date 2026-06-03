import '../../core/auth/token_store.dart';
import '../remote/api/auth_api.dart';
import '../remote/models/auth_models.dart';

class AuthRepository {
  final AuthApi _api;
  final TokenStore _tokenStore;

  AuthRepository(this._api, this._tokenStore);

  Future<TokenResponse> login(String phone, String password) async {
    final response = await _api.login(UserLogin(phone: phone, password: password));
    await _tokenStore.saveAccessToken(response.accessToken);
    await _fetchAndStoreMeshKey();
    return response;
  }

  Future<TokenResponse> register(UserCreate user) async {
    final response = await _api.register(user);
    await _tokenStore.saveAccessToken(response.accessToken);
    await _fetchAndStoreMeshKey();
    return response;
  }

  Future<void> _fetchAndStoreMeshKey() async {
    try {
      final data = await _api.getMeshRelayKey();
      final key = data['key'] as String?;
      if (key != null) {
        await _tokenStore.saveMeshRelayKey(key);
      }
    } catch (_) {
      // Ignore if mesh key fails, it's non-fatal for login.
    }
  }

  Future<void> logout() async {
    await _tokenStore.clearAll();
  }

  Future<bool> isAuthenticated() async {
    return (await _tokenStore.getAccessToken()) != null;
  }
}
