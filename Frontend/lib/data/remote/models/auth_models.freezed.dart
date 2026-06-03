// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmergencyContact {
  String get name;
  String get phone;
  String? get relation;
  @JsonKey(name: 'notify_on_sos')
  bool get notifyOnSos;

  /// Create a copy of EmergencyContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmergencyContactCopyWith<EmergencyContact> get copyWith =>
      _$EmergencyContactCopyWithImpl<EmergencyContact>(
          this as EmergencyContact, _$identity);

  /// Serializes this EmergencyContact to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmergencyContact &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.relation, relation) ||
                other.relation == relation) &&
            (identical(other.notifyOnSos, notifyOnSos) ||
                other.notifyOnSos == notifyOnSos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, phone, relation, notifyOnSos);

  @override
  String toString() {
    return 'EmergencyContact(name: $name, phone: $phone, relation: $relation, notifyOnSos: $notifyOnSos)';
  }
}

/// @nodoc
abstract mixin class $EmergencyContactCopyWith<$Res> {
  factory $EmergencyContactCopyWith(
          EmergencyContact value, $Res Function(EmergencyContact) _then) =
      _$EmergencyContactCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String phone,
      String? relation,
      @JsonKey(name: 'notify_on_sos') bool notifyOnSos});
}

/// @nodoc
class _$EmergencyContactCopyWithImpl<$Res>
    implements $EmergencyContactCopyWith<$Res> {
  _$EmergencyContactCopyWithImpl(this._self, this._then);

  final EmergencyContact _self;
  final $Res Function(EmergencyContact) _then;

  /// Create a copy of EmergencyContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? relation = freezed,
    Object? notifyOnSos = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      relation: freezed == relation
          ? _self.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as String?,
      notifyOnSos: null == notifyOnSos
          ? _self.notifyOnSos
          : notifyOnSos // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [EmergencyContact].
extension EmergencyContactPatterns on EmergencyContact {
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
    TResult Function(_EmergencyContact value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmergencyContact() when $default != null:
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
    TResult Function(_EmergencyContact value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmergencyContact():
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
    TResult? Function(_EmergencyContact value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmergencyContact() when $default != null:
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
    TResult Function(String name, String phone, String? relation,
            @JsonKey(name: 'notify_on_sos') bool notifyOnSos)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmergencyContact() when $default != null:
        return $default(
            _that.name, _that.phone, _that.relation, _that.notifyOnSos);
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
    TResult Function(String name, String phone, String? relation,
            @JsonKey(name: 'notify_on_sos') bool notifyOnSos)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmergencyContact():
        return $default(
            _that.name, _that.phone, _that.relation, _that.notifyOnSos);
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
    TResult? Function(String name, String phone, String? relation,
            @JsonKey(name: 'notify_on_sos') bool notifyOnSos)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmergencyContact() when $default != null:
        return $default(
            _that.name, _that.phone, _that.relation, _that.notifyOnSos);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EmergencyContact implements EmergencyContact {
  const _EmergencyContact(
      {required this.name,
      required this.phone,
      this.relation,
      @JsonKey(name: 'notify_on_sos') this.notifyOnSos = true});
  factory _EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String? relation;
  @override
  @JsonKey(name: 'notify_on_sos')
  final bool notifyOnSos;

  /// Create a copy of EmergencyContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmergencyContactCopyWith<_EmergencyContact> get copyWith =>
      __$EmergencyContactCopyWithImpl<_EmergencyContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EmergencyContactToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmergencyContact &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.relation, relation) ||
                other.relation == relation) &&
            (identical(other.notifyOnSos, notifyOnSos) ||
                other.notifyOnSos == notifyOnSos));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, phone, relation, notifyOnSos);

  @override
  String toString() {
    return 'EmergencyContact(name: $name, phone: $phone, relation: $relation, notifyOnSos: $notifyOnSos)';
  }
}

/// @nodoc
abstract mixin class _$EmergencyContactCopyWith<$Res>
    implements $EmergencyContactCopyWith<$Res> {
  factory _$EmergencyContactCopyWith(
          _EmergencyContact value, $Res Function(_EmergencyContact) _then) =
      __$EmergencyContactCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String phone,
      String? relation,
      @JsonKey(name: 'notify_on_sos') bool notifyOnSos});
}

/// @nodoc
class __$EmergencyContactCopyWithImpl<$Res>
    implements _$EmergencyContactCopyWith<$Res> {
  __$EmergencyContactCopyWithImpl(this._self, this._then);

  final _EmergencyContact _self;
  final $Res Function(_EmergencyContact) _then;

  /// Create a copy of EmergencyContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? relation = freezed,
    Object? notifyOnSos = null,
  }) {
    return _then(_EmergencyContact(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      relation: freezed == relation
          ? _self.relation
          : relation // ignore: cast_nullable_to_non_nullable
              as String?,
      notifyOnSos: null == notifyOnSos
          ? _self.notifyOnSos
          : notifyOnSos // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$UserCreate {
  String get name;
  String get phone;
  String? get email;
  String get password;
  @JsonKey(name: 'blood_group')
  String? get bloodGroup;
  @JsonKey(name: 'medical_conditions')
  String? get medicalConditions;
  String? get allergies;
  @JsonKey(name: 'emergency_contacts')
  List<EmergencyContact> get emergencyContacts;
  @JsonKey(name: 'preferred_language')
  String get preferredLanguage;

  /// Create a copy of UserCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCreateCopyWith<UserCreate> get copyWith =>
      _$UserCreateCopyWithImpl<UserCreate>(this as UserCreate, _$identity);

  /// Serializes this UserCreate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserCreate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
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
      phone,
      email,
      password,
      bloodGroup,
      medicalConditions,
      allergies,
      const DeepCollectionEquality().hash(emergencyContacts),
      preferredLanguage);

  @override
  String toString() {
    return 'UserCreate(name: $name, phone: $phone, email: $email, password: $password, bloodGroup: $bloodGroup, medicalConditions: $medicalConditions, allergies: $allergies, emergencyContacts: $emergencyContacts, preferredLanguage: $preferredLanguage)';
  }
}

/// @nodoc
abstract mixin class $UserCreateCopyWith<$Res> {
  factory $UserCreateCopyWith(
          UserCreate value, $Res Function(UserCreate) _then) =
      _$UserCreateCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String phone,
      String? email,
      String password,
      @JsonKey(name: 'blood_group') String? bloodGroup,
      @JsonKey(name: 'medical_conditions') String? medicalConditions,
      String? allergies,
      @JsonKey(name: 'emergency_contacts')
      List<EmergencyContact> emergencyContacts,
      @JsonKey(name: 'preferred_language') String preferredLanguage});
}

/// @nodoc
class _$UserCreateCopyWithImpl<$Res> implements $UserCreateCopyWith<$Res> {
  _$UserCreateCopyWithImpl(this._self, this._then);

  final UserCreate _self;
  final $Res Function(UserCreate) _then;

  /// Create a copy of UserCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? email = freezed,
    Object? password = null,
    Object? bloodGroup = freezed,
    Object? medicalConditions = freezed,
    Object? allergies = freezed,
    Object? emergencyContacts = null,
    Object? preferredLanguage = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
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
      emergencyContacts: null == emergencyContacts
          ? _self.emergencyContacts
          : emergencyContacts // ignore: cast_nullable_to_non_nullable
              as List<EmergencyContact>,
      preferredLanguage: null == preferredLanguage
          ? _self.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserCreate].
extension UserCreatePatterns on UserCreate {
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
    TResult Function(_UserCreate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserCreate() when $default != null:
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
    TResult Function(_UserCreate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserCreate():
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
    TResult? Function(_UserCreate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserCreate() when $default != null:
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
            String name,
            String phone,
            String? email,
            String password,
            @JsonKey(name: 'blood_group') String? bloodGroup,
            @JsonKey(name: 'medical_conditions') String? medicalConditions,
            String? allergies,
            @JsonKey(name: 'emergency_contacts')
            List<EmergencyContact> emergencyContacts,
            @JsonKey(name: 'preferred_language') String preferredLanguage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserCreate() when $default != null:
        return $default(
            _that.name,
            _that.phone,
            _that.email,
            _that.password,
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
            String name,
            String phone,
            String? email,
            String password,
            @JsonKey(name: 'blood_group') String? bloodGroup,
            @JsonKey(name: 'medical_conditions') String? medicalConditions,
            String? allergies,
            @JsonKey(name: 'emergency_contacts')
            List<EmergencyContact> emergencyContacts,
            @JsonKey(name: 'preferred_language') String preferredLanguage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserCreate():
        return $default(
            _that.name,
            _that.phone,
            _that.email,
            _that.password,
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
            String name,
            String phone,
            String? email,
            String password,
            @JsonKey(name: 'blood_group') String? bloodGroup,
            @JsonKey(name: 'medical_conditions') String? medicalConditions,
            String? allergies,
            @JsonKey(name: 'emergency_contacts')
            List<EmergencyContact> emergencyContacts,
            @JsonKey(name: 'preferred_language') String preferredLanguage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserCreate() when $default != null:
        return $default(
            _that.name,
            _that.phone,
            _that.email,
            _that.password,
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
class _UserCreate implements UserCreate {
  const _UserCreate(
      {required this.name,
      required this.phone,
      this.email,
      required this.password,
      @JsonKey(name: 'blood_group') this.bloodGroup,
      @JsonKey(name: 'medical_conditions') this.medicalConditions,
      this.allergies,
      @JsonKey(name: 'emergency_contacts')
      final List<EmergencyContact> emergencyContacts = const [],
      @JsonKey(name: 'preferred_language') this.preferredLanguage = 'en'})
      : _emergencyContacts = emergencyContacts;
  factory _UserCreate.fromJson(Map<String, dynamic> json) =>
      _$UserCreateFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String? email;
  @override
  final String password;
  @override
  @JsonKey(name: 'blood_group')
  final String? bloodGroup;
  @override
  @JsonKey(name: 'medical_conditions')
  final String? medicalConditions;
  @override
  final String? allergies;
  final List<EmergencyContact> _emergencyContacts;
  @override
  @JsonKey(name: 'emergency_contacts')
  List<EmergencyContact> get emergencyContacts {
    if (_emergencyContacts is EqualUnmodifiableListView)
      return _emergencyContacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emergencyContacts);
  }

  @override
  @JsonKey(name: 'preferred_language')
  final String preferredLanguage;

  /// Create a copy of UserCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCreateCopyWith<_UserCreate> get copyWith =>
      __$UserCreateCopyWithImpl<_UserCreate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserCreateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCreate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
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
      phone,
      email,
      password,
      bloodGroup,
      medicalConditions,
      allergies,
      const DeepCollectionEquality().hash(_emergencyContacts),
      preferredLanguage);

  @override
  String toString() {
    return 'UserCreate(name: $name, phone: $phone, email: $email, password: $password, bloodGroup: $bloodGroup, medicalConditions: $medicalConditions, allergies: $allergies, emergencyContacts: $emergencyContacts, preferredLanguage: $preferredLanguage)';
  }
}

/// @nodoc
abstract mixin class _$UserCreateCopyWith<$Res>
    implements $UserCreateCopyWith<$Res> {
  factory _$UserCreateCopyWith(
          _UserCreate value, $Res Function(_UserCreate) _then) =
      __$UserCreateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String phone,
      String? email,
      String password,
      @JsonKey(name: 'blood_group') String? bloodGroup,
      @JsonKey(name: 'medical_conditions') String? medicalConditions,
      String? allergies,
      @JsonKey(name: 'emergency_contacts')
      List<EmergencyContact> emergencyContacts,
      @JsonKey(name: 'preferred_language') String preferredLanguage});
}

/// @nodoc
class __$UserCreateCopyWithImpl<$Res> implements _$UserCreateCopyWith<$Res> {
  __$UserCreateCopyWithImpl(this._self, this._then);

  final _UserCreate _self;
  final $Res Function(_UserCreate) _then;

  /// Create a copy of UserCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? email = freezed,
    Object? password = null,
    Object? bloodGroup = freezed,
    Object? medicalConditions = freezed,
    Object? allergies = freezed,
    Object? emergencyContacts = null,
    Object? preferredLanguage = null,
  }) {
    return _then(_UserCreate(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
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
      emergencyContacts: null == emergencyContacts
          ? _self._emergencyContacts
          : emergencyContacts // ignore: cast_nullable_to_non_nullable
              as List<EmergencyContact>,
      preferredLanguage: null == preferredLanguage
          ? _self.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$UserLogin {
  String get phone;
  String get password;

  /// Create a copy of UserLogin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserLoginCopyWith<UserLogin> get copyWith =>
      _$UserLoginCopyWithImpl<UserLogin>(this as UserLogin, _$identity);

  /// Serializes this UserLogin to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserLogin &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phone, password);

  @override
  String toString() {
    return 'UserLogin(phone: $phone, password: $password)';
  }
}

/// @nodoc
abstract mixin class $UserLoginCopyWith<$Res> {
  factory $UserLoginCopyWith(UserLogin value, $Res Function(UserLogin) _then) =
      _$UserLoginCopyWithImpl;
  @useResult
  $Res call({String phone, String password});
}

/// @nodoc
class _$UserLoginCopyWithImpl<$Res> implements $UserLoginCopyWith<$Res> {
  _$UserLoginCopyWithImpl(this._self, this._then);

  final UserLogin _self;
  final $Res Function(UserLogin) _then;

  /// Create a copy of UserLogin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_self.copyWith(
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserLogin].
extension UserLoginPatterns on UserLogin {
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
    TResult Function(_UserLogin value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserLogin() when $default != null:
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
    TResult Function(_UserLogin value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserLogin():
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
    TResult? Function(_UserLogin value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserLogin() when $default != null:
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
    TResult Function(String phone, String password)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserLogin() when $default != null:
        return $default(_that.phone, _that.password);
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
    TResult Function(String phone, String password) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserLogin():
        return $default(_that.phone, _that.password);
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
    TResult? Function(String phone, String password)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserLogin() when $default != null:
        return $default(_that.phone, _that.password);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserLogin implements UserLogin {
  const _UserLogin({required this.phone, required this.password});
  factory _UserLogin.fromJson(Map<String, dynamic> json) =>
      _$UserLoginFromJson(json);

  @override
  final String phone;
  @override
  final String password;

  /// Create a copy of UserLogin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserLoginCopyWith<_UserLogin> get copyWith =>
      __$UserLoginCopyWithImpl<_UserLogin>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserLoginToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserLogin &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phone, password);

  @override
  String toString() {
    return 'UserLogin(phone: $phone, password: $password)';
  }
}

/// @nodoc
abstract mixin class _$UserLoginCopyWith<$Res>
    implements $UserLoginCopyWith<$Res> {
  factory _$UserLoginCopyWith(
          _UserLogin value, $Res Function(_UserLogin) _then) =
      __$UserLoginCopyWithImpl;
  @override
  @useResult
  $Res call({String phone, String password});
}

/// @nodoc
class __$UserLoginCopyWithImpl<$Res> implements _$UserLoginCopyWith<$Res> {
  __$UserLoginCopyWithImpl(this._self, this._then);

  final _UserLogin _self;
  final $Res Function(_UserLogin) _then;

  /// Create a copy of UserLogin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? phone = null,
    Object? password = null,
  }) {
    return _then(_UserLogin(
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$UserOut {
  String get id;
  String get name;
  String get phone;
  String? get email;
  @JsonKey(name: 'blood_group')
  String? get bloodGroup;
  @JsonKey(name: 'medical_conditions')
  String? get medicalConditions;
  String? get allergies;
  @JsonKey(name: 'emergency_contacts')
  List<EmergencyContact>? get emergencyContacts;
  @JsonKey(name: 'preferred_language')
  String get preferredLanguage;
  String get role;

  /// Create a copy of UserOut
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserOutCopyWith<UserOut> get copyWith =>
      _$UserOutCopyWithImpl<UserOut>(this as UserOut, _$identity);

  /// Serializes this UserOut to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserOut &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
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
                other.preferredLanguage == preferredLanguage) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      phone,
      email,
      bloodGroup,
      medicalConditions,
      allergies,
      const DeepCollectionEquality().hash(emergencyContacts),
      preferredLanguage,
      role);

  @override
  String toString() {
    return 'UserOut(id: $id, name: $name, phone: $phone, email: $email, bloodGroup: $bloodGroup, medicalConditions: $medicalConditions, allergies: $allergies, emergencyContacts: $emergencyContacts, preferredLanguage: $preferredLanguage, role: $role)';
  }
}

/// @nodoc
abstract mixin class $UserOutCopyWith<$Res> {
  factory $UserOutCopyWith(UserOut value, $Res Function(UserOut) _then) =
      _$UserOutCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      String? email,
      @JsonKey(name: 'blood_group') String? bloodGroup,
      @JsonKey(name: 'medical_conditions') String? medicalConditions,
      String? allergies,
      @JsonKey(name: 'emergency_contacts')
      List<EmergencyContact>? emergencyContacts,
      @JsonKey(name: 'preferred_language') String preferredLanguage,
      String role});
}

/// @nodoc
class _$UserOutCopyWithImpl<$Res> implements $UserOutCopyWith<$Res> {
  _$UserOutCopyWithImpl(this._self, this._then);

  final UserOut _self;
  final $Res Function(UserOut) _then;

  /// Create a copy of UserOut
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? email = freezed,
    Object? bloodGroup = freezed,
    Object? medicalConditions = freezed,
    Object? allergies = freezed,
    Object? emergencyContacts = freezed,
    Object? preferredLanguage = null,
    Object? role = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
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
      preferredLanguage: null == preferredLanguage
          ? _self.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [UserOut].
extension UserOutPatterns on UserOut {
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
    TResult Function(_UserOut value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserOut() when $default != null:
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
    TResult Function(_UserOut value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserOut():
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
    TResult? Function(_UserOut value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserOut() when $default != null:
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
            String id,
            String name,
            String phone,
            String? email,
            @JsonKey(name: 'blood_group') String? bloodGroup,
            @JsonKey(name: 'medical_conditions') String? medicalConditions,
            String? allergies,
            @JsonKey(name: 'emergency_contacts')
            List<EmergencyContact>? emergencyContacts,
            @JsonKey(name: 'preferred_language') String preferredLanguage,
            String role)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserOut() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.phone,
            _that.email,
            _that.bloodGroup,
            _that.medicalConditions,
            _that.allergies,
            _that.emergencyContacts,
            _that.preferredLanguage,
            _that.role);
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
            String id,
            String name,
            String phone,
            String? email,
            @JsonKey(name: 'blood_group') String? bloodGroup,
            @JsonKey(name: 'medical_conditions') String? medicalConditions,
            String? allergies,
            @JsonKey(name: 'emergency_contacts')
            List<EmergencyContact>? emergencyContacts,
            @JsonKey(name: 'preferred_language') String preferredLanguage,
            String role)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserOut():
        return $default(
            _that.id,
            _that.name,
            _that.phone,
            _that.email,
            _that.bloodGroup,
            _that.medicalConditions,
            _that.allergies,
            _that.emergencyContacts,
            _that.preferredLanguage,
            _that.role);
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
            String id,
            String name,
            String phone,
            String? email,
            @JsonKey(name: 'blood_group') String? bloodGroup,
            @JsonKey(name: 'medical_conditions') String? medicalConditions,
            String? allergies,
            @JsonKey(name: 'emergency_contacts')
            List<EmergencyContact>? emergencyContacts,
            @JsonKey(name: 'preferred_language') String preferredLanguage,
            String role)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserOut() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.phone,
            _that.email,
            _that.bloodGroup,
            _that.medicalConditions,
            _that.allergies,
            _that.emergencyContacts,
            _that.preferredLanguage,
            _that.role);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _UserOut implements UserOut {
  const _UserOut(
      {required this.id,
      required this.name,
      required this.phone,
      this.email,
      @JsonKey(name: 'blood_group') this.bloodGroup,
      @JsonKey(name: 'medical_conditions') this.medicalConditions,
      this.allergies,
      @JsonKey(name: 'emergency_contacts')
      final List<EmergencyContact>? emergencyContacts,
      @JsonKey(name: 'preferred_language') this.preferredLanguage = 'en',
      this.role = 'user'})
      : _emergencyContacts = emergencyContacts;
  factory _UserOut.fromJson(Map<String, dynamic> json) =>
      _$UserOutFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
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
  final String preferredLanguage;
  @override
  @JsonKey()
  final String role;

  /// Create a copy of UserOut
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserOutCopyWith<_UserOut> get copyWith =>
      __$UserOutCopyWithImpl<_UserOut>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserOutToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserOut &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
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
                other.preferredLanguage == preferredLanguage) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      phone,
      email,
      bloodGroup,
      medicalConditions,
      allergies,
      const DeepCollectionEquality().hash(_emergencyContacts),
      preferredLanguage,
      role);

  @override
  String toString() {
    return 'UserOut(id: $id, name: $name, phone: $phone, email: $email, bloodGroup: $bloodGroup, medicalConditions: $medicalConditions, allergies: $allergies, emergencyContacts: $emergencyContacts, preferredLanguage: $preferredLanguage, role: $role)';
  }
}

/// @nodoc
abstract mixin class _$UserOutCopyWith<$Res> implements $UserOutCopyWith<$Res> {
  factory _$UserOutCopyWith(_UserOut value, $Res Function(_UserOut) _then) =
      __$UserOutCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String phone,
      String? email,
      @JsonKey(name: 'blood_group') String? bloodGroup,
      @JsonKey(name: 'medical_conditions') String? medicalConditions,
      String? allergies,
      @JsonKey(name: 'emergency_contacts')
      List<EmergencyContact>? emergencyContacts,
      @JsonKey(name: 'preferred_language') String preferredLanguage,
      String role});
}

/// @nodoc
class __$UserOutCopyWithImpl<$Res> implements _$UserOutCopyWith<$Res> {
  __$UserOutCopyWithImpl(this._self, this._then);

  final _UserOut _self;
  final $Res Function(_UserOut) _then;

  /// Create a copy of UserOut
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phone = null,
    Object? email = freezed,
    Object? bloodGroup = freezed,
    Object? medicalConditions = freezed,
    Object? allergies = freezed,
    Object? emergencyContacts = freezed,
    Object? preferredLanguage = null,
    Object? role = null,
  }) {
    return _then(_UserOut(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
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
      preferredLanguage: null == preferredLanguage
          ? _self.preferredLanguage
          : preferredLanguage // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$TokenResponse {
  @JsonKey(name: 'access_token')
  String get accessToken;
  @JsonKey(name: 'token_type')
  String get tokenType;
  @JsonKey(name: 'expires_in_minutes')
  int get expiresInMinutes;
  UserOut get user;

  /// Create a copy of TokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TokenResponseCopyWith<TokenResponse> get copyWith =>
      _$TokenResponseCopyWithImpl<TokenResponse>(
          this as TokenResponse, _$identity);

  /// Serializes this TokenResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TokenResponse &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresInMinutes, expiresInMinutes) ||
                other.expiresInMinutes == expiresInMinutes) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, tokenType, expiresInMinutes, user);

  @override
  String toString() {
    return 'TokenResponse(accessToken: $accessToken, tokenType: $tokenType, expiresInMinutes: $expiresInMinutes, user: $user)';
  }
}

/// @nodoc
abstract mixin class $TokenResponseCopyWith<$Res> {
  factory $TokenResponseCopyWith(
          TokenResponse value, $Res Function(TokenResponse) _then) =
      _$TokenResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      @JsonKey(name: 'expires_in_minutes') int expiresInMinutes,
      UserOut user});

  $UserOutCopyWith<$Res> get user;
}

/// @nodoc
class _$TokenResponseCopyWithImpl<$Res>
    implements $TokenResponseCopyWith<$Res> {
  _$TokenResponseCopyWithImpl(this._self, this._then);

  final TokenResponse _self;
  final $Res Function(TokenResponse) _then;

  /// Create a copy of TokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? expiresInMinutes = null,
    Object? user = null,
  }) {
    return _then(_self.copyWith(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresInMinutes: null == expiresInMinutes
          ? _self.expiresInMinutes
          : expiresInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserOut,
    ));
  }

  /// Create a copy of TokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserOutCopyWith<$Res> get user {
    return $UserOutCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TokenResponse].
extension TokenResponsePatterns on TokenResponse {
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
    TResult Function(_TokenResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TokenResponse() when $default != null:
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
    TResult Function(_TokenResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenResponse():
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
    TResult? Function(_TokenResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenResponse() when $default != null:
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
            @JsonKey(name: 'access_token') String accessToken,
            @JsonKey(name: 'token_type') String tokenType,
            @JsonKey(name: 'expires_in_minutes') int expiresInMinutes,
            UserOut user)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TokenResponse() when $default != null:
        return $default(_that.accessToken, _that.tokenType,
            _that.expiresInMinutes, _that.user);
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
            @JsonKey(name: 'access_token') String accessToken,
            @JsonKey(name: 'token_type') String tokenType,
            @JsonKey(name: 'expires_in_minutes') int expiresInMinutes,
            UserOut user)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenResponse():
        return $default(_that.accessToken, _that.tokenType,
            _that.expiresInMinutes, _that.user);
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
            @JsonKey(name: 'access_token') String accessToken,
            @JsonKey(name: 'token_type') String tokenType,
            @JsonKey(name: 'expires_in_minutes') int expiresInMinutes,
            UserOut user)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TokenResponse() when $default != null:
        return $default(_that.accessToken, _that.tokenType,
            _that.expiresInMinutes, _that.user);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TokenResponse implements TokenResponse {
  const _TokenResponse(
      {@JsonKey(name: 'access_token') required this.accessToken,
      @JsonKey(name: 'token_type') this.tokenType = 'bearer',
      @JsonKey(name: 'expires_in_minutes') required this.expiresInMinutes,
      required this.user});
  factory _TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  @JsonKey(name: 'expires_in_minutes')
  final int expiresInMinutes;
  @override
  final UserOut user;

  /// Create a copy of TokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TokenResponseCopyWith<_TokenResponse> get copyWith =>
      __$TokenResponseCopyWithImpl<_TokenResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TokenResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TokenResponse &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresInMinutes, expiresInMinutes) ||
                other.expiresInMinutes == expiresInMinutes) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, tokenType, expiresInMinutes, user);

  @override
  String toString() {
    return 'TokenResponse(accessToken: $accessToken, tokenType: $tokenType, expiresInMinutes: $expiresInMinutes, user: $user)';
  }
}

/// @nodoc
abstract mixin class _$TokenResponseCopyWith<$Res>
    implements $TokenResponseCopyWith<$Res> {
  factory _$TokenResponseCopyWith(
          _TokenResponse value, $Res Function(_TokenResponse) _then) =
      __$TokenResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'access_token') String accessToken,
      @JsonKey(name: 'token_type') String tokenType,
      @JsonKey(name: 'expires_in_minutes') int expiresInMinutes,
      UserOut user});

  @override
  $UserOutCopyWith<$Res> get user;
}

/// @nodoc
class __$TokenResponseCopyWithImpl<$Res>
    implements _$TokenResponseCopyWith<$Res> {
  __$TokenResponseCopyWithImpl(this._self, this._then);

  final _TokenResponse _self;
  final $Res Function(_TokenResponse) _then;

  /// Create a copy of TokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? expiresInMinutes = null,
    Object? user = null,
  }) {
    return _then(_TokenResponse(
      accessToken: null == accessToken
          ? _self.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _self.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresInMinutes: null == expiresInMinutes
          ? _self.expiresInMinutes
          : expiresInMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserOut,
    ));
  }

  /// Create a copy of TokenResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserOutCopyWith<$Res> get user {
    return $UserOutCopyWith<$Res>(_self.user, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
