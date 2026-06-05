// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserUpdate _$UserUpdateFromJson(Map<String, dynamic> json) => _UserUpdate(
      name: json['name'] as String?,
      email: json['email'] as String?,
      bloodGroup: json['blood_group'] as String?,
      medicalConditions: json['medical_conditions'] as String?,
      allergies: json['allergies'] as String?,
      emergencyContacts: (json['emergency_contacts'] as List<dynamic>?)
          ?.map((e) => EmergencyContact.fromJson(e as Map<String, dynamic>))
          .toList(),
      preferredLanguage: json['preferred_language'] as String?,
    );

Map<String, dynamic> _$UserUpdateToJson(_UserUpdate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'blood_group': instance.bloodGroup,
      'medical_conditions': instance.medicalConditions,
      'allergies': instance.allergies,
      'emergency_contacts': instance.emergencyContacts,
      'preferred_language': instance.preferredLanguage,
    };
