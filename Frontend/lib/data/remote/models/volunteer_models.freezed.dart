// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VolunteerProfile {
  String get id;
  @JsonKey(name: 'user_id')
  String get userId;
  String get name;
  String get phone;
  List<String> get skills;
  bool get available;
  double? get lat;
  double? get lng;
  double? get rating;

  /// Create a copy of VolunteerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VolunteerProfileCopyWith<VolunteerProfile> get copyWith =>
      _$VolunteerProfileCopyWithImpl<VolunteerProfile>(
          this as VolunteerProfile, _$identity);

  /// Serializes this VolunteerProfile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VolunteerProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other.skills, skills) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, name, phone,
      const DeepCollectionEquality().hash(skills), available, lat, lng, rating);

  @override
  String toString() {
    return 'VolunteerProfile(id: $id, userId: $userId, name: $name, phone: $phone, skills: $skills, available: $available, lat: $lat, lng: $lng, rating: $rating)';
  }
}

/// @nodoc
abstract mixin class $VolunteerProfileCopyWith<$Res> {
  factory $VolunteerProfileCopyWith(
          VolunteerProfile value, $Res Function(VolunteerProfile) _then) =
      _$VolunteerProfileCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String name,
      String phone,
      List<String> skills,
      bool available,
      double? lat,
      double? lng,
      double? rating});
}

/// @nodoc
class _$VolunteerProfileCopyWithImpl<$Res>
    implements $VolunteerProfileCopyWith<$Res> {
  _$VolunteerProfileCopyWithImpl(this._self, this._then);

  final VolunteerProfile _self;
  final $Res Function(VolunteerProfile) _then;

  /// Create a copy of VolunteerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? phone = null,
    Object? skills = null,
    Object? available = null,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? rating = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _self.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [VolunteerProfile].
extension VolunteerProfilePatterns on VolunteerProfile {
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
    TResult Function(_VolunteerProfile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VolunteerProfile() when $default != null:
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
    TResult Function(_VolunteerProfile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerProfile():
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
    TResult? Function(_VolunteerProfile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerProfile() when $default != null:
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
            @JsonKey(name: 'user_id') String userId,
            String name,
            String phone,
            List<String> skills,
            bool available,
            double? lat,
            double? lng,
            double? rating)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VolunteerProfile() when $default != null:
        return $default(_that.id, _that.userId, _that.name, _that.phone,
            _that.skills, _that.available, _that.lat, _that.lng, _that.rating);
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
            @JsonKey(name: 'user_id') String userId,
            String name,
            String phone,
            List<String> skills,
            bool available,
            double? lat,
            double? lng,
            double? rating)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerProfile():
        return $default(_that.id, _that.userId, _that.name, _that.phone,
            _that.skills, _that.available, _that.lat, _that.lng, _that.rating);
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
            @JsonKey(name: 'user_id') String userId,
            String name,
            String phone,
            List<String> skills,
            bool available,
            double? lat,
            double? lng,
            double? rating)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerProfile() when $default != null:
        return $default(_that.id, _that.userId, _that.name, _that.phone,
            _that.skills, _that.available, _that.lat, _that.lng, _that.rating);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VolunteerProfile implements VolunteerProfile {
  const _VolunteerProfile(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.name,
      required this.phone,
      final List<String> skills = const [],
      this.available = true,
      this.lat,
      this.lng,
      this.rating})
      : _skills = skills;
  factory _VolunteerProfile.fromJson(Map<String, dynamic> json) =>
      _$VolunteerProfileFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String name;
  @override
  final String phone;
  final List<String> _skills;
  @override
  @JsonKey()
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  @JsonKey()
  final bool available;
  @override
  final double? lat;
  @override
  final double? lng;
  @override
  final double? rating;

  /// Create a copy of VolunteerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VolunteerProfileCopyWith<_VolunteerProfile> get copyWith =>
      __$VolunteerProfileCopyWithImpl<_VolunteerProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VolunteerProfileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VolunteerProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      phone,
      const DeepCollectionEquality().hash(_skills),
      available,
      lat,
      lng,
      rating);

  @override
  String toString() {
    return 'VolunteerProfile(id: $id, userId: $userId, name: $name, phone: $phone, skills: $skills, available: $available, lat: $lat, lng: $lng, rating: $rating)';
  }
}

/// @nodoc
abstract mixin class _$VolunteerProfileCopyWith<$Res>
    implements $VolunteerProfileCopyWith<$Res> {
  factory _$VolunteerProfileCopyWith(
          _VolunteerProfile value, $Res Function(_VolunteerProfile) _then) =
      __$VolunteerProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String name,
      String phone,
      List<String> skills,
      bool available,
      double? lat,
      double? lng,
      double? rating});
}

/// @nodoc
class __$VolunteerProfileCopyWithImpl<$Res>
    implements _$VolunteerProfileCopyWith<$Res> {
  __$VolunteerProfileCopyWithImpl(this._self, this._then);

  final _VolunteerProfile _self;
  final $Res Function(_VolunteerProfile) _then;

  /// Create a copy of VolunteerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? phone = null,
    Object? skills = null,
    Object? available = null,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? rating = freezed,
  }) {
    return _then(_VolunteerProfile(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _self._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: freezed == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$VolunteerCreate {
  String get name;
  String get phone;
  List<String> get skills;
  bool get available;
  double get lat;
  double get lng;

  /// Create a copy of VolunteerCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VolunteerCreateCopyWith<VolunteerCreate> get copyWith =>
      _$VolunteerCreateCopyWithImpl<VolunteerCreate>(
          this as VolunteerCreate, _$identity);

  /// Serializes this VolunteerCreate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VolunteerCreate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other.skills, skills) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone,
      const DeepCollectionEquality().hash(skills), available, lat, lng);

  @override
  String toString() {
    return 'VolunteerCreate(name: $name, phone: $phone, skills: $skills, available: $available, lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class $VolunteerCreateCopyWith<$Res> {
  factory $VolunteerCreateCopyWith(
          VolunteerCreate value, $Res Function(VolunteerCreate) _then) =
      _$VolunteerCreateCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String phone,
      List<String> skills,
      bool available,
      double lat,
      double lng});
}

/// @nodoc
class _$VolunteerCreateCopyWithImpl<$Res>
    implements $VolunteerCreateCopyWith<$Res> {
  _$VolunteerCreateCopyWithImpl(this._self, this._then);

  final VolunteerCreate _self;
  final $Res Function(VolunteerCreate) _then;

  /// Create a copy of VolunteerCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? skills = null,
    Object? available = null,
    Object? lat = null,
    Object? lng = null,
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
      skills: null == skills
          ? _self.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [VolunteerCreate].
extension VolunteerCreatePatterns on VolunteerCreate {
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
    TResult Function(_VolunteerCreate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VolunteerCreate() when $default != null:
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
    TResult Function(_VolunteerCreate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerCreate():
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
    TResult? Function(_VolunteerCreate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerCreate() when $default != null:
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
    TResult Function(String name, String phone, List<String> skills,
            bool available, double lat, double lng)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VolunteerCreate() when $default != null:
        return $default(_that.name, _that.phone, _that.skills, _that.available,
            _that.lat, _that.lng);
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
    TResult Function(String name, String phone, List<String> skills,
            bool available, double lat, double lng)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerCreate():
        return $default(_that.name, _that.phone, _that.skills, _that.available,
            _that.lat, _that.lng);
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
    TResult? Function(String name, String phone, List<String> skills,
            bool available, double lat, double lng)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerCreate() when $default != null:
        return $default(_that.name, _that.phone, _that.skills, _that.available,
            _that.lat, _that.lng);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VolunteerCreate implements VolunteerCreate {
  const _VolunteerCreate(
      {required this.name,
      required this.phone,
      final List<String> skills = const [],
      this.available = true,
      required this.lat,
      required this.lng})
      : _skills = skills;
  factory _VolunteerCreate.fromJson(Map<String, dynamic> json) =>
      _$VolunteerCreateFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  final List<String> _skills;
  @override
  @JsonKey()
  List<String> get skills {
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_skills);
  }

  @override
  @JsonKey()
  final bool available;
  @override
  final double lat;
  @override
  final double lng;

  /// Create a copy of VolunteerCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VolunteerCreateCopyWith<_VolunteerCreate> get copyWith =>
      __$VolunteerCreateCopyWithImpl<_VolunteerCreate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VolunteerCreateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VolunteerCreate &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone,
      const DeepCollectionEquality().hash(_skills), available, lat, lng);

  @override
  String toString() {
    return 'VolunteerCreate(name: $name, phone: $phone, skills: $skills, available: $available, lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class _$VolunteerCreateCopyWith<$Res>
    implements $VolunteerCreateCopyWith<$Res> {
  factory _$VolunteerCreateCopyWith(
          _VolunteerCreate value, $Res Function(_VolunteerCreate) _then) =
      __$VolunteerCreateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String phone,
      List<String> skills,
      bool available,
      double lat,
      double lng});
}

/// @nodoc
class __$VolunteerCreateCopyWithImpl<$Res>
    implements _$VolunteerCreateCopyWith<$Res> {
  __$VolunteerCreateCopyWithImpl(this._self, this._then);

  final _VolunteerCreate _self;
  final $Res Function(_VolunteerCreate) _then;

  /// Create a copy of VolunteerCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? skills = null,
    Object? available = null,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_VolunteerCreate(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      skills: null == skills
          ? _self._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$VolunteerRespondPayload {
  String get action; // 'accept' | 'decline'
  String? get note;

  /// Create a copy of VolunteerRespondPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VolunteerRespondPayloadCopyWith<VolunteerRespondPayload> get copyWith =>
      _$VolunteerRespondPayloadCopyWithImpl<VolunteerRespondPayload>(
          this as VolunteerRespondPayload, _$identity);

  /// Serializes this VolunteerRespondPayload to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VolunteerRespondPayload &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, action, note);

  @override
  String toString() {
    return 'VolunteerRespondPayload(action: $action, note: $note)';
  }
}

/// @nodoc
abstract mixin class $VolunteerRespondPayloadCopyWith<$Res> {
  factory $VolunteerRespondPayloadCopyWith(VolunteerRespondPayload value,
          $Res Function(VolunteerRespondPayload) _then) =
      _$VolunteerRespondPayloadCopyWithImpl;
  @useResult
  $Res call({String action, String? note});
}

/// @nodoc
class _$VolunteerRespondPayloadCopyWithImpl<$Res>
    implements $VolunteerRespondPayloadCopyWith<$Res> {
  _$VolunteerRespondPayloadCopyWithImpl(this._self, this._then);

  final VolunteerRespondPayload _self;
  final $Res Function(VolunteerRespondPayload) _then;

  /// Create a copy of VolunteerRespondPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? note = freezed,
  }) {
    return _then(_self.copyWith(
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [VolunteerRespondPayload].
extension VolunteerRespondPayloadPatterns on VolunteerRespondPayload {
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
    TResult Function(_VolunteerRespondPayload value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondPayload() when $default != null:
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
    TResult Function(_VolunteerRespondPayload value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondPayload():
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
    TResult? Function(_VolunteerRespondPayload value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondPayload() when $default != null:
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
    TResult Function(String action, String? note)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondPayload() when $default != null:
        return $default(_that.action, _that.note);
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
    TResult Function(String action, String? note) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondPayload():
        return $default(_that.action, _that.note);
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
    TResult? Function(String action, String? note)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondPayload() when $default != null:
        return $default(_that.action, _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VolunteerRespondPayload implements VolunteerRespondPayload {
  const _VolunteerRespondPayload({required this.action, this.note});
  factory _VolunteerRespondPayload.fromJson(Map<String, dynamic> json) =>
      _$VolunteerRespondPayloadFromJson(json);

  @override
  final String action;
// 'accept' | 'decline'
  @override
  final String? note;

  /// Create a copy of VolunteerRespondPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VolunteerRespondPayloadCopyWith<_VolunteerRespondPayload> get copyWith =>
      __$VolunteerRespondPayloadCopyWithImpl<_VolunteerRespondPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VolunteerRespondPayloadToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VolunteerRespondPayload &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, action, note);

  @override
  String toString() {
    return 'VolunteerRespondPayload(action: $action, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$VolunteerRespondPayloadCopyWith<$Res>
    implements $VolunteerRespondPayloadCopyWith<$Res> {
  factory _$VolunteerRespondPayloadCopyWith(_VolunteerRespondPayload value,
          $Res Function(_VolunteerRespondPayload) _then) =
      __$VolunteerRespondPayloadCopyWithImpl;
  @override
  @useResult
  $Res call({String action, String? note});
}

/// @nodoc
class __$VolunteerRespondPayloadCopyWithImpl<$Res>
    implements _$VolunteerRespondPayloadCopyWith<$Res> {
  __$VolunteerRespondPayloadCopyWithImpl(this._self, this._then);

  final _VolunteerRespondPayload _self;
  final $Res Function(_VolunteerRespondPayload) _then;

  /// Create a copy of VolunteerRespondPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? action = null,
    Object? note = freezed,
  }) {
    return _then(_VolunteerRespondPayload(
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$VolunteerRespondResult {
  String get status;
  @JsonKey(name: 'incident_id')
  String get incidentId;
  @JsonKey(name: 'volunteer_id')
  String get volunteerId;
  @JsonKey(name: 'incident_status')
  String get incidentStatus;

  /// Create a copy of VolunteerRespondResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VolunteerRespondResultCopyWith<VolunteerRespondResult> get copyWith =>
      _$VolunteerRespondResultCopyWithImpl<VolunteerRespondResult>(
          this as VolunteerRespondResult, _$identity);

  /// Serializes this VolunteerRespondResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VolunteerRespondResult &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId) &&
            (identical(other.volunteerId, volunteerId) ||
                other.volunteerId == volunteerId) &&
            (identical(other.incidentStatus, incidentStatus) ||
                other.incidentStatus == incidentStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, incidentId, volunteerId, incidentStatus);

  @override
  String toString() {
    return 'VolunteerRespondResult(status: $status, incidentId: $incidentId, volunteerId: $volunteerId, incidentStatus: $incidentStatus)';
  }
}

/// @nodoc
abstract mixin class $VolunteerRespondResultCopyWith<$Res> {
  factory $VolunteerRespondResultCopyWith(VolunteerRespondResult value,
          $Res Function(VolunteerRespondResult) _then) =
      _$VolunteerRespondResultCopyWithImpl;
  @useResult
  $Res call(
      {String status,
      @JsonKey(name: 'incident_id') String incidentId,
      @JsonKey(name: 'volunteer_id') String volunteerId,
      @JsonKey(name: 'incident_status') String incidentStatus});
}

/// @nodoc
class _$VolunteerRespondResultCopyWithImpl<$Res>
    implements $VolunteerRespondResultCopyWith<$Res> {
  _$VolunteerRespondResultCopyWithImpl(this._self, this._then);

  final VolunteerRespondResult _self;
  final $Res Function(VolunteerRespondResult) _then;

  /// Create a copy of VolunteerRespondResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? incidentId = null,
    Object? volunteerId = null,
    Object? incidentStatus = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      incidentId: null == incidentId
          ? _self.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      volunteerId: null == volunteerId
          ? _self.volunteerId
          : volunteerId // ignore: cast_nullable_to_non_nullable
              as String,
      incidentStatus: null == incidentStatus
          ? _self.incidentStatus
          : incidentStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [VolunteerRespondResult].
extension VolunteerRespondResultPatterns on VolunteerRespondResult {
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
    TResult Function(_VolunteerRespondResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondResult() when $default != null:
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
    TResult Function(_VolunteerRespondResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondResult():
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
    TResult? Function(_VolunteerRespondResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondResult() when $default != null:
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
            String status,
            @JsonKey(name: 'incident_id') String incidentId,
            @JsonKey(name: 'volunteer_id') String volunteerId,
            @JsonKey(name: 'incident_status') String incidentStatus)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondResult() when $default != null:
        return $default(_that.status, _that.incidentId, _that.volunteerId,
            _that.incidentStatus);
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
            String status,
            @JsonKey(name: 'incident_id') String incidentId,
            @JsonKey(name: 'volunteer_id') String volunteerId,
            @JsonKey(name: 'incident_status') String incidentStatus)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondResult():
        return $default(_that.status, _that.incidentId, _that.volunteerId,
            _that.incidentStatus);
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
            String status,
            @JsonKey(name: 'incident_id') String incidentId,
            @JsonKey(name: 'volunteer_id') String volunteerId,
            @JsonKey(name: 'incident_status') String incidentStatus)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VolunteerRespondResult() when $default != null:
        return $default(_that.status, _that.incidentId, _that.volunteerId,
            _that.incidentStatus);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VolunteerRespondResult implements VolunteerRespondResult {
  const _VolunteerRespondResult(
      {required this.status,
      @JsonKey(name: 'incident_id') required this.incidentId,
      @JsonKey(name: 'volunteer_id') required this.volunteerId,
      @JsonKey(name: 'incident_status') required this.incidentStatus});
  factory _VolunteerRespondResult.fromJson(Map<String, dynamic> json) =>
      _$VolunteerRespondResultFromJson(json);

  @override
  final String status;
  @override
  @JsonKey(name: 'incident_id')
  final String incidentId;
  @override
  @JsonKey(name: 'volunteer_id')
  final String volunteerId;
  @override
  @JsonKey(name: 'incident_status')
  final String incidentStatus;

  /// Create a copy of VolunteerRespondResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VolunteerRespondResultCopyWith<_VolunteerRespondResult> get copyWith =>
      __$VolunteerRespondResultCopyWithImpl<_VolunteerRespondResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VolunteerRespondResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VolunteerRespondResult &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId) &&
            (identical(other.volunteerId, volunteerId) ||
                other.volunteerId == volunteerId) &&
            (identical(other.incidentStatus, incidentStatus) ||
                other.incidentStatus == incidentStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, incidentId, volunteerId, incidentStatus);

  @override
  String toString() {
    return 'VolunteerRespondResult(status: $status, incidentId: $incidentId, volunteerId: $volunteerId, incidentStatus: $incidentStatus)';
  }
}

/// @nodoc
abstract mixin class _$VolunteerRespondResultCopyWith<$Res>
    implements $VolunteerRespondResultCopyWith<$Res> {
  factory _$VolunteerRespondResultCopyWith(_VolunteerRespondResult value,
          $Res Function(_VolunteerRespondResult) _then) =
      __$VolunteerRespondResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String status,
      @JsonKey(name: 'incident_id') String incidentId,
      @JsonKey(name: 'volunteer_id') String volunteerId,
      @JsonKey(name: 'incident_status') String incidentStatus});
}

/// @nodoc
class __$VolunteerRespondResultCopyWithImpl<$Res>
    implements _$VolunteerRespondResultCopyWith<$Res> {
  __$VolunteerRespondResultCopyWithImpl(this._self, this._then);

  final _VolunteerRespondResult _self;
  final $Res Function(_VolunteerRespondResult) _then;

  /// Create a copy of VolunteerRespondResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? incidentId = null,
    Object? volunteerId = null,
    Object? incidentStatus = null,
  }) {
    return _then(_VolunteerRespondResult(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      incidentId: null == incidentId
          ? _self.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      volunteerId: null == volunteerId
          ? _self.volunteerId
          : volunteerId // ignore: cast_nullable_to_non_nullable
              as String,
      incidentStatus: null == incidentStatus
          ? _self.incidentStatus
          : incidentStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$DashboardIncident {
  String get id;
  @JsonKey(name: 'user_id')
  String get userId;
  String get priority;
  String get status;
  String get source;
  bool get silent;
  @JsonKey(name: 'bystander_mode')
  bool get bystanderMode;
  double get lat;
  double get lng;
  @JsonKey(name: 'description_preview')
  String? get descriptionPreview;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'age_seconds')
  int get ageSeconds;
  @JsonKey(name: 'notifications_sent')
  int get notificationsSent;
  @JsonKey(name: 'feedback_rating')
  double? get feedbackRating;
  @JsonKey(name: 'is_mci')
  bool get isMci;
  @JsonKey(name: 'cluster_id')
  String? get clusterId;

  /// Create a copy of DashboardIncident
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardIncidentCopyWith<DashboardIncident> get copyWith =>
      _$DashboardIncidentCopyWithImpl<DashboardIncident>(
          this as DashboardIncident, _$identity);

  /// Serializes this DashboardIncident to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardIncident &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.silent, silent) || other.silent == silent) &&
            (identical(other.bystanderMode, bystanderMode) ||
                other.bystanderMode == bystanderMode) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.descriptionPreview, descriptionPreview) ||
                other.descriptionPreview == descriptionPreview) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.ageSeconds, ageSeconds) ||
                other.ageSeconds == ageSeconds) &&
            (identical(other.notificationsSent, notificationsSent) ||
                other.notificationsSent == notificationsSent) &&
            (identical(other.feedbackRating, feedbackRating) ||
                other.feedbackRating == feedbackRating) &&
            (identical(other.isMci, isMci) || other.isMci == isMci) &&
            (identical(other.clusterId, clusterId) ||
                other.clusterId == clusterId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      priority,
      status,
      source,
      silent,
      bystanderMode,
      lat,
      lng,
      descriptionPreview,
      createdAt,
      ageSeconds,
      notificationsSent,
      feedbackRating,
      isMci,
      clusterId);

  @override
  String toString() {
    return 'DashboardIncident(id: $id, userId: $userId, priority: $priority, status: $status, source: $source, silent: $silent, bystanderMode: $bystanderMode, lat: $lat, lng: $lng, descriptionPreview: $descriptionPreview, createdAt: $createdAt, ageSeconds: $ageSeconds, notificationsSent: $notificationsSent, feedbackRating: $feedbackRating, isMci: $isMci, clusterId: $clusterId)';
  }
}

/// @nodoc
abstract mixin class $DashboardIncidentCopyWith<$Res> {
  factory $DashboardIncidentCopyWith(
          DashboardIncident value, $Res Function(DashboardIncident) _then) =
      _$DashboardIncidentCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String priority,
      String status,
      String source,
      bool silent,
      @JsonKey(name: 'bystander_mode') bool bystanderMode,
      double lat,
      double lng,
      @JsonKey(name: 'description_preview') String? descriptionPreview,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'age_seconds') int ageSeconds,
      @JsonKey(name: 'notifications_sent') int notificationsSent,
      @JsonKey(name: 'feedback_rating') double? feedbackRating,
      @JsonKey(name: 'is_mci') bool isMci,
      @JsonKey(name: 'cluster_id') String? clusterId});
}

/// @nodoc
class _$DashboardIncidentCopyWithImpl<$Res>
    implements $DashboardIncidentCopyWith<$Res> {
  _$DashboardIncidentCopyWithImpl(this._self, this._then);

  final DashboardIncident _self;
  final $Res Function(DashboardIncident) _then;

  /// Create a copy of DashboardIncident
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? priority = null,
    Object? status = null,
    Object? source = null,
    Object? silent = null,
    Object? bystanderMode = null,
    Object? lat = null,
    Object? lng = null,
    Object? descriptionPreview = freezed,
    Object? createdAt = null,
    Object? ageSeconds = null,
    Object? notificationsSent = null,
    Object? feedbackRating = freezed,
    Object? isMci = null,
    Object? clusterId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      silent: null == silent
          ? _self.silent
          : silent // ignore: cast_nullable_to_non_nullable
              as bool,
      bystanderMode: null == bystanderMode
          ? _self.bystanderMode
          : bystanderMode // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      descriptionPreview: freezed == descriptionPreview
          ? _self.descriptionPreview
          : descriptionPreview // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      ageSeconds: null == ageSeconds
          ? _self.ageSeconds
          : ageSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      notificationsSent: null == notificationsSent
          ? _self.notificationsSent
          : notificationsSent // ignore: cast_nullable_to_non_nullable
              as int,
      feedbackRating: freezed == feedbackRating
          ? _self.feedbackRating
          : feedbackRating // ignore: cast_nullable_to_non_nullable
              as double?,
      isMci: null == isMci
          ? _self.isMci
          : isMci // ignore: cast_nullable_to_non_nullable
              as bool,
      clusterId: freezed == clusterId
          ? _self.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [DashboardIncident].
extension DashboardIncidentPatterns on DashboardIncident {
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
    TResult Function(_DashboardIncident value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardIncident() when $default != null:
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
    TResult Function(_DashboardIncident value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardIncident():
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
    TResult? Function(_DashboardIncident value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardIncident() when $default != null:
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
            @JsonKey(name: 'user_id') String userId,
            String priority,
            String status,
            String source,
            bool silent,
            @JsonKey(name: 'bystander_mode') bool bystanderMode,
            double lat,
            double lng,
            @JsonKey(name: 'description_preview') String? descriptionPreview,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'age_seconds') int ageSeconds,
            @JsonKey(name: 'notifications_sent') int notificationsSent,
            @JsonKey(name: 'feedback_rating') double? feedbackRating,
            @JsonKey(name: 'is_mci') bool isMci,
            @JsonKey(name: 'cluster_id') String? clusterId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardIncident() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.priority,
            _that.status,
            _that.source,
            _that.silent,
            _that.bystanderMode,
            _that.lat,
            _that.lng,
            _that.descriptionPreview,
            _that.createdAt,
            _that.ageSeconds,
            _that.notificationsSent,
            _that.feedbackRating,
            _that.isMci,
            _that.clusterId);
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
            @JsonKey(name: 'user_id') String userId,
            String priority,
            String status,
            String source,
            bool silent,
            @JsonKey(name: 'bystander_mode') bool bystanderMode,
            double lat,
            double lng,
            @JsonKey(name: 'description_preview') String? descriptionPreview,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'age_seconds') int ageSeconds,
            @JsonKey(name: 'notifications_sent') int notificationsSent,
            @JsonKey(name: 'feedback_rating') double? feedbackRating,
            @JsonKey(name: 'is_mci') bool isMci,
            @JsonKey(name: 'cluster_id') String? clusterId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardIncident():
        return $default(
            _that.id,
            _that.userId,
            _that.priority,
            _that.status,
            _that.source,
            _that.silent,
            _that.bystanderMode,
            _that.lat,
            _that.lng,
            _that.descriptionPreview,
            _that.createdAt,
            _that.ageSeconds,
            _that.notificationsSent,
            _that.feedbackRating,
            _that.isMci,
            _that.clusterId);
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
            @JsonKey(name: 'user_id') String userId,
            String priority,
            String status,
            String source,
            bool silent,
            @JsonKey(name: 'bystander_mode') bool bystanderMode,
            double lat,
            double lng,
            @JsonKey(name: 'description_preview') String? descriptionPreview,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'age_seconds') int ageSeconds,
            @JsonKey(name: 'notifications_sent') int notificationsSent,
            @JsonKey(name: 'feedback_rating') double? feedbackRating,
            @JsonKey(name: 'is_mci') bool isMci,
            @JsonKey(name: 'cluster_id') String? clusterId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardIncident() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.priority,
            _that.status,
            _that.source,
            _that.silent,
            _that.bystanderMode,
            _that.lat,
            _that.lng,
            _that.descriptionPreview,
            _that.createdAt,
            _that.ageSeconds,
            _that.notificationsSent,
            _that.feedbackRating,
            _that.isMci,
            _that.clusterId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardIncident implements DashboardIncident {
  const _DashboardIncident(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.priority,
      required this.status,
      required this.source,
      this.silent = false,
      @JsonKey(name: 'bystander_mode') this.bystanderMode = false,
      required this.lat,
      required this.lng,
      @JsonKey(name: 'description_preview') this.descriptionPreview,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'age_seconds') required this.ageSeconds,
      @JsonKey(name: 'notifications_sent') this.notificationsSent = 0,
      @JsonKey(name: 'feedback_rating') this.feedbackRating,
      @JsonKey(name: 'is_mci') this.isMci = false,
      @JsonKey(name: 'cluster_id') this.clusterId});
  factory _DashboardIncident.fromJson(Map<String, dynamic> json) =>
      _$DashboardIncidentFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String priority;
  @override
  final String status;
  @override
  final String source;
  @override
  @JsonKey()
  final bool silent;
  @override
  @JsonKey(name: 'bystander_mode')
  final bool bystanderMode;
  @override
  final double lat;
  @override
  final double lng;
  @override
  @JsonKey(name: 'description_preview')
  final String? descriptionPreview;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'age_seconds')
  final int ageSeconds;
  @override
  @JsonKey(name: 'notifications_sent')
  final int notificationsSent;
  @override
  @JsonKey(name: 'feedback_rating')
  final double? feedbackRating;
  @override
  @JsonKey(name: 'is_mci')
  final bool isMci;
  @override
  @JsonKey(name: 'cluster_id')
  final String? clusterId;

  /// Create a copy of DashboardIncident
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardIncidentCopyWith<_DashboardIncident> get copyWith =>
      __$DashboardIncidentCopyWithImpl<_DashboardIncident>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardIncidentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardIncident &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.silent, silent) || other.silent == silent) &&
            (identical(other.bystanderMode, bystanderMode) ||
                other.bystanderMode == bystanderMode) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.descriptionPreview, descriptionPreview) ||
                other.descriptionPreview == descriptionPreview) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.ageSeconds, ageSeconds) ||
                other.ageSeconds == ageSeconds) &&
            (identical(other.notificationsSent, notificationsSent) ||
                other.notificationsSent == notificationsSent) &&
            (identical(other.feedbackRating, feedbackRating) ||
                other.feedbackRating == feedbackRating) &&
            (identical(other.isMci, isMci) || other.isMci == isMci) &&
            (identical(other.clusterId, clusterId) ||
                other.clusterId == clusterId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      priority,
      status,
      source,
      silent,
      bystanderMode,
      lat,
      lng,
      descriptionPreview,
      createdAt,
      ageSeconds,
      notificationsSent,
      feedbackRating,
      isMci,
      clusterId);

  @override
  String toString() {
    return 'DashboardIncident(id: $id, userId: $userId, priority: $priority, status: $status, source: $source, silent: $silent, bystanderMode: $bystanderMode, lat: $lat, lng: $lng, descriptionPreview: $descriptionPreview, createdAt: $createdAt, ageSeconds: $ageSeconds, notificationsSent: $notificationsSent, feedbackRating: $feedbackRating, isMci: $isMci, clusterId: $clusterId)';
  }
}

/// @nodoc
abstract mixin class _$DashboardIncidentCopyWith<$Res>
    implements $DashboardIncidentCopyWith<$Res> {
  factory _$DashboardIncidentCopyWith(
          _DashboardIncident value, $Res Function(_DashboardIncident) _then) =
      __$DashboardIncidentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String priority,
      String status,
      String source,
      bool silent,
      @JsonKey(name: 'bystander_mode') bool bystanderMode,
      double lat,
      double lng,
      @JsonKey(name: 'description_preview') String? descriptionPreview,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'age_seconds') int ageSeconds,
      @JsonKey(name: 'notifications_sent') int notificationsSent,
      @JsonKey(name: 'feedback_rating') double? feedbackRating,
      @JsonKey(name: 'is_mci') bool isMci,
      @JsonKey(name: 'cluster_id') String? clusterId});
}

/// @nodoc
class __$DashboardIncidentCopyWithImpl<$Res>
    implements _$DashboardIncidentCopyWith<$Res> {
  __$DashboardIncidentCopyWithImpl(this._self, this._then);

  final _DashboardIncident _self;
  final $Res Function(_DashboardIncident) _then;

  /// Create a copy of DashboardIncident
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? priority = null,
    Object? status = null,
    Object? source = null,
    Object? silent = null,
    Object? bystanderMode = null,
    Object? lat = null,
    Object? lng = null,
    Object? descriptionPreview = freezed,
    Object? createdAt = null,
    Object? ageSeconds = null,
    Object? notificationsSent = null,
    Object? feedbackRating = freezed,
    Object? isMci = null,
    Object? clusterId = freezed,
  }) {
    return _then(_DashboardIncident(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _self.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      silent: null == silent
          ? _self.silent
          : silent // ignore: cast_nullable_to_non_nullable
              as bool,
      bystanderMode: null == bystanderMode
          ? _self.bystanderMode
          : bystanderMode // ignore: cast_nullable_to_non_nullable
              as bool,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      descriptionPreview: freezed == descriptionPreview
          ? _self.descriptionPreview
          : descriptionPreview // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      ageSeconds: null == ageSeconds
          ? _self.ageSeconds
          : ageSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      notificationsSent: null == notificationsSent
          ? _self.notificationsSent
          : notificationsSent // ignore: cast_nullable_to_non_nullable
              as int,
      feedbackRating: freezed == feedbackRating
          ? _self.feedbackRating
          : feedbackRating // ignore: cast_nullable_to_non_nullable
              as double?,
      isMci: null == isMci
          ? _self.isMci
          : isMci // ignore: cast_nullable_to_non_nullable
              as bool,
      clusterId: freezed == clusterId
          ? _self.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$DashboardMetrics {
  @JsonKey(name: 'window_hours')
  int get windowHours;
  @JsonKey(name: 'active_incidents')
  int get activeIncidents;
  @JsonKey(name: 'escalated_incidents')
  int get escalatedIncidents;
  @JsonKey(name: 'resolved_incidents')
  int get resolvedIncidents;
  @JsonKey(name: 'cancelled_incidents')
  int get cancelledIncidents;
  @JsonKey(name: 'avg_resolution_seconds')
  double? get avgResolutionSeconds;
  @JsonKey(name: 'avg_feedback_rating')
  double? get avgFeedbackRating;
  @JsonKey(name: 'incidents_by_priority')
  Map<String, int> get incidentsByPriority;
  @JsonKey(name: 'notifications_by_channel')
  Map<String, int> get notificationsByChannel;

  /// Create a copy of DashboardMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardMetricsCopyWith<DashboardMetrics> get copyWith =>
      _$DashboardMetricsCopyWithImpl<DashboardMetrics>(
          this as DashboardMetrics, _$identity);

  /// Serializes this DashboardMetrics to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardMetrics &&
            (identical(other.windowHours, windowHours) ||
                other.windowHours == windowHours) &&
            (identical(other.activeIncidents, activeIncidents) ||
                other.activeIncidents == activeIncidents) &&
            (identical(other.escalatedIncidents, escalatedIncidents) ||
                other.escalatedIncidents == escalatedIncidents) &&
            (identical(other.resolvedIncidents, resolvedIncidents) ||
                other.resolvedIncidents == resolvedIncidents) &&
            (identical(other.cancelledIncidents, cancelledIncidents) ||
                other.cancelledIncidents == cancelledIncidents) &&
            (identical(other.avgResolutionSeconds, avgResolutionSeconds) ||
                other.avgResolutionSeconds == avgResolutionSeconds) &&
            (identical(other.avgFeedbackRating, avgFeedbackRating) ||
                other.avgFeedbackRating == avgFeedbackRating) &&
            const DeepCollectionEquality()
                .equals(other.incidentsByPriority, incidentsByPriority) &&
            const DeepCollectionEquality()
                .equals(other.notificationsByChannel, notificationsByChannel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      windowHours,
      activeIncidents,
      escalatedIncidents,
      resolvedIncidents,
      cancelledIncidents,
      avgResolutionSeconds,
      avgFeedbackRating,
      const DeepCollectionEquality().hash(incidentsByPriority),
      const DeepCollectionEquality().hash(notificationsByChannel));

  @override
  String toString() {
    return 'DashboardMetrics(windowHours: $windowHours, activeIncidents: $activeIncidents, escalatedIncidents: $escalatedIncidents, resolvedIncidents: $resolvedIncidents, cancelledIncidents: $cancelledIncidents, avgResolutionSeconds: $avgResolutionSeconds, avgFeedbackRating: $avgFeedbackRating, incidentsByPriority: $incidentsByPriority, notificationsByChannel: $notificationsByChannel)';
  }
}

/// @nodoc
abstract mixin class $DashboardMetricsCopyWith<$Res> {
  factory $DashboardMetricsCopyWith(
          DashboardMetrics value, $Res Function(DashboardMetrics) _then) =
      _$DashboardMetricsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'window_hours') int windowHours,
      @JsonKey(name: 'active_incidents') int activeIncidents,
      @JsonKey(name: 'escalated_incidents') int escalatedIncidents,
      @JsonKey(name: 'resolved_incidents') int resolvedIncidents,
      @JsonKey(name: 'cancelled_incidents') int cancelledIncidents,
      @JsonKey(name: 'avg_resolution_seconds') double? avgResolutionSeconds,
      @JsonKey(name: 'avg_feedback_rating') double? avgFeedbackRating,
      @JsonKey(name: 'incidents_by_priority')
      Map<String, int> incidentsByPriority,
      @JsonKey(name: 'notifications_by_channel')
      Map<String, int> notificationsByChannel});
}

/// @nodoc
class _$DashboardMetricsCopyWithImpl<$Res>
    implements $DashboardMetricsCopyWith<$Res> {
  _$DashboardMetricsCopyWithImpl(this._self, this._then);

  final DashboardMetrics _self;
  final $Res Function(DashboardMetrics) _then;

  /// Create a copy of DashboardMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? windowHours = null,
    Object? activeIncidents = null,
    Object? escalatedIncidents = null,
    Object? resolvedIncidents = null,
    Object? cancelledIncidents = null,
    Object? avgResolutionSeconds = freezed,
    Object? avgFeedbackRating = freezed,
    Object? incidentsByPriority = null,
    Object? notificationsByChannel = null,
  }) {
    return _then(_self.copyWith(
      windowHours: null == windowHours
          ? _self.windowHours
          : windowHours // ignore: cast_nullable_to_non_nullable
              as int,
      activeIncidents: null == activeIncidents
          ? _self.activeIncidents
          : activeIncidents // ignore: cast_nullable_to_non_nullable
              as int,
      escalatedIncidents: null == escalatedIncidents
          ? _self.escalatedIncidents
          : escalatedIncidents // ignore: cast_nullable_to_non_nullable
              as int,
      resolvedIncidents: null == resolvedIncidents
          ? _self.resolvedIncidents
          : resolvedIncidents // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledIncidents: null == cancelledIncidents
          ? _self.cancelledIncidents
          : cancelledIncidents // ignore: cast_nullable_to_non_nullable
              as int,
      avgResolutionSeconds: freezed == avgResolutionSeconds
          ? _self.avgResolutionSeconds
          : avgResolutionSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      avgFeedbackRating: freezed == avgFeedbackRating
          ? _self.avgFeedbackRating
          : avgFeedbackRating // ignore: cast_nullable_to_non_nullable
              as double?,
      incidentsByPriority: null == incidentsByPriority
          ? _self.incidentsByPriority
          : incidentsByPriority // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      notificationsByChannel: null == notificationsByChannel
          ? _self.notificationsByChannel
          : notificationsByChannel // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// Adds pattern-matching-related methods to [DashboardMetrics].
extension DashboardMetricsPatterns on DashboardMetrics {
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
    TResult Function(_DashboardMetrics value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardMetrics() when $default != null:
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
    TResult Function(_DashboardMetrics value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardMetrics():
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
    TResult? Function(_DashboardMetrics value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardMetrics() when $default != null:
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
            @JsonKey(name: 'window_hours') int windowHours,
            @JsonKey(name: 'active_incidents') int activeIncidents,
            @JsonKey(name: 'escalated_incidents') int escalatedIncidents,
            @JsonKey(name: 'resolved_incidents') int resolvedIncidents,
            @JsonKey(name: 'cancelled_incidents') int cancelledIncidents,
            @JsonKey(name: 'avg_resolution_seconds')
            double? avgResolutionSeconds,
            @JsonKey(name: 'avg_feedback_rating') double? avgFeedbackRating,
            @JsonKey(name: 'incidents_by_priority')
            Map<String, int> incidentsByPriority,
            @JsonKey(name: 'notifications_by_channel')
            Map<String, int> notificationsByChannel)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DashboardMetrics() when $default != null:
        return $default(
            _that.windowHours,
            _that.activeIncidents,
            _that.escalatedIncidents,
            _that.resolvedIncidents,
            _that.cancelledIncidents,
            _that.avgResolutionSeconds,
            _that.avgFeedbackRating,
            _that.incidentsByPriority,
            _that.notificationsByChannel);
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
            @JsonKey(name: 'window_hours') int windowHours,
            @JsonKey(name: 'active_incidents') int activeIncidents,
            @JsonKey(name: 'escalated_incidents') int escalatedIncidents,
            @JsonKey(name: 'resolved_incidents') int resolvedIncidents,
            @JsonKey(name: 'cancelled_incidents') int cancelledIncidents,
            @JsonKey(name: 'avg_resolution_seconds')
            double? avgResolutionSeconds,
            @JsonKey(name: 'avg_feedback_rating') double? avgFeedbackRating,
            @JsonKey(name: 'incidents_by_priority')
            Map<String, int> incidentsByPriority,
            @JsonKey(name: 'notifications_by_channel')
            Map<String, int> notificationsByChannel)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardMetrics():
        return $default(
            _that.windowHours,
            _that.activeIncidents,
            _that.escalatedIncidents,
            _that.resolvedIncidents,
            _that.cancelledIncidents,
            _that.avgResolutionSeconds,
            _that.avgFeedbackRating,
            _that.incidentsByPriority,
            _that.notificationsByChannel);
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
            @JsonKey(name: 'window_hours') int windowHours,
            @JsonKey(name: 'active_incidents') int activeIncidents,
            @JsonKey(name: 'escalated_incidents') int escalatedIncidents,
            @JsonKey(name: 'resolved_incidents') int resolvedIncidents,
            @JsonKey(name: 'cancelled_incidents') int cancelledIncidents,
            @JsonKey(name: 'avg_resolution_seconds')
            double? avgResolutionSeconds,
            @JsonKey(name: 'avg_feedback_rating') double? avgFeedbackRating,
            @JsonKey(name: 'incidents_by_priority')
            Map<String, int> incidentsByPriority,
            @JsonKey(name: 'notifications_by_channel')
            Map<String, int> notificationsByChannel)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DashboardMetrics() when $default != null:
        return $default(
            _that.windowHours,
            _that.activeIncidents,
            _that.escalatedIncidents,
            _that.resolvedIncidents,
            _that.cancelledIncidents,
            _that.avgResolutionSeconds,
            _that.avgFeedbackRating,
            _that.incidentsByPriority,
            _that.notificationsByChannel);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardMetrics implements DashboardMetrics {
  const _DashboardMetrics(
      {@JsonKey(name: 'window_hours') required this.windowHours,
      @JsonKey(name: 'active_incidents') this.activeIncidents = 0,
      @JsonKey(name: 'escalated_incidents') this.escalatedIncidents = 0,
      @JsonKey(name: 'resolved_incidents') this.resolvedIncidents = 0,
      @JsonKey(name: 'cancelled_incidents') this.cancelledIncidents = 0,
      @JsonKey(name: 'avg_resolution_seconds') this.avgResolutionSeconds,
      @JsonKey(name: 'avg_feedback_rating') this.avgFeedbackRating,
      @JsonKey(name: 'incidents_by_priority')
      final Map<String, int> incidentsByPriority = const {},
      @JsonKey(name: 'notifications_by_channel')
      final Map<String, int> notificationsByChannel = const {}})
      : _incidentsByPriority = incidentsByPriority,
        _notificationsByChannel = notificationsByChannel;
  factory _DashboardMetrics.fromJson(Map<String, dynamic> json) =>
      _$DashboardMetricsFromJson(json);

  @override
  @JsonKey(name: 'window_hours')
  final int windowHours;
  @override
  @JsonKey(name: 'active_incidents')
  final int activeIncidents;
  @override
  @JsonKey(name: 'escalated_incidents')
  final int escalatedIncidents;
  @override
  @JsonKey(name: 'resolved_incidents')
  final int resolvedIncidents;
  @override
  @JsonKey(name: 'cancelled_incidents')
  final int cancelledIncidents;
  @override
  @JsonKey(name: 'avg_resolution_seconds')
  final double? avgResolutionSeconds;
  @override
  @JsonKey(name: 'avg_feedback_rating')
  final double? avgFeedbackRating;
  final Map<String, int> _incidentsByPriority;
  @override
  @JsonKey(name: 'incidents_by_priority')
  Map<String, int> get incidentsByPriority {
    if (_incidentsByPriority is EqualUnmodifiableMapView)
      return _incidentsByPriority;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_incidentsByPriority);
  }

  final Map<String, int> _notificationsByChannel;
  @override
  @JsonKey(name: 'notifications_by_channel')
  Map<String, int> get notificationsByChannel {
    if (_notificationsByChannel is EqualUnmodifiableMapView)
      return _notificationsByChannel;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_notificationsByChannel);
  }

  /// Create a copy of DashboardMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardMetricsCopyWith<_DashboardMetrics> get copyWith =>
      __$DashboardMetricsCopyWithImpl<_DashboardMetrics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardMetricsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardMetrics &&
            (identical(other.windowHours, windowHours) ||
                other.windowHours == windowHours) &&
            (identical(other.activeIncidents, activeIncidents) ||
                other.activeIncidents == activeIncidents) &&
            (identical(other.escalatedIncidents, escalatedIncidents) ||
                other.escalatedIncidents == escalatedIncidents) &&
            (identical(other.resolvedIncidents, resolvedIncidents) ||
                other.resolvedIncidents == resolvedIncidents) &&
            (identical(other.cancelledIncidents, cancelledIncidents) ||
                other.cancelledIncidents == cancelledIncidents) &&
            (identical(other.avgResolutionSeconds, avgResolutionSeconds) ||
                other.avgResolutionSeconds == avgResolutionSeconds) &&
            (identical(other.avgFeedbackRating, avgFeedbackRating) ||
                other.avgFeedbackRating == avgFeedbackRating) &&
            const DeepCollectionEquality()
                .equals(other._incidentsByPriority, _incidentsByPriority) &&
            const DeepCollectionEquality().equals(
                other._notificationsByChannel, _notificationsByChannel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      windowHours,
      activeIncidents,
      escalatedIncidents,
      resolvedIncidents,
      cancelledIncidents,
      avgResolutionSeconds,
      avgFeedbackRating,
      const DeepCollectionEquality().hash(_incidentsByPriority),
      const DeepCollectionEquality().hash(_notificationsByChannel));

  @override
  String toString() {
    return 'DashboardMetrics(windowHours: $windowHours, activeIncidents: $activeIncidents, escalatedIncidents: $escalatedIncidents, resolvedIncidents: $resolvedIncidents, cancelledIncidents: $cancelledIncidents, avgResolutionSeconds: $avgResolutionSeconds, avgFeedbackRating: $avgFeedbackRating, incidentsByPriority: $incidentsByPriority, notificationsByChannel: $notificationsByChannel)';
  }
}

/// @nodoc
abstract mixin class _$DashboardMetricsCopyWith<$Res>
    implements $DashboardMetricsCopyWith<$Res> {
  factory _$DashboardMetricsCopyWith(
          _DashboardMetrics value, $Res Function(_DashboardMetrics) _then) =
      __$DashboardMetricsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'window_hours') int windowHours,
      @JsonKey(name: 'active_incidents') int activeIncidents,
      @JsonKey(name: 'escalated_incidents') int escalatedIncidents,
      @JsonKey(name: 'resolved_incidents') int resolvedIncidents,
      @JsonKey(name: 'cancelled_incidents') int cancelledIncidents,
      @JsonKey(name: 'avg_resolution_seconds') double? avgResolutionSeconds,
      @JsonKey(name: 'avg_feedback_rating') double? avgFeedbackRating,
      @JsonKey(name: 'incidents_by_priority')
      Map<String, int> incidentsByPriority,
      @JsonKey(name: 'notifications_by_channel')
      Map<String, int> notificationsByChannel});
}

/// @nodoc
class __$DashboardMetricsCopyWithImpl<$Res>
    implements _$DashboardMetricsCopyWith<$Res> {
  __$DashboardMetricsCopyWithImpl(this._self, this._then);

  final _DashboardMetrics _self;
  final $Res Function(_DashboardMetrics) _then;

  /// Create a copy of DashboardMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? windowHours = null,
    Object? activeIncidents = null,
    Object? escalatedIncidents = null,
    Object? resolvedIncidents = null,
    Object? cancelledIncidents = null,
    Object? avgResolutionSeconds = freezed,
    Object? avgFeedbackRating = freezed,
    Object? incidentsByPriority = null,
    Object? notificationsByChannel = null,
  }) {
    return _then(_DashboardMetrics(
      windowHours: null == windowHours
          ? _self.windowHours
          : windowHours // ignore: cast_nullable_to_non_nullable
              as int,
      activeIncidents: null == activeIncidents
          ? _self.activeIncidents
          : activeIncidents // ignore: cast_nullable_to_non_nullable
              as int,
      escalatedIncidents: null == escalatedIncidents
          ? _self.escalatedIncidents
          : escalatedIncidents // ignore: cast_nullable_to_non_nullable
              as int,
      resolvedIncidents: null == resolvedIncidents
          ? _self.resolvedIncidents
          : resolvedIncidents // ignore: cast_nullable_to_non_nullable
              as int,
      cancelledIncidents: null == cancelledIncidents
          ? _self.cancelledIncidents
          : cancelledIncidents // ignore: cast_nullable_to_non_nullable
              as int,
      avgResolutionSeconds: freezed == avgResolutionSeconds
          ? _self.avgResolutionSeconds
          : avgResolutionSeconds // ignore: cast_nullable_to_non_nullable
              as double?,
      avgFeedbackRating: freezed == avgFeedbackRating
          ? _self.avgFeedbackRating
          : avgFeedbackRating // ignore: cast_nullable_to_non_nullable
              as double?,
      incidentsByPriority: null == incidentsByPriority
          ? _self._incidentsByPriority
          : incidentsByPriority // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      notificationsByChannel: null == notificationsByChannel
          ? _self._notificationsByChannel
          : notificationsByChannel // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

// dart format on
