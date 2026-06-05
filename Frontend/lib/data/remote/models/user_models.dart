import 'package:freezed_annotation/freezed_annotation.dart';
import 'auth_models.dart';

part 'user_models.freezed.dart';
part 'user_models.g.dart';

@freezed
abstract class UserUpdate with _$UserUpdate {
  const factory UserUpdate({
    String? name,
    String? email,
    @JsonKey(name: 'blood_group') String? bloodGroup,
    @JsonKey(name: 'medical_conditions') String? medicalConditions,
    String? allergies,
    @JsonKey(name: 'emergency_contacts') List<EmergencyContact>? emergencyContacts,
    @JsonKey(name: 'preferred_language') String? preferredLanguage,
  }) = _UserUpdate;

  factory UserUpdate.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateFromJson(json);
}
