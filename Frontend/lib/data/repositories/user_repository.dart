import '../remote/api/user_api.dart';
import '../remote/models/auth_models.dart';
import '../remote/models/user_models.dart';

class UserRepository {
  final UserApi _api;

  UserRepository(this._api);

  Future<UserOut> getMe() async {
    return await _api.getMe();
  }

  Future<UserOut> updateMe(UserUpdate update) async {
    return await _api.updateMe(update);
  }
}
