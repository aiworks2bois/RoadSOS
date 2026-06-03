import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/auth_models.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/auth/register')
  Future<TokenResponse> register(@Body() UserCreate request);

  @POST('/auth/login')
  Future<TokenResponse> login(@Body() UserLogin request);

  @GET('/auth/mesh-relay-key')
  Future<dynamic> getMeshRelayKey();
}
