import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/auth_models.dart';
import '../models/user_models.dart';

part 'user_api.g.dart';

@RestApi()
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @GET('/users/me')
  Future<UserOut> getMe();

  @PATCH('/users/me')
  Future<UserOut> updateMe(@Body() UserUpdate request);
}
