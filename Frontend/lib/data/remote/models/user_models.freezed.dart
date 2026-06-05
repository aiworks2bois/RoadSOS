// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserUpdate {
  String? get name;
  String? get email;
  @JsonKey(name: 'blood_group')
  String? get bloodGroup;
  @JsonKey(name: 'medical_conditions')
  String? get medicalConditions;
  String? get allergies;
  @JsonKey(name: 'emergency_contacts')
  List<EmergencyContact>? get emergencyContacts;
  @JsonKey(name: 'preferred_language')
  String? get preferredLanguage;

  /// Create a copy of UserUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserUpdateCopyWith<UserUpdate> get copyWith =>
      _$UserUpdateCopyWithImpl<UserUpdate>(this as UserUpdate, _$identity);

  /// Serializes this UserUpdate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserUpdate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.medicalConditions, medicalConditions) ||
                other.medicalConditions == medicalConditions) &&
            (identical(other.allergies, allergies) ||
                other.allergies == allergies) &&
            const DeepCollectionEquality()
                .equals(other.emergencyContacts, emergencyContacts) &&
            (identical(other.preferredLanguage, preferredLanguage) ||
                other.preferredLanguage == preferredLanguage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      bloodGroup,
      medicalConditions,
      allergies,
      const DeepCollectionEquality().hash(emergencyContacts),
      preferredLanguage);

  @override
  String toString() {
    return 'UserUpdate(name: $name, email: $email, bloodGroup: $bloodGroup, medicalConditions: $medicalConditions, allergies: $allergies, emergencyContacts: $emergencyContacts, preferredLanguage: $preferredLanguage)';
  }
}

/// @nodoc
abstract mixin class $UserUpdateCopyWith<$Res> {
  factory $UserUpdateCopyWith(
          UserUpdate value, $Res Function(UserUpdate) _then) =
      _$UserUpdateCopyWithImpl;
  @useResult
  $Res call(
      {String? name,
      String? email,
      @JsonKey(name: 'blood_group') String? bloodGroup,
      @JsonKey(name: 'medical_conditions') String? medicalConditions,
      String? allergies,
      @JsonKey(name: 'emergency_contacts')
      List<EmergencyContact>? emergencyContacts,
      @JsonKey(name: 'preferred_language') String? preferredLanguage});
}

/// @nodoc
class _$UserUpdateCopyWithImpl<$Res> implements $UserUpdateCopyWith<$Res> {
  _$UserUpdateCopyWithImpl(this._self, this._then);

  final UserUpdate _self;
  final $Res Function(UserUpdate) _then;

  /// Create a copy of UserUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? bloodGroup = freezed,
    Object? medicalConditions = freezed,
    Object? allergies = freezed,
    Object? emergencyContacts = freezed,
    Object? preferredLanguage = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodGroup: freezed == bloodGroup
          ? _self.bloodGroup
          : bloodGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      medicalConditions: freezed == medicalConditions
          ? _self.medicalConditions
          : medicalConditions // ignore: cast_nullable_to_non_nullable
              as String?,
      allergies: freezed == allergies
          ? _self.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContacts: freezed == emergencyContacts
          ? _self.emergencyContacts
          : emergencyContacts // ignore: cast_nullable_to_non_nullable
              as List<EmergencyContact>?,
      preferredLanguage: freezed == preferredLanguage
          ? _self.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserUpdate].
extension UserUpdatePatterns on UserUpdate {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserUpdate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserUpdate() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserUpdate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserUpdate():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserUpdate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserUpdate() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String? name,
            String? email,
            @JsonKey(name: 'blood_group') String? bloodGroup,
            @JsonKey(name: 'medical_conditions') String? medicalConditions,
            String? allergies,
            @JsonKey(name: 'emergency_contacts')
            List<EmergencyContact>? emergencyContacts,
            @JsonKey(name: 'preferred_language') String? preferredLanguage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserUpdate() when $default != null:
        return $default(
            _that.name,
            _that.email,
            _that.bloodGroup,
            _that.medicalConditions,
            _that.allergies,
            _that.emergencyContacts,
            _that.preferredLanguage);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String? name,
            String? email,
            @JsonKey(name: 'blood_group') String? bloodGroup,
            @JsonKey(name: 'medical_conditions') String? medicalConditions,
            String? allergies,
            @JsonKey(name: 'emergency_contacts')
            List<EmergencyContact>? emergencyContacts,
            @JsonKey(name: 'preferred_language') String? preferredLanguage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserUpdate():
        return $default(
            _that.name,
            _that.email,
            _that.bloodGroup,
            _that.medicalConditions,
            _that.allergies,
            _that.emergencyContacts,
            _that.preferredLanguage);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String? name,
            String? email,
            @JsonKey(name: 'blood_group') String? bloodGroup,
            @JsonKey(name: 'medical_conditions') String? medicalConditions,
            String? allergies,
            @JsonKey(name: 'emergency_contacts')
            List<EmergencyContact>? emergencyContacts,
            @JsonKey(name: 'preferred_language') String? preferredLanguage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserUpdate() when $default != null:
        return $default(
            _that.name,
            _that.email,
            _that.bloodGroup,
            _that.medicalConditions,
            _that.allergies,
            _that.emergencyContacts,
            _that.preferredLanguage);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserUpdate implements UserUpdate {
  const _UserUpdate(
      {this.name,
      this.email,
      @JsonKey(name: 'blood_group') this.bloodGroup,
      @JsonKey(name: 'medical_conditions') this.medicalConditions,
      this.allergies,
      @JsonKey(name: 'emergency_contacts')
      final List<EmergencyContact>? emergencyContacts,
      @JsonKey(name: 'preferred_language') this.preferredLanguage})
      : _emergencyContacts = emergencyContacts;
  factory _UserUpdate.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateFromJson(json);

  @override
  final String? name;
  @override
  final String? email;
  @override
  @JsonKey(name: 'blood_group')
  final String? bloodGroup;
  @override
  @JsonKey(name: 'medical_conditions')
  final String? medicalConditions;
  @override
  final String? allergies;
  final List<EmergencyContact>? _emergencyContacts;
  @override
  @JsonKey(name: 'emergency_contacts')
  List<EmergencyContact>? get emergencyContacts {
    final value = _emergencyContacts;
    if (value == null) return null;
    if (_emergencyContacts is EqualUnmodifiableListView)
      return _emergencyContacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'preferred_language')
  final String? preferredLanguage;

  /// Create a copy of UserUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserUpdateCopyWith<_UserUpdate> get copyWith =>
      __$UserUpdateCopyWithImpl<_UserUpdate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserUpdateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserUpdate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.bloodGroup, bloodGroup) ||
                other.bloodGroup == bloodGroup) &&
            (identical(other.medicalConditions, medicalConditions) ||
                other.medicalConditions == medicalConditions) &&
            (identical(other.allergies, allergies) ||
                other.allergies == allergies) &&
            const DeepCollectionEquality()
                .equals(other._emergencyContacts, _emergencyContacts) &&
            (identical(other.preferredLanguage, preferredLanguage) ||
                other.preferredLanguage == preferredLanguage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      bloodGroup,
      medicalConditions,
      allergies,
      const DeepCollectionEquality().hash(_emergencyContacts),
      preferredLanguage);

  @override
  String toString() {
    return 'UserUpdate(name: $name, email: $email, bloodGroup: $bloodGroup, medicalConditions: $medicalConditions, allergies: $allergies, emergencyContacts: $emergencyContacts, preferredLanguage: $preferredLanguage)';
  }
}

/// @nodoc
abstract mixin class _$UserUpdateCopyWith<$Res>
    implements $UserUpdateCopyWith<$Res> {
  factory _$UserUpdateCopyWith(
          _UserUpdate value, $Res Function(_UserUpdate) _then) =
      __$UserUpdateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? name,
      String? email,
      @JsonKey(name: 'blood_group') String? bloodGroup,
      @JsonKey(name: 'medical_conditions') String? medicalConditions,
      String? allergies,
      @JsonKey(name: 'emergency_contacts')
      List<EmergencyContact>? emergencyContacts,
      @JsonKey(name: 'preferred_language') String? preferredLanguage});
}

/// @nodoc
class __$UserUpdateCopyWithImpl<$Res> implements _$UserUpdateCopyWith<$Res> {
  __$UserUpdateCopyWithImpl(this._self, this._then);

  final _UserUpdate _self;
  final $Res Function(_UserUpdate) _then;

  /// Create a copy of UserUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? bloodGroup = freezed,
    Object? medicalConditions = freezed,
    Object? allergies = freezed,
    Object? emergencyContacts = freezed,
    Object? preferredLanguage = freezed,
  }) {
    return _then(_UserUpdate(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodGroup: freezed == bloodGroup
          ? _self.bloodGroup
          : bloodGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      medicalConditions: freezed == medicalConditions
          ? _self.medicalConditions
          : medicalConditions // ignore: cast_nullable_to_non_nullable
              as String?,
      allergies: freezed == allergies
          ? _self.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as String?,
      emergencyContacts: freezed == emergencyContacts
          ? _self._emergencyContacts
          : emergencyContacts // ignore: cast_nullable_to_non_nullable
              as List<EmergencyContact>?,
      preferredLanguage: freezed == preferredLanguage
          ? _self.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
