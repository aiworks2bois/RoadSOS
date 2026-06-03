// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmergencyContact _$EmergencyContactFromJson(Map<String, dynamic> json) =>
    _EmergencyContact(
      name: json['name'] as String,
      phone: json['phone'] as String,
      relation: json['relation'] as String?,
      notifyOnSos: json['notify_on_sos'] as bool? ?? true,
    );

Map<String, dynamic> _$EmergencyContactToJson(_EmergencyContact instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'relation': instance.relation,
      'notify_on_sos': instance.notifyOnSos,
    };

_UserCreate _$UserCreateFromJson(Map<String, dynamic> json) => _UserCreate(
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      password: json['password'] as String,
      bloodGroup: json['blood_group'] as String?,
      medicalConditions: json['medical_conditions'] as String?,
      allergies: json['allergies'] as String?,
      emergencyContacts: (json['emergency_contacts'] as List<dynamic>?)
              ?.map((e) => EmergencyContact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      preferredLanguage: json['preferred_language'] as String? ?? 'en',
    );

Map<String, dynamic> _$UserCreateToJson(_UserCreate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'password': instance.password,
      'blood_group': instance.bloodGroup,
      'medical_conditions': instance.medicalConditions,
      'allergies': instance.allergies,
      'emergency_contacts': instance.emergencyContacts,
      'preferred_language': instance.preferredLanguage,
    };

_UserLogin _$UserLoginFromJson(Map<String, dynamic> json) => _UserLogin(
      phone: json['phone'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserLoginToJson(_UserLogin instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'password': instance.password,
    };

_UserOut _$UserOutFromJson(Map<String, dynamic> json) => _UserOut(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String?,
      bloodGroup: json['blood_group'] as String?,
      medicalConditions: json['medical_conditions'] as String?,
      allergies: json['allergies'] as String?,
      emergencyContacts: (json['emergency_contacts'] as List<dynamic>?)
          ?.map((e) => EmergencyContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      preferredLanguage: json['preferred_language'] as String? ?? 'en',
      role: json['role'] as String? ?? 'user',
    );

Map<String, dynamic> _$UserOutToJson(_UserOut instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'blood_group': instance.bloodGroup,
      'medical_conditions': instance.medicalConditions,
      'allergies': instance.allergies,
      'emergency_contacts': instance.emergencyContacts,
      'preferred_language': instance.preferredLanguage,
      'role': instance.role,
    };

_TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    _TokenResponse(
      accessToken: json['access_token'] as String,
      tokenType: json['token_type'] as String? ?? 'bearer',
      expiresInMinutes: (json['expires_in_minutes'] as num).toInt(),
      user: UserOut.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenResponseToJson(_TokenResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in_minutes': instance.expiresInMinutes,
      'user': instance.user,
    };
