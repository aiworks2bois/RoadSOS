import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
abstract class EmergencyContact with _$EmergencyContact {
  const factory EmergencyContact({
    required String name,
    required String phone,
    String? relation,
    @JsonKey(name: 'notify_on_sos') @Default(true) bool notifyOnSos,
  }) = _EmergencyContact;

  factory EmergencyContact.fromJson(Map<String, dynamic> json) => _$EmergencyContactFromJson(json);
}

@freezed
abstract class UserCreate with _$UserCreate {
  const factory UserCreate({
    required String name,
    required String phone,
    String? email,
    required String password,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'medical_conditions') String? medicalConditions,
    String? allergies,
    @JsonKey(name: 'emergency_contacts') @Default([]) List<EmergencyContact> emergencyContacts,
    @JsonKey(name: 'preferred_language') @Default('en') String preferredLanguage,
  }) = _UserCreate;

  factory UserCreate.fromJson(Map<String, dynamic> json) => _$UserCreateFromJson(json);
}

@freezed
abstract class UserLogin with _$UserLogin {
  const factory UserLogin({
    required String phone,
    required String password,
  }) = _UserLogin;

  factory UserLogin.fromJson(Map<String, dynamic> json) => _$UserLoginFromJson(json);
}

@freezed
abstract class UserOut with _$UserOut {
  const factory UserOut({
    required String id,
    required String name,
    required String phone,
    String? email,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'medical_conditions') String? medicalConditions,
    String? allergies,
    @JsonKey(name: 'emergency_contacts') List<EmergencyContact>? emergencyContacts,
    @JsonKey(name: 'preferred_language') @Default('en') String preferredLanguage,
    @Default('user') String role,
  }) = _UserOut;

  factory UserOut.fromJson(Map<String, dynamic> json) => _$UserOutFromJson(json);
}

@freezed
abstract class TokenResponse with _$TokenResponse {
  const factory TokenResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'token_type') @Default('bearer') String tokenType,
    @JsonKey(name: 'expires_in_minutes') required int expiresInMinutes,
    required UserOut user,
  }) = _TokenResponse;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => _$TokenResponseFromJson(json);
}
