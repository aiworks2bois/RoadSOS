// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sos_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationPayload {
  double get lat;
  double get lng;
  @JsonKey(name: 'accuracy_m')
  double? get accuracyM;
  @JsonKey(name: 'speed_mps')
  double? get speedMps;
  @JsonKey(name: 'heading_deg')
  double? get headingDeg;

  /// Create a copy of LocationPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationPayloadCopyWith<LocationPayload> get copyWith =>
      _$LocationPayloadCopyWithImpl<LocationPayload>(
          this as LocationPayload, _$identity);

  /// Serializes this LocationPayload to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationPayload &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.accuracyM, accuracyM) ||
                other.accuracyM == accuracyM) &&
            (identical(other.speedMps, speedMps) ||
                other.speedMps == speedMps) &&
            (identical(other.headingDeg, headingDeg) ||
                other.headingDeg == headingDeg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, lng, accuracyM, speedMps, headingDeg);

  @override
  String toString() {
    return 'LocationPayload(lat: $lat, lng: $lng, accuracyM: $accuracyM, speedMps: $speedMps, headingDeg: $headingDeg)';
  }
}

/// @nodoc
abstract mixin class $LocationPayloadCopyWith<$Res> {
  factory $LocationPayloadCopyWith(
          LocationPayload value, $Res Function(LocationPayload) _then) =
      _$LocationPayloadCopyWithImpl;
  @useResult
  $Res call(
      {double lat,
      double lng,
      @JsonKey(name: 'accuracy_m') double? accuracyM,
      @JsonKey(name: 'speed_mps') double? speedMps,
      @JsonKey(name: 'heading_deg') double? headingDeg});
}

/// @nodoc
class _$LocationPayloadCopyWithImpl<$Res>
    implements $LocationPayloadCopyWith<$Res> {
  _$LocationPayloadCopyWithImpl(this._self, this._then);

  final LocationPayload _self;
  final $Res Function(LocationPayload) _then;

  /// Create a copy of LocationPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? accuracyM = freezed,
    Object? speedMps = freezed,
    Object? headingDeg = freezed,
  }) {
    return _then(_self.copyWith(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      accuracyM: freezed == accuracyM
          ? _self.accuracyM
          : accuracyM // ignore: cast_nullable_to_non_nullable
              as double?,
      speedMps: freezed == speedMps
          ? _self.speedMps
          : speedMps // ignore: cast_nullable_to_non_nullable
              as double?,
      headingDeg: freezed == headingDeg
          ? _self.headingDeg
          : headingDeg // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LocationPayload].
extension LocationPayloadPatterns on LocationPayload {
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
    TResult Function(_LocationPayload value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationPayload() when $default != null:
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
    TResult Function(_LocationPayload value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationPayload():
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
    TResult? Function(_LocationPayload value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationPayload() when $default != null:
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
            double lat,
            double lng,
            @JsonKey(name: 'accuracy_m') double? accuracyM,
            @JsonKey(name: 'speed_mps') double? speedMps,
            @JsonKey(name: 'heading_deg') double? headingDeg)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocationPayload() when $default != null:
        return $default(_that.lat, _that.lng, _that.accuracyM, _that.speedMps,
            _that.headingDeg);
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
            double lat,
            double lng,
            @JsonKey(name: 'accuracy_m') double? accuracyM,
            @JsonKey(name: 'speed_mps') double? speedMps,
            @JsonKey(name: 'heading_deg') double? headingDeg)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationPayload():
        return $default(_that.lat, _that.lng, _that.accuracyM, _that.speedMps,
            _that.headingDeg);
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
            double lat,
            double lng,
            @JsonKey(name: 'accuracy_m') double? accuracyM,
            @JsonKey(name: 'speed_mps') double? speedMps,
            @JsonKey(name: 'heading_deg') double? headingDeg)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocationPayload() when $default != null:
        return $default(_that.lat, _that.lng, _that.accuracyM, _that.speedMps,
            _that.headingDeg);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocationPayload implements LocationPayload {
  const _LocationPayload(
      {required this.lat,
      required this.lng,
      @JsonKey(name: 'accuracy_m') this.accuracyM,
      @JsonKey(name: 'speed_mps') this.speedMps,
      @JsonKey(name: 'heading_deg') this.headingDeg});
  factory _LocationPayload.fromJson(Map<String, dynamic> json) =>
      _$LocationPayloadFromJson(json);

  @override
  final double lat;
  @override
  final double lng;
  @override
  @JsonKey(name: 'accuracy_m')
  final double? accuracyM;
  @override
  @JsonKey(name: 'speed_mps')
  final double? speedMps;
  @override
  @JsonKey(name: 'heading_deg')
  final double? headingDeg;

  /// Create a copy of LocationPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationPayloadCopyWith<_LocationPayload> get copyWith =>
      __$LocationPayloadCopyWithImpl<_LocationPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationPayloadToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationPayload &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.accuracyM, accuracyM) ||
                other.accuracyM == accuracyM) &&
            (identical(other.speedMps, speedMps) ||
                other.speedMps == speedMps) &&
            (identical(other.headingDeg, headingDeg) ||
                other.headingDeg == headingDeg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, lng, accuracyM, speedMps, headingDeg);

  @override
  String toString() {
    return 'LocationPayload(lat: $lat, lng: $lng, accuracyM: $accuracyM, speedMps: $speedMps, headingDeg: $headingDeg)';
  }
}

/// @nodoc
abstract mixin class _$LocationPayloadCopyWith<$Res>
    implements $LocationPayloadCopyWith<$Res> {
  factory _$LocationPayloadCopyWith(
          _LocationPayload value, $Res Function(_LocationPayload) _then) =
      __$LocationPayloadCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double lat,
      double lng,
      @JsonKey(name: 'accuracy_m') double? accuracyM,
      @JsonKey(name: 'speed_mps') double? speedMps,
      @JsonKey(name: 'heading_deg') double? headingDeg});
}

/// @nodoc
class __$LocationPayloadCopyWithImpl<$Res>
    implements _$LocationPayloadCopyWith<$Res> {
  __$LocationPayloadCopyWithImpl(this._self, this._then);

  final _LocationPayload _self;
  final $Res Function(_LocationPayload) _then;

  /// Create a copy of LocationPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? accuracyM = freezed,
    Object? speedMps = freezed,
    Object? headingDeg = freezed,
  }) {
    return _then(_LocationPayload(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      accuracyM: freezed == accuracyM
          ? _self.accuracyM
          : accuracyM // ignore: cast_nullable_to_non_nullable
              as double?,
      speedMps: freezed == speedMps
          ? _self.speedMps
          : speedMps // ignore: cast_nullable_to_non_nullable
              as double?,
      headingDeg: freezed == headingDeg
          ? _self.headingDeg
          : headingDeg // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$SosTriggerRequest {
  String get description;
  double get lat;
  double get lng;
  @JsonKey(name: 'impact_force')
  double? get impactForce;
  String get source;
  bool get silent;
  @JsonKey(name: 'bystander_mode')
  bool get bystanderMode;
  @JsonKey(name: 'victim_name')
  String? get victimName;
  @JsonKey(name: 'victim_phone')
  String? get victimPhone;
  @JsonKey(name: 'sensor_payload')
  Map<String, dynamic> get sensorPayload;
  @JsonKey(name: 'client_reference_id')
  String? get clientReferenceId;

  /// Create a copy of SosTriggerRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SosTriggerRequestCopyWith<SosTriggerRequest> get copyWith =>
      _$SosTriggerRequestCopyWithImpl<SosTriggerRequest>(
          this as SosTriggerRequest, _$identity);

  /// Serializes this SosTriggerRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SosTriggerRequest &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.impactForce, impactForce) ||
                other.impactForce == impactForce) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.silent, silent) || other.silent == silent) &&
            (identical(other.bystanderMode, bystanderMode) ||
                other.bystanderMode == bystanderMode) &&
            (identical(other.victimName, victimName) ||
                other.victimName == victimName) &&
            (identical(other.victimPhone, victimPhone) ||
                other.victimPhone == victimPhone) &&
            const DeepCollectionEquality()
                .equals(other.sensorPayload, sensorPayload) &&
            (identical(other.clientReferenceId, clientReferenceId) ||
                other.clientReferenceId == clientReferenceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      lat,
      lng,
      impactForce,
      source,
      silent,
      bystanderMode,
      victimName,
      victimPhone,
      const DeepCollectionEquality().hash(sensorPayload),
      clientReferenceId);

  @override
  String toString() {
    return 'SosTriggerRequest(description: $description, lat: $lat, lng: $lng, impactForce: $impactForce, source: $source, silent: $silent, bystanderMode: $bystanderMode, victimName: $victimName, victimPhone: $victimPhone, sensorPayload: $sensorPayload, clientReferenceId: $clientReferenceId)';
  }
}

/// @nodoc
abstract mixin class $SosTriggerRequestCopyWith<$Res> {
  factory $SosTriggerRequestCopyWith(
          SosTriggerRequest value, $Res Function(SosTriggerRequest) _then) =
      _$SosTriggerRequestCopyWithImpl;
  @useResult
  $Res call(
      {String description,
      double lat,
      double lng,
      @JsonKey(name: 'impact_force') double? impactForce,
      String source,
      bool silent,
      @JsonKey(name: 'bystander_mode') bool bystanderMode,
      @JsonKey(name: 'victim_name') String? victimName,
      @JsonKey(name: 'victim_phone') String? victimPhone,
      @JsonKey(name: 'sensor_payload') Map<String, dynamic> sensorPayload,
      @JsonKey(name: 'client_reference_id') String? clientReferenceId});
}

/// @nodoc
class _$SosTriggerRequestCopyWithImpl<$Res>
    implements $SosTriggerRequestCopyWith<$Res> {
  _$SosTriggerRequestCopyWithImpl(this._self, this._then);

  final SosTriggerRequest _self;
  final $Res Function(SosTriggerRequest) _then;

  /// Create a copy of SosTriggerRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? lat = null,
    Object? lng = null,
    Object? impactForce = freezed,
    Object? source = null,
    Object? silent = null,
    Object? bystanderMode = null,
    Object? victimName = freezed,
    Object? victimPhone = freezed,
    Object? sensorPayload = null,
    Object? clientReferenceId = freezed,
  }) {
    return _then(_self.copyWith(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      impactForce: freezed == impactForce
          ? _self.impactForce
          : impactForce // ignore: cast_nullable_to_non_nullable
              as double?,
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
      victimName: freezed == victimName
          ? _self.victimName
          : victimName // ignore: cast_nullable_to_non_nullable
              as String?,
      victimPhone: freezed == victimPhone
          ? _self.victimPhone
          : victimPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorPayload: null == sensorPayload
          ? _self.sensorPayload
          : sensorPayload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      clientReferenceId: freezed == clientReferenceId
          ? _self.clientReferenceId
          : clientReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SosTriggerRequest].
extension SosTriggerRequestPatterns on SosTriggerRequest {
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
    TResult Function(_SosTriggerRequest value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SosTriggerRequest() when $default != null:
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
    TResult Function(_SosTriggerRequest value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SosTriggerRequest():
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
    TResult? Function(_SosTriggerRequest value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SosTriggerRequest() when $default != null:
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
            String description,
            double lat,
            double lng,
            @JsonKey(name: 'impact_force') double? impactForce,
            String source,
            bool silent,
            @JsonKey(name: 'bystander_mode') bool bystanderMode,
            @JsonKey(name: 'victim_name') String? victimName,
            @JsonKey(name: 'victim_phone') String? victimPhone,
            @JsonKey(name: 'sensor_payload') Map<String, dynamic> sensorPayload,
            @JsonKey(name: 'client_reference_id') String? clientReferenceId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SosTriggerRequest() when $default != null:
        return $default(
            _that.description,
            _that.lat,
            _that.lng,
            _that.impactForce,
            _that.source,
            _that.silent,
            _that.bystanderMode,
            _that.victimName,
            _that.victimPhone,
            _that.sensorPayload,
            _that.clientReferenceId);
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
            String description,
            double lat,
            double lng,
            @JsonKey(name: 'impact_force') double? impactForce,
            String source,
            bool silent,
            @JsonKey(name: 'bystander_mode') bool bystanderMode,
            @JsonKey(name: 'victim_name') String? victimName,
            @JsonKey(name: 'victim_phone') String? victimPhone,
            @JsonKey(name: 'sensor_payload') Map<String, dynamic> sensorPayload,
            @JsonKey(name: 'client_reference_id') String? clientReferenceId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SosTriggerRequest():
        return $default(
            _that.description,
            _that.lat,
            _that.lng,
            _that.impactForce,
            _that.source,
            _that.silent,
            _that.bystanderMode,
            _that.victimName,
            _that.victimPhone,
            _that.sensorPayload,
            _that.clientReferenceId);
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
            String description,
            double lat,
            double lng,
            @JsonKey(name: 'impact_force') double? impactForce,
            String source,
            bool silent,
            @JsonKey(name: 'bystander_mode') bool bystanderMode,
            @JsonKey(name: 'victim_name') String? victimName,
            @JsonKey(name: 'victim_phone') String? victimPhone,
            @JsonKey(name: 'sensor_payload') Map<String, dynamic> sensorPayload,
            @JsonKey(name: 'client_reference_id') String? clientReferenceId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SosTriggerRequest() when $default != null:
        return $default(
            _that.description,
            _that.lat,
            _that.lng,
            _that.impactForce,
            _that.source,
            _that.silent,
            _that.bystanderMode,
            _that.victimName,
            _that.victimPhone,
            _that.sensorPayload,
            _that.clientReferenceId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SosTriggerRequest implements SosTriggerRequest {
  const _SosTriggerRequest(
      {required this.description,
      required this.lat,
      required this.lng,
      @JsonKey(name: 'impact_force') this.impactForce,
      this.source = 'manual',
      this.silent = false,
      @JsonKey(name: 'bystander_mode') this.bystanderMode = false,
      @JsonKey(name: 'victim_name') this.victimName,
      @JsonKey(name: 'victim_phone') this.victimPhone,
      @JsonKey(name: 'sensor_payload')
      final Map<String, dynamic> sensorPayload = const {},
      @JsonKey(name: 'client_reference_id') this.clientReferenceId})
      : _sensorPayload = sensorPayload;
  factory _SosTriggerRequest.fromJson(Map<String, dynamic> json) =>
      _$SosTriggerRequestFromJson(json);

  @override
  final String description;
  @override
  final double lat;
  @override
  final double lng;
  @override
  @JsonKey(name: 'impact_force')
  final double? impactForce;
  @override
  @JsonKey()
  final String source;
  @override
  @JsonKey()
  final bool silent;
  @override
  @JsonKey(name: 'bystander_mode')
  final bool bystanderMode;
  @override
  @JsonKey(name: 'victim_name')
  final String? victimName;
  @override
  @JsonKey(name: 'victim_phone')
  final String? victimPhone;
  final Map<String, dynamic> _sensorPayload;
  @override
  @JsonKey(name: 'sensor_payload')
  Map<String, dynamic> get sensorPayload {
    if (_sensorPayload is EqualUnmodifiableMapView) return _sensorPayload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sensorPayload);
  }

  @override
  @JsonKey(name: 'client_reference_id')
  final String? clientReferenceId;

  /// Create a copy of SosTriggerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SosTriggerRequestCopyWith<_SosTriggerRequest> get copyWith =>
      __$SosTriggerRequestCopyWithImpl<_SosTriggerRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SosTriggerRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SosTriggerRequest &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.impactForce, impactForce) ||
                other.impactForce == impactForce) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.silent, silent) || other.silent == silent) &&
            (identical(other.bystanderMode, bystanderMode) ||
                other.bystanderMode == bystanderMode) &&
            (identical(other.victimName, victimName) ||
                other.victimName == victimName) &&
            (identical(other.victimPhone, victimPhone) ||
                other.victimPhone == victimPhone) &&
            const DeepCollectionEquality()
                .equals(other._sensorPayload, _sensorPayload) &&
            (identical(other.clientReferenceId, clientReferenceId) ||
                other.clientReferenceId == clientReferenceId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      lat,
      lng,
      impactForce,
      source,
      silent,
      bystanderMode,
      victimName,
      victimPhone,
      const DeepCollectionEquality().hash(_sensorPayload),
      clientReferenceId);

  @override
  String toString() {
    return 'SosTriggerRequest(description: $description, lat: $lat, lng: $lng, impactForce: $impactForce, source: $source, silent: $silent, bystanderMode: $bystanderMode, victimName: $victimName, victimPhone: $victimPhone, sensorPayload: $sensorPayload, clientReferenceId: $clientReferenceId)';
  }
}

/// @nodoc
abstract mixin class _$SosTriggerRequestCopyWith<$Res>
    implements $SosTriggerRequestCopyWith<$Res> {
  factory _$SosTriggerRequestCopyWith(
          _SosTriggerRequest value, $Res Function(_SosTriggerRequest) _then) =
      __$SosTriggerRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String description,
      double lat,
      double lng,
      @JsonKey(name: 'impact_force') double? impactForce,
      String source,
      bool silent,
      @JsonKey(name: 'bystander_mode') bool bystanderMode,
      @JsonKey(name: 'victim_name') String? victimName,
      @JsonKey(name: 'victim_phone') String? victimPhone,
      @JsonKey(name: 'sensor_payload') Map<String, dynamic> sensorPayload,
      @JsonKey(name: 'client_reference_id') String? clientReferenceId});
}

/// @nodoc
class __$SosTriggerRequestCopyWithImpl<$Res>
    implements _$SosTriggerRequestCopyWith<$Res> {
  __$SosTriggerRequestCopyWithImpl(this._self, this._then);

  final _SosTriggerRequest _self;
  final $Res Function(_SosTriggerRequest) _then;

  /// Create a copy of SosTriggerRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? description = null,
    Object? lat = null,
    Object? lng = null,
    Object? impactForce = freezed,
    Object? source = null,
    Object? silent = null,
    Object? bystanderMode = null,
    Object? victimName = freezed,
    Object? victimPhone = freezed,
    Object? sensorPayload = null,
    Object? clientReferenceId = freezed,
  }) {
    return _then(_SosTriggerRequest(
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      impactForce: freezed == impactForce
          ? _self.impactForce
          : impactForce // ignore: cast_nullable_to_non_nullable
              as double?,
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
      victimName: freezed == victimName
          ? _self.victimName
          : victimName // ignore: cast_nullable_to_non_nullable
              as String?,
      victimPhone: freezed == victimPhone
          ? _self.victimPhone
          : victimPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      sensorPayload: null == sensorPayload
          ? _self._sensorPayload
          : sensorPayload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      clientReferenceId: freezed == clientReferenceId
          ? _self.clientReferenceId
          : clientReferenceId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$SosResponse {
  @JsonKey(name: 'incident_id')
  String get incidentId;
  String get priority;
  @JsonKey(name: 'triage_confidence')
  double get triageConfidence;
  @JsonKey(name: 'volunteers_notified')
  int get volunteersNotified;
  @JsonKey(name: 'services_notified')
  int get servicesNotified;
  @JsonKey(name: 'estimated_response_time')
  String get estimatedResponseTime;
  String get message;

  /// Create a copy of SosResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SosResponseCopyWith<SosResponse> get copyWith =>
      _$SosResponseCopyWithImpl<SosResponse>(this as SosResponse, _$identity);

  /// Serializes this SosResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SosResponse &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.triageConfidence, triageConfidence) ||
                other.triageConfidence == triageConfidence) &&
            (identical(other.volunteersNotified, volunteersNotified) ||
                other.volunteersNotified == volunteersNotified) &&
            (identical(other.servicesNotified, servicesNotified) ||
                other.servicesNotified == servicesNotified) &&
            (identical(other.estimatedResponseTime, estimatedResponseTime) ||
                other.estimatedResponseTime == estimatedResponseTime) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      incidentId,
      priority,
      triageConfidence,
      volunteersNotified,
      servicesNotified,
      estimatedResponseTime,
      message);

  @override
  String toString() {
    return 'SosResponse(incidentId: $incidentId, priority: $priority, triageConfidence: $triageConfidence, volunteersNotified: $volunteersNotified, servicesNotified: $servicesNotified, estimatedResponseTime: $estimatedResponseTime, message: $message)';
  }
}

/// @nodoc
abstract mixin class $SosResponseCopyWith<$Res> {
  factory $SosResponseCopyWith(
          SosResponse value, $Res Function(SosResponse) _then) =
      _$SosResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'incident_id') String incidentId,
      String priority,
      @JsonKey(name: 'triage_confidence') double triageConfidence,
      @JsonKey(name: 'volunteers_notified') int volunteersNotified,
      @JsonKey(name: 'services_notified') int servicesNotified,
      @JsonKey(name: 'estimated_response_time') String estimatedResponseTime,
      String message});
}

/// @nodoc
class _$SosResponseCopyWithImpl<$Res> implements $SosResponseCopyWith<$Res> {
  _$SosResponseCopyWithImpl(this._self, this._then);

  final SosResponse _self;
  final $Res Function(SosResponse) _then;

  /// Create a copy of SosResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incidentId = null,
    Object? priority = null,
    Object? triageConfidence = null,
    Object? volunteersNotified = null,
    Object? servicesNotified = null,
    Object? estimatedResponseTime = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      incidentId: null == incidentId
          ? _self.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      triageConfidence: null == triageConfidence
          ? _self.triageConfidence
          : triageConfidence // ignore: cast_nullable_to_non_nullable
              as double,
      volunteersNotified: null == volunteersNotified
          ? _self.volunteersNotified
          : volunteersNotified // ignore: cast_nullable_to_non_nullable
              as int,
      servicesNotified: null == servicesNotified
          ? _self.servicesNotified
          : servicesNotified // ignore: cast_nullable_to_non_nullable
              as int,
      estimatedResponseTime: null == estimatedResponseTime
          ? _self.estimatedResponseTime
          : estimatedResponseTime // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [SosResponse].
extension SosResponsePatterns on SosResponse {
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
    TResult Function(_SosResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SosResponse() when $default != null:
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
    TResult Function(_SosResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SosResponse():
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
    TResult? Function(_SosResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SosResponse() when $default != null:
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
            @JsonKey(name: 'incident_id') String incidentId,
            String priority,
            @JsonKey(name: 'triage_confidence') double triageConfidence,
            @JsonKey(name: 'volunteers_notified') int volunteersNotified,
            @JsonKey(name: 'services_notified') int servicesNotified,
            @JsonKey(name: 'estimated_response_time')
            String estimatedResponseTime,
            String message)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SosResponse() when $default != null:
        return $default(
            _that.incidentId,
            _that.priority,
            _that.triageConfidence,
            _that.volunteersNotified,
            _that.servicesNotified,
            _that.estimatedResponseTime,
            _that.message);
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
            @JsonKey(name: 'incident_id') String incidentId,
            String priority,
            @JsonKey(name: 'triage_confidence') double triageConfidence,
            @JsonKey(name: 'volunteers_notified') int volunteersNotified,
            @JsonKey(name: 'services_notified') int servicesNotified,
            @JsonKey(name: 'estimated_response_time')
            String estimatedResponseTime,
            String message)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SosResponse():
        return $default(
            _that.incidentId,
            _that.priority,
            _that.triageConfidence,
            _that.volunteersNotified,
            _that.servicesNotified,
            _that.estimatedResponseTime,
            _that.message);
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
            @JsonKey(name: 'incident_id') String incidentId,
            String priority,
            @JsonKey(name: 'triage_confidence') double triageConfidence,
            @JsonKey(name: 'volunteers_notified') int volunteersNotified,
            @JsonKey(name: 'services_notified') int servicesNotified,
            @JsonKey(name: 'estimated_response_time')
            String estimatedResponseTime,
            String message)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SosResponse() when $default != null:
        return $default(
            _that.incidentId,
            _that.priority,
            _that.triageConfidence,
            _that.volunteersNotified,
            _that.servicesNotified,
            _that.estimatedResponseTime,
            _that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SosResponse implements SosResponse {
  const _SosResponse(
      {@JsonKey(name: 'incident_id') required this.incidentId,
      required this.priority,
      @JsonKey(name: 'triage_confidence') required this.triageConfidence,
      @JsonKey(name: 'volunteers_notified') this.volunteersNotified = 0,
      @JsonKey(name: 'services_notified') this.servicesNotified = 0,
      @JsonKey(name: 'estimated_response_time')
      required this.estimatedResponseTime,
      this.message = "SOS received. Help dispatch has started."});
  factory _SosResponse.fromJson(Map<String, dynamic> json) =>
      _$SosResponseFromJson(json);

  @override
  @JsonKey(name: 'incident_id')
  final String incidentId;
  @override
  final String priority;
  @override
  @JsonKey(name: 'triage_confidence')
  final double triageConfidence;
  @override
  @JsonKey(name: 'volunteers_notified')
  final int volunteersNotified;
  @override
  @JsonKey(name: 'services_notified')
  final int servicesNotified;
  @override
  @JsonKey(name: 'estimated_response_time')
  final String estimatedResponseTime;
  @override
  @JsonKey()
  final String message;

  /// Create a copy of SosResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SosResponseCopyWith<_SosResponse> get copyWith =>
      __$SosResponseCopyWithImpl<_SosResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SosResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SosResponse &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.triageConfidence, triageConfidence) ||
                other.triageConfidence == triageConfidence) &&
            (identical(other.volunteersNotified, volunteersNotified) ||
                other.volunteersNotified == volunteersNotified) &&
            (identical(other.servicesNotified, servicesNotified) ||
                other.servicesNotified == servicesNotified) &&
            (identical(other.estimatedResponseTime, estimatedResponseTime) ||
                other.estimatedResponseTime == estimatedResponseTime) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      incidentId,
      priority,
      triageConfidence,
      volunteersNotified,
      servicesNotified,
      estimatedResponseTime,
      message);

  @override
  String toString() {
    return 'SosResponse(incidentId: $incidentId, priority: $priority, triageConfidence: $triageConfidence, volunteersNotified: $volunteersNotified, servicesNotified: $servicesNotified, estimatedResponseTime: $estimatedResponseTime, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SosResponseCopyWith<$Res>
    implements $SosResponseCopyWith<$Res> {
  factory _$SosResponseCopyWith(
          _SosResponse value, $Res Function(_SosResponse) _then) =
      __$SosResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'incident_id') String incidentId,
      String priority,
      @JsonKey(name: 'triage_confidence') double triageConfidence,
      @JsonKey(name: 'volunteers_notified') int volunteersNotified,
      @JsonKey(name: 'services_notified') int servicesNotified,
      @JsonKey(name: 'estimated_response_time') String estimatedResponseTime,
      String message});
}

/// @nodoc
class __$SosResponseCopyWithImpl<$Res> implements _$SosResponseCopyWith<$Res> {
  __$SosResponseCopyWithImpl(this._self, this._then);

  final _SosResponse _self;
  final $Res Function(_SosResponse) _then;

  /// Create a copy of SosResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? incidentId = null,
    Object? priority = null,
    Object? triageConfidence = null,
    Object? volunteersNotified = null,
    Object? servicesNotified = null,
    Object? estimatedResponseTime = null,
    Object? message = null,
  }) {
    return _then(_SosResponse(
      incidentId: null == incidentId
          ? _self.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      triageConfidence: null == triageConfidence
          ? _self.triageConfidence
          : triageConfidence // ignore: cast_nullable_to_non_nullable
              as double,
      volunteersNotified: null == volunteersNotified
          ? _self.volunteersNotified
          : volunteersNotified // ignore: cast_nullable_to_non_nullable
              as int,
      servicesNotified: null == servicesNotified
          ? _self.servicesNotified
          : servicesNotified // ignore: cast_nullable_to_non_nullable
              as int,
      estimatedResponseTime: null == estimatedResponseTime
          ? _self.estimatedResponseTime
          : estimatedResponseTime // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$IncidentModel {
  String get id;
  @JsonKey(name: 'user_id')
  String get userId;
  String get description;
  String get priority;
  @JsonKey(name: 'triage_confidence')
  double get triageConfidence;
  String get source;
  bool get silent;
  @JsonKey(name: 'bystander_mode')
  bool get bystanderMode;
  double get lat;
  double get lng;
  String get status;
  @JsonKey(name: 'cluster_id')
  String? get clusterId;
  @JsonKey(name: 'is_mci')
  bool get isMci;
  @JsonKey(name: 'is_mci_coordinator')
  bool get isMciCoordinator;
  @JsonKey(name: 'accepted_responder_id')
  String? get acceptedResponderId;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'resolved_at')
  DateTime? get resolvedAt;

  /// Create a copy of IncidentModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncidentModelCopyWith<IncidentModel> get copyWith =>
      _$IncidentModelCopyWithImpl<IncidentModel>(
          this as IncidentModel, _$identity);

  /// Serializes this IncidentModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncidentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.triageConfidence, triageConfidence) ||
                other.triageConfidence == triageConfidence) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.silent, silent) || other.silent == silent) &&
            (identical(other.bystanderMode, bystanderMode) ||
                other.bystanderMode == bystanderMode) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.clusterId, clusterId) ||
                other.clusterId == clusterId) &&
            (identical(other.isMci, isMci) || other.isMci == isMci) &&
            (identical(other.isMciCoordinator, isMciCoordinator) ||
                other.isMciCoordinator == isMciCoordinator) &&
            (identical(other.acceptedResponderId, acceptedResponderId) ||
                other.acceptedResponderId == acceptedResponderId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      description,
      priority,
      triageConfidence,
      source,
      silent,
      bystanderMode,
      lat,
      lng,
      status,
      clusterId,
      isMci,
      isMciCoordinator,
      acceptedResponderId,
      createdAt,
      resolvedAt);

  @override
  String toString() {
    return 'IncidentModel(id: $id, userId: $userId, description: $description, priority: $priority, triageConfidence: $triageConfidence, source: $source, silent: $silent, bystanderMode: $bystanderMode, lat: $lat, lng: $lng, status: $status, clusterId: $clusterId, isMci: $isMci, isMciCoordinator: $isMciCoordinator, acceptedResponderId: $acceptedResponderId, createdAt: $createdAt, resolvedAt: $resolvedAt)';
  }
}

/// @nodoc
abstract mixin class $IncidentModelCopyWith<$Res> {
  factory $IncidentModelCopyWith(
          IncidentModel value, $Res Function(IncidentModel) _then) =
      _$IncidentModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String description,
      String priority,
      @JsonKey(name: 'triage_confidence') double triageConfidence,
      String source,
      bool silent,
      @JsonKey(name: 'bystander_mode') bool bystanderMode,
      double lat,
      double lng,
      String status,
      @JsonKey(name: 'cluster_id') String? clusterId,
      @JsonKey(name: 'is_mci') bool isMci,
      @JsonKey(name: 'is_mci_coordinator') bool isMciCoordinator,
      @JsonKey(name: 'accepted_responder_id') String? acceptedResponderId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'resolved_at') DateTime? resolvedAt});
}

/// @nodoc
class _$IncidentModelCopyWithImpl<$Res>
    implements $IncidentModelCopyWith<$Res> {
  _$IncidentModelCopyWithImpl(this._self, this._then);

  final IncidentModel _self;
  final $Res Function(IncidentModel) _then;

  /// Create a copy of IncidentModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? description = null,
    Object? priority = null,
    Object? triageConfidence = null,
    Object? source = null,
    Object? silent = null,
    Object? bystanderMode = null,
    Object? lat = null,
    Object? lng = null,
    Object? status = null,
    Object? clusterId = freezed,
    Object? isMci = null,
    Object? isMciCoordinator = null,
    Object? acceptedResponderId = freezed,
    Object? createdAt = null,
    Object? resolvedAt = freezed,
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
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      triageConfidence: null == triageConfidence
          ? _self.triageConfidence
          : triageConfidence // ignore: cast_nullable_to_non_nullable
              as double,
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
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      clusterId: freezed == clusterId
          ? _self.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as String?,
      isMci: null == isMci
          ? _self.isMci
          : isMci // ignore: cast_nullable_to_non_nullable
              as bool,
      isMciCoordinator: null == isMciCoordinator
          ? _self.isMciCoordinator
          : isMciCoordinator // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptedResponderId: freezed == acceptedResponderId
          ? _self.acceptedResponderId
          : acceptedResponderId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resolvedAt: freezed == resolvedAt
          ? _self.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [IncidentModel].
extension IncidentModelPatterns on IncidentModel {
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
    TResult Function(_IncidentModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncidentModel() when $default != null:
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
    TResult Function(_IncidentModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentModel():
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
    TResult? Function(_IncidentModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentModel() when $default != null:
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
            String description,
            String priority,
            @JsonKey(name: 'triage_confidence') double triageConfidence,
            String source,
            bool silent,
            @JsonKey(name: 'bystander_mode') bool bystanderMode,
            double lat,
            double lng,
            String status,
            @JsonKey(name: 'cluster_id') String? clusterId,
            @JsonKey(name: 'is_mci') bool isMci,
            @JsonKey(name: 'is_mci_coordinator') bool isMciCoordinator,
            @JsonKey(name: 'accepted_responder_id') String? acceptedResponderId,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'resolved_at') DateTime? resolvedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncidentModel() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.description,
            _that.priority,
            _that.triageConfidence,
            _that.source,
            _that.silent,
            _that.bystanderMode,
            _that.lat,
            _that.lng,
            _that.status,
            _that.clusterId,
            _that.isMci,
            _that.isMciCoordinator,
            _that.acceptedResponderId,
            _that.createdAt,
            _that.resolvedAt);
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
            String description,
            String priority,
            @JsonKey(name: 'triage_confidence') double triageConfidence,
            String source,
            bool silent,
            @JsonKey(name: 'bystander_mode') bool bystanderMode,
            double lat,
            double lng,
            String status,
            @JsonKey(name: 'cluster_id') String? clusterId,
            @JsonKey(name: 'is_mci') bool isMci,
            @JsonKey(name: 'is_mci_coordinator') bool isMciCoordinator,
            @JsonKey(name: 'accepted_responder_id') String? acceptedResponderId,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'resolved_at') DateTime? resolvedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentModel():
        return $default(
            _that.id,
            _that.userId,
            _that.description,
            _that.priority,
            _that.triageConfidence,
            _that.source,
            _that.silent,
            _that.bystanderMode,
            _that.lat,
            _that.lng,
            _that.status,
            _that.clusterId,
            _that.isMci,
            _that.isMciCoordinator,
            _that.acceptedResponderId,
            _that.createdAt,
            _that.resolvedAt);
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
            String description,
            String priority,
            @JsonKey(name: 'triage_confidence') double triageConfidence,
            String source,
            bool silent,
            @JsonKey(name: 'bystander_mode') bool bystanderMode,
            double lat,
            double lng,
            String status,
            @JsonKey(name: 'cluster_id') String? clusterId,
            @JsonKey(name: 'is_mci') bool isMci,
            @JsonKey(name: 'is_mci_coordinator') bool isMciCoordinator,
            @JsonKey(name: 'accepted_responder_id') String? acceptedResponderId,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'resolved_at') DateTime? resolvedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentModel() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.description,
            _that.priority,
            _that.triageConfidence,
            _that.source,
            _that.silent,
            _that.bystanderMode,
            _that.lat,
            _that.lng,
            _that.status,
            _that.clusterId,
            _that.isMci,
            _that.isMciCoordinator,
            _that.acceptedResponderId,
            _that.createdAt,
            _that.resolvedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IncidentModel implements IncidentModel {
  const _IncidentModel(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.description,
      required this.priority,
      @JsonKey(name: 'triage_confidence') required this.triageConfidence,
      required this.source,
      required this.silent,
      @JsonKey(name: 'bystander_mode') required this.bystanderMode,
      required this.lat,
      required this.lng,
      required this.status,
      @JsonKey(name: 'cluster_id') this.clusterId,
      @JsonKey(name: 'is_mci') this.isMci = false,
      @JsonKey(name: 'is_mci_coordinator') this.isMciCoordinator = false,
      @JsonKey(name: 'accepted_responder_id') this.acceptedResponderId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'resolved_at') this.resolvedAt});
  factory _IncidentModel.fromJson(Map<String, dynamic> json) =>
      _$IncidentModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final String description;
  @override
  final String priority;
  @override
  @JsonKey(name: 'triage_confidence')
  final double triageConfidence;
  @override
  final String source;
  @override
  final bool silent;
  @override
  @JsonKey(name: 'bystander_mode')
  final bool bystanderMode;
  @override
  final double lat;
  @override
  final double lng;
  @override
  final String status;
  @override
  @JsonKey(name: 'cluster_id')
  final String? clusterId;
  @override
  @JsonKey(name: 'is_mci')
  final bool isMci;
  @override
  @JsonKey(name: 'is_mci_coordinator')
  final bool isMciCoordinator;
  @override
  @JsonKey(name: 'accepted_responder_id')
  final String? acceptedResponderId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'resolved_at')
  final DateTime? resolvedAt;

  /// Create a copy of IncidentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IncidentModelCopyWith<_IncidentModel> get copyWith =>
      __$IncidentModelCopyWithImpl<_IncidentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IncidentModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncidentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.triageConfidence, triageConfidence) ||
                other.triageConfidence == triageConfidence) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.silent, silent) || other.silent == silent) &&
            (identical(other.bystanderMode, bystanderMode) ||
                other.bystanderMode == bystanderMode) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.clusterId, clusterId) ||
                other.clusterId == clusterId) &&
            (identical(other.isMci, isMci) || other.isMci == isMci) &&
            (identical(other.isMciCoordinator, isMciCoordinator) ||
                other.isMciCoordinator == isMciCoordinator) &&
            (identical(other.acceptedResponderId, acceptedResponderId) ||
                other.acceptedResponderId == acceptedResponderId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      description,
      priority,
      triageConfidence,
      source,
      silent,
      bystanderMode,
      lat,
      lng,
      status,
      clusterId,
      isMci,
      isMciCoordinator,
      acceptedResponderId,
      createdAt,
      resolvedAt);

  @override
  String toString() {
    return 'IncidentModel(id: $id, userId: $userId, description: $description, priority: $priority, triageConfidence: $triageConfidence, source: $source, silent: $silent, bystanderMode: $bystanderMode, lat: $lat, lng: $lng, status: $status, clusterId: $clusterId, isMci: $isMci, isMciCoordinator: $isMciCoordinator, acceptedResponderId: $acceptedResponderId, createdAt: $createdAt, resolvedAt: $resolvedAt)';
  }
}

/// @nodoc
abstract mixin class _$IncidentModelCopyWith<$Res>
    implements $IncidentModelCopyWith<$Res> {
  factory _$IncidentModelCopyWith(
          _IncidentModel value, $Res Function(_IncidentModel) _then) =
      __$IncidentModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      String description,
      String priority,
      @JsonKey(name: 'triage_confidence') double triageConfidence,
      String source,
      bool silent,
      @JsonKey(name: 'bystander_mode') bool bystanderMode,
      double lat,
      double lng,
      String status,
      @JsonKey(name: 'cluster_id') String? clusterId,
      @JsonKey(name: 'is_mci') bool isMci,
      @JsonKey(name: 'is_mci_coordinator') bool isMciCoordinator,
      @JsonKey(name: 'accepted_responder_id') String? acceptedResponderId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'resolved_at') DateTime? resolvedAt});
}

/// @nodoc
class __$IncidentModelCopyWithImpl<$Res>
    implements _$IncidentModelCopyWith<$Res> {
  __$IncidentModelCopyWithImpl(this._self, this._then);

  final _IncidentModel _self;
  final $Res Function(_IncidentModel) _then;

  /// Create a copy of IncidentModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? description = null,
    Object? priority = null,
    Object? triageConfidence = null,
    Object? source = null,
    Object? silent = null,
    Object? bystanderMode = null,
    Object? lat = null,
    Object? lng = null,
    Object? status = null,
    Object? clusterId = freezed,
    Object? isMci = null,
    Object? isMciCoordinator = null,
    Object? acceptedResponderId = freezed,
    Object? createdAt = null,
    Object? resolvedAt = freezed,
  }) {
    return _then(_IncidentModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      triageConfidence: null == triageConfidence
          ? _self.triageConfidence
          : triageConfidence // ignore: cast_nullable_to_non_nullable
              as double,
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
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      clusterId: freezed == clusterId
          ? _self.clusterId
          : clusterId // ignore: cast_nullable_to_non_nullable
              as String?,
      isMci: null == isMci
          ? _self.isMci
          : isMci // ignore: cast_nullable_to_non_nullable
              as bool,
      isMciCoordinator: null == isMciCoordinator
          ? _self.isMciCoordinator
          : isMciCoordinator // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptedResponderId: freezed == acceptedResponderId
          ? _self.acceptedResponderId
          : acceptedResponderId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resolvedAt: freezed == resolvedAt
          ? _self.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$IncidentStatusUpdate {
  String get status;
  String? get note;

  /// Create a copy of IncidentStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IncidentStatusUpdateCopyWith<IncidentStatusUpdate> get copyWith =>
      _$IncidentStatusUpdateCopyWithImpl<IncidentStatusUpdate>(
          this as IncidentStatusUpdate, _$identity);

  /// Serializes this IncidentStatusUpdate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IncidentStatusUpdate &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, note);

  @override
  String toString() {
    return 'IncidentStatusUpdate(status: $status, note: $note)';
  }
}

/// @nodoc
abstract mixin class $IncidentStatusUpdateCopyWith<$Res> {
  factory $IncidentStatusUpdateCopyWith(IncidentStatusUpdate value,
          $Res Function(IncidentStatusUpdate) _then) =
      _$IncidentStatusUpdateCopyWithImpl;
  @useResult
  $Res call({String status, String? note});
}

/// @nodoc
class _$IncidentStatusUpdateCopyWithImpl<$Res>
    implements $IncidentStatusUpdateCopyWith<$Res> {
  _$IncidentStatusUpdateCopyWithImpl(this._self, this._then);

  final IncidentStatusUpdate _self;
  final $Res Function(IncidentStatusUpdate) _then;

  /// Create a copy of IncidentStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? note = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [IncidentStatusUpdate].
extension IncidentStatusUpdatePatterns on IncidentStatusUpdate {
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
    TResult Function(_IncidentStatusUpdate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncidentStatusUpdate() when $default != null:
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
    TResult Function(_IncidentStatusUpdate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentStatusUpdate():
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
    TResult? Function(_IncidentStatusUpdate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentStatusUpdate() when $default != null:
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
    TResult Function(String status, String? note)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _IncidentStatusUpdate() when $default != null:
        return $default(_that.status, _that.note);
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
    TResult Function(String status, String? note) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentStatusUpdate():
        return $default(_that.status, _that.note);
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
    TResult? Function(String status, String? note)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _IncidentStatusUpdate() when $default != null:
        return $default(_that.status, _that.note);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _IncidentStatusUpdate implements IncidentStatusUpdate {
  const _IncidentStatusUpdate({required this.status, this.note});
  factory _IncidentStatusUpdate.fromJson(Map<String, dynamic> json) =>
      _$IncidentStatusUpdateFromJson(json);

  @override
  final String status;
  @override
  final String? note;

  /// Create a copy of IncidentStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IncidentStatusUpdateCopyWith<_IncidentStatusUpdate> get copyWith =>
      __$IncidentStatusUpdateCopyWithImpl<_IncidentStatusUpdate>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IncidentStatusUpdateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IncidentStatusUpdate &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, note);

  @override
  String toString() {
    return 'IncidentStatusUpdate(status: $status, note: $note)';
  }
}

/// @nodoc
abstract mixin class _$IncidentStatusUpdateCopyWith<$Res>
    implements $IncidentStatusUpdateCopyWith<$Res> {
  factory _$IncidentStatusUpdateCopyWith(_IncidentStatusUpdate value,
          $Res Function(_IncidentStatusUpdate) _then) =
      __$IncidentStatusUpdateCopyWithImpl;
  @override
  @useResult
  $Res call({String status, String? note});
}

/// @nodoc
class __$IncidentStatusUpdateCopyWithImpl<$Res>
    implements _$IncidentStatusUpdateCopyWith<$Res> {
  __$IncidentStatusUpdateCopyWithImpl(this._self, this._then);

  final _IncidentStatusUpdate _self;
  final $Res Function(_IncidentStatusUpdate) _then;

  /// Create a copy of IncidentStatusUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? note = freezed,
  }) {
    return _then(_IncidentStatusUpdate(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      note: freezed == note
          ? _self.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$LiveLocationUpdate {
  double get lat;
  double get lng;
  @JsonKey(name: 'accuracy_m')
  double? get accuracyM;
  @JsonKey(name: 'speed_mps')
  double? get speedMps;
  @JsonKey(name: 'heading_deg')
  double? get headingDeg;
  @JsonKey(name: 'incident_id')
  String get incidentId;
  @JsonKey(name: 'battery_percent')
  int? get batteryPercent;
  DateTime? get timestamp;

  /// Create a copy of LiveLocationUpdate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveLocationUpdateCopyWith<LiveLocationUpdate> get copyWith =>
      _$LiveLocationUpdateCopyWithImpl<LiveLocationUpdate>(
          this as LiveLocationUpdate, _$identity);

  /// Serializes this LiveLocationUpdate to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveLocationUpdate &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.accuracyM, accuracyM) ||
                other.accuracyM == accuracyM) &&
            (identical(other.speedMps, speedMps) ||
                other.speedMps == speedMps) &&
            (identical(other.headingDeg, headingDeg) ||
                other.headingDeg == headingDeg) &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId) &&
            (identical(other.batteryPercent, batteryPercent) ||
                other.batteryPercent == batteryPercent) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng, accuracyM, speedMps,
      headingDeg, incidentId, batteryPercent, timestamp);

  @override
  String toString() {
    return 'LiveLocationUpdate(lat: $lat, lng: $lng, accuracyM: $accuracyM, speedMps: $speedMps, headingDeg: $headingDeg, incidentId: $incidentId, batteryPercent: $batteryPercent, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $LiveLocationUpdateCopyWith<$Res> {
  factory $LiveLocationUpdateCopyWith(
          LiveLocationUpdate value, $Res Function(LiveLocationUpdate) _then) =
      _$LiveLocationUpdateCopyWithImpl;
  @useResult
  $Res call(
      {double lat,
      double lng,
      @JsonKey(name: 'accuracy_m') double? accuracyM,
      @JsonKey(name: 'speed_mps') double? speedMps,
      @JsonKey(name: 'heading_deg') double? headingDeg,
      @JsonKey(name: 'incident_id') String incidentId,
      @JsonKey(name: 'battery_percent') int? batteryPercent,
      DateTime? timestamp});
}

/// @nodoc
class _$LiveLocationUpdateCopyWithImpl<$Res>
    implements $LiveLocationUpdateCopyWith<$Res> {
  _$LiveLocationUpdateCopyWithImpl(this._self, this._then);

  final LiveLocationUpdate _self;
  final $Res Function(LiveLocationUpdate) _then;

  /// Create a copy of LiveLocationUpdate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? accuracyM = freezed,
    Object? speedMps = freezed,
    Object? headingDeg = freezed,
    Object? incidentId = null,
    Object? batteryPercent = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_self.copyWith(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      accuracyM: freezed == accuracyM
          ? _self.accuracyM
          : accuracyM // ignore: cast_nullable_to_non_nullable
              as double?,
      speedMps: freezed == speedMps
          ? _self.speedMps
          : speedMps // ignore: cast_nullable_to_non_nullable
              as double?,
      headingDeg: freezed == headingDeg
          ? _self.headingDeg
          : headingDeg // ignore: cast_nullable_to_non_nullable
              as double?,
      incidentId: null == incidentId
          ? _self.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      batteryPercent: freezed == batteryPercent
          ? _self.batteryPercent
          : batteryPercent // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [LiveLocationUpdate].
extension LiveLocationUpdatePatterns on LiveLocationUpdate {
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
    TResult Function(_LiveLocationUpdate value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveLocationUpdate() when $default != null:
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
    TResult Function(_LiveLocationUpdate value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveLocationUpdate():
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
    TResult? Function(_LiveLocationUpdate value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveLocationUpdate() when $default != null:
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
            double lat,
            double lng,
            @JsonKey(name: 'accuracy_m') double? accuracyM,
            @JsonKey(name: 'speed_mps') double? speedMps,
            @JsonKey(name: 'heading_deg') double? headingDeg,
            @JsonKey(name: 'incident_id') String incidentId,
            @JsonKey(name: 'battery_percent') int? batteryPercent,
            DateTime? timestamp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveLocationUpdate() when $default != null:
        return $default(
            _that.lat,
            _that.lng,
            _that.accuracyM,
            _that.speedMps,
            _that.headingDeg,
            _that.incidentId,
            _that.batteryPercent,
            _that.timestamp);
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
            double lat,
            double lng,
            @JsonKey(name: 'accuracy_m') double? accuracyM,
            @JsonKey(name: 'speed_mps') double? speedMps,
            @JsonKey(name: 'heading_deg') double? headingDeg,
            @JsonKey(name: 'incident_id') String incidentId,
            @JsonKey(name: 'battery_percent') int? batteryPercent,
            DateTime? timestamp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveLocationUpdate():
        return $default(
            _that.lat,
            _that.lng,
            _that.accuracyM,
            _that.speedMps,
            _that.headingDeg,
            _that.incidentId,
            _that.batteryPercent,
            _that.timestamp);
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
            double lat,
            double lng,
            @JsonKey(name: 'accuracy_m') double? accuracyM,
            @JsonKey(name: 'speed_mps') double? speedMps,
            @JsonKey(name: 'heading_deg') double? headingDeg,
            @JsonKey(name: 'incident_id') String incidentId,
            @JsonKey(name: 'battery_percent') int? batteryPercent,
            DateTime? timestamp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveLocationUpdate() when $default != null:
        return $default(
            _that.lat,
            _that.lng,
            _that.accuracyM,
            _that.speedMps,
            _that.headingDeg,
            _that.incidentId,
            _that.batteryPercent,
            _that.timestamp);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LiveLocationUpdate implements LiveLocationUpdate {
  const _LiveLocationUpdate(
      {required this.lat,
      required this.lng,
      @JsonKey(name: 'accuracy_m') this.accuracyM,
      @JsonKey(name: 'speed_mps') this.speedMps,
      @JsonKey(name: 'heading_deg') this.headingDeg,
      @JsonKey(name: 'incident_id') required this.incidentId,
      @JsonKey(name: 'battery_percent') this.batteryPercent,
      this.timestamp});
  factory _LiveLocationUpdate.fromJson(Map<String, dynamic> json) =>
      _$LiveLocationUpdateFromJson(json);

  @override
  final double lat;
  @override
  final double lng;
  @override
  @JsonKey(name: 'accuracy_m')
  final double? accuracyM;
  @override
  @JsonKey(name: 'speed_mps')
  final double? speedMps;
  @override
  @JsonKey(name: 'heading_deg')
  final double? headingDeg;
  @override
  @JsonKey(name: 'incident_id')
  final String incidentId;
  @override
  @JsonKey(name: 'battery_percent')
  final int? batteryPercent;
  @override
  final DateTime? timestamp;

  /// Create a copy of LiveLocationUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveLocationUpdateCopyWith<_LiveLocationUpdate> get copyWith =>
      __$LiveLocationUpdateCopyWithImpl<_LiveLocationUpdate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LiveLocationUpdateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveLocationUpdate &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.accuracyM, accuracyM) ||
                other.accuracyM == accuracyM) &&
            (identical(other.speedMps, speedMps) ||
                other.speedMps == speedMps) &&
            (identical(other.headingDeg, headingDeg) ||
                other.headingDeg == headingDeg) &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId) &&
            (identical(other.batteryPercent, batteryPercent) ||
                other.batteryPercent == batteryPercent) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng, accuracyM, speedMps,
      headingDeg, incidentId, batteryPercent, timestamp);

  @override
  String toString() {
    return 'LiveLocationUpdate(lat: $lat, lng: $lng, accuracyM: $accuracyM, speedMps: $speedMps, headingDeg: $headingDeg, incidentId: $incidentId, batteryPercent: $batteryPercent, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$LiveLocationUpdateCopyWith<$Res>
    implements $LiveLocationUpdateCopyWith<$Res> {
  factory _$LiveLocationUpdateCopyWith(
          _LiveLocationUpdate value, $Res Function(_LiveLocationUpdate) _then) =
      __$LiveLocationUpdateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double lat,
      double lng,
      @JsonKey(name: 'accuracy_m') double? accuracyM,
      @JsonKey(name: 'speed_mps') double? speedMps,
      @JsonKey(name: 'heading_deg') double? headingDeg,
      @JsonKey(name: 'incident_id') String incidentId,
      @JsonKey(name: 'battery_percent') int? batteryPercent,
      DateTime? timestamp});
}

/// @nodoc
class __$LiveLocationUpdateCopyWithImpl<$Res>
    implements _$LiveLocationUpdateCopyWith<$Res> {
  __$LiveLocationUpdateCopyWithImpl(this._self, this._then);

  final _LiveLocationUpdate _self;
  final $Res Function(_LiveLocationUpdate) _then;

  /// Create a copy of LiveLocationUpdate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? accuracyM = freezed,
    Object? speedMps = freezed,
    Object? headingDeg = freezed,
    Object? incidentId = null,
    Object? batteryPercent = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_LiveLocationUpdate(
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _self.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      accuracyM: freezed == accuracyM
          ? _self.accuracyM
          : accuracyM // ignore: cast_nullable_to_non_nullable
              as double?,
      speedMps: freezed == speedMps
          ? _self.speedMps
          : speedMps // ignore: cast_nullable_to_non_nullable
              as double?,
      headingDeg: freezed == headingDeg
          ? _self.headingDeg
          : headingDeg // ignore: cast_nullable_to_non_nullable
              as double?,
      incidentId: null == incidentId
          ? _self.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      batteryPercent: freezed == batteryPercent
          ? _self.batteryPercent
          : batteryPercent // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$OfflineServicesResponse {
  String get geohash;
  List<Map<String, dynamic>> get services;
  @JsonKey(name: 'ttl_seconds')
  int get ttlSeconds;

  /// Create a copy of OfflineServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OfflineServicesResponseCopyWith<OfflineServicesResponse> get copyWith =>
      _$OfflineServicesResponseCopyWithImpl<OfflineServicesResponse>(
          this as OfflineServicesResponse, _$identity);

  /// Serializes this OfflineServicesResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OfflineServicesResponse &&
            (identical(other.geohash, geohash) || other.geohash == geohash) &&
            const DeepCollectionEquality().equals(other.services, services) &&
            (identical(other.ttlSeconds, ttlSeconds) ||
                other.ttlSeconds == ttlSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, geohash,
      const DeepCollectionEquality().hash(services), ttlSeconds);

  @override
  String toString() {
    return 'OfflineServicesResponse(geohash: $geohash, services: $services, ttlSeconds: $ttlSeconds)';
  }
}

/// @nodoc
abstract mixin class $OfflineServicesResponseCopyWith<$Res> {
  factory $OfflineServicesResponseCopyWith(OfflineServicesResponse value,
          $Res Function(OfflineServicesResponse) _then) =
      _$OfflineServicesResponseCopyWithImpl;
  @useResult
  $Res call(
      {String geohash,
      List<Map<String, dynamic>> services,
      @JsonKey(name: 'ttl_seconds') int ttlSeconds});
}

/// @nodoc
class _$OfflineServicesResponseCopyWithImpl<$Res>
    implements $OfflineServicesResponseCopyWith<$Res> {
  _$OfflineServicesResponseCopyWithImpl(this._self, this._then);

  final OfflineServicesResponse _self;
  final $Res Function(OfflineServicesResponse) _then;

  /// Create a copy of OfflineServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geohash = null,
    Object? services = null,
    Object? ttlSeconds = null,
  }) {
    return _then(_self.copyWith(
      geohash: null == geohash
          ? _self.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
      services: null == services
          ? _self.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      ttlSeconds: null == ttlSeconds
          ? _self.ttlSeconds
          : ttlSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [OfflineServicesResponse].
extension OfflineServicesResponsePatterns on OfflineServicesResponse {
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
    TResult Function(_OfflineServicesResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfflineServicesResponse() when $default != null:
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
    TResult Function(_OfflineServicesResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineServicesResponse():
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
    TResult? Function(_OfflineServicesResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineServicesResponse() when $default != null:
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
    TResult Function(String geohash, List<Map<String, dynamic>> services,
            @JsonKey(name: 'ttl_seconds') int ttlSeconds)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OfflineServicesResponse() when $default != null:
        return $default(_that.geohash, _that.services, _that.ttlSeconds);
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
    TResult Function(String geohash, List<Map<String, dynamic>> services,
            @JsonKey(name: 'ttl_seconds') int ttlSeconds)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineServicesResponse():
        return $default(_that.geohash, _that.services, _that.ttlSeconds);
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
    TResult? Function(String geohash, List<Map<String, dynamic>> services,
            @JsonKey(name: 'ttl_seconds') int ttlSeconds)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OfflineServicesResponse() when $default != null:
        return $default(_that.geohash, _that.services, _that.ttlSeconds);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _OfflineServicesResponse implements OfflineServicesResponse {
  const _OfflineServicesResponse(
      {required this.geohash,
      required final List<Map<String, dynamic>> services,
      @JsonKey(name: 'ttl_seconds') this.ttlSeconds = 86400})
      : _services = services;
  factory _OfflineServicesResponse.fromJson(Map<String, dynamic> json) =>
      _$OfflineServicesResponseFromJson(json);

  @override
  final String geohash;
  final List<Map<String, dynamic>> _services;
  @override
  List<Map<String, dynamic>> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  @JsonKey(name: 'ttl_seconds')
  final int ttlSeconds;

  /// Create a copy of OfflineServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OfflineServicesResponseCopyWith<_OfflineServicesResponse> get copyWith =>
      __$OfflineServicesResponseCopyWithImpl<_OfflineServicesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OfflineServicesResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OfflineServicesResponse &&
            (identical(other.geohash, geohash) || other.geohash == geohash) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.ttlSeconds, ttlSeconds) ||
                other.ttlSeconds == ttlSeconds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, geohash,
      const DeepCollectionEquality().hash(_services), ttlSeconds);

  @override
  String toString() {
    return 'OfflineServicesResponse(geohash: $geohash, services: $services, ttlSeconds: $ttlSeconds)';
  }
}

/// @nodoc
abstract mixin class _$OfflineServicesResponseCopyWith<$Res>
    implements $OfflineServicesResponseCopyWith<$Res> {
  factory _$OfflineServicesResponseCopyWith(_OfflineServicesResponse value,
          $Res Function(_OfflineServicesResponse) _then) =
      __$OfflineServicesResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String geohash,
      List<Map<String, dynamic>> services,
      @JsonKey(name: 'ttl_seconds') int ttlSeconds});
}

/// @nodoc
class __$OfflineServicesResponseCopyWithImpl<$Res>
    implements _$OfflineServicesResponseCopyWith<$Res> {
  __$OfflineServicesResponseCopyWithImpl(this._self, this._then);

  final _OfflineServicesResponse _self;
  final $Res Function(_OfflineServicesResponse) _then;

  /// Create a copy of OfflineServicesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? geohash = null,
    Object? services = null,
    Object? ttlSeconds = null,
  }) {
    return _then(_OfflineServicesResponse(
      geohash: null == geohash
          ? _self.geohash
          : geohash // ignore: cast_nullable_to_non_nullable
              as String,
      services: null == services
          ? _self._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      ttlSeconds: null == ttlSeconds
          ? _self.ttlSeconds
          : ttlSeconds // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$NearbyService {
  String get id;
  String get name;
  String get type;
  @JsonKey(name: 'distance_km')
  double get distanceKm;
  @JsonKey(name: 'trust_score')
  double get trustScore;
  @JsonKey(name: 'explainable_trust')
  String get explainableTrust;
  String? get phone;
  double get lat;
  double get lng;

  /// Create a copy of NearbyService
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NearbyServiceCopyWith<NearbyService> get copyWith =>
      _$NearbyServiceCopyWithImpl<NearbyService>(
          this as NearbyService, _$identity);

  /// Serializes this NearbyService to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NearbyService &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.trustScore, trustScore) ||
                other.trustScore == trustScore) &&
            (identical(other.explainableTrust, explainableTrust) ||
                other.explainableTrust == explainableTrust) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, distanceKm,
      trustScore, explainableTrust, phone, lat, lng);

  @override
  String toString() {
    return 'NearbyService(id: $id, name: $name, type: $type, distanceKm: $distanceKm, trustScore: $trustScore, explainableTrust: $explainableTrust, phone: $phone, lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class $NearbyServiceCopyWith<$Res> {
  factory $NearbyServiceCopyWith(
          NearbyService value, $Res Function(NearbyService) _then) =
      _$NearbyServiceCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'trust_score') double trustScore,
      @JsonKey(name: 'explainable_trust') String explainableTrust,
      String? phone,
      double lat,
      double lng});
}

/// @nodoc
class _$NearbyServiceCopyWithImpl<$Res>
    implements $NearbyServiceCopyWith<$Res> {
  _$NearbyServiceCopyWithImpl(this._self, this._then);

  final NearbyService _self;
  final $Res Function(NearbyService) _then;

  /// Create a copy of NearbyService
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? distanceKm = null,
    Object? trustScore = null,
    Object? explainableTrust = null,
    Object? phone = freezed,
    Object? lat = null,
    Object? lng = null,
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
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      trustScore: null == trustScore
          ? _self.trustScore
          : trustScore // ignore: cast_nullable_to_non_nullable
              as double,
      explainableTrust: null == explainableTrust
          ? _self.explainableTrust
          : explainableTrust // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
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

/// Adds pattern-matching-related methods to [NearbyService].
extension NearbyServicePatterns on NearbyService {
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
    TResult Function(_NearbyService value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyService() when $default != null:
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
    TResult Function(_NearbyService value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyService():
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
    TResult? Function(_NearbyService value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyService() when $default != null:
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
            String type,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'trust_score') double trustScore,
            @JsonKey(name: 'explainable_trust') String explainableTrust,
            String? phone,
            double lat,
            double lng)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NearbyService() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.distanceKm,
            _that.trustScore,
            _that.explainableTrust,
            _that.phone,
            _that.lat,
            _that.lng);
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
            String type,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'trust_score') double trustScore,
            @JsonKey(name: 'explainable_trust') String explainableTrust,
            String? phone,
            double lat,
            double lng)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyService():
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.distanceKm,
            _that.trustScore,
            _that.explainableTrust,
            _that.phone,
            _that.lat,
            _that.lng);
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
            String type,
            @JsonKey(name: 'distance_km') double distanceKm,
            @JsonKey(name: 'trust_score') double trustScore,
            @JsonKey(name: 'explainable_trust') String explainableTrust,
            String? phone,
            double lat,
            double lng)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NearbyService() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.distanceKm,
            _that.trustScore,
            _that.explainableTrust,
            _that.phone,
            _that.lat,
            _that.lng);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _NearbyService implements NearbyService {
  const _NearbyService(
      {required this.id,
      required this.name,
      required this.type,
      @JsonKey(name: 'distance_km') required this.distanceKm,
      @JsonKey(name: 'trust_score') required this.trustScore,
      @JsonKey(name: 'explainable_trust') required this.explainableTrust,
      this.phone,
      required this.lat,
      required this.lng});
  factory _NearbyService.fromJson(Map<String, dynamic> json) =>
      _$NearbyServiceFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  @JsonKey(name: 'distance_km')
  final double distanceKm;
  @override
  @JsonKey(name: 'trust_score')
  final double trustScore;
  @override
  @JsonKey(name: 'explainable_trust')
  final String explainableTrust;
  @override
  final String? phone;
  @override
  final double lat;
  @override
  final double lng;

  /// Create a copy of NearbyService
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NearbyServiceCopyWith<_NearbyService> get copyWith =>
      __$NearbyServiceCopyWithImpl<_NearbyService>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NearbyServiceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NearbyService &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(other.trustScore, trustScore) ||
                other.trustScore == trustScore) &&
            (identical(other.explainableTrust, explainableTrust) ||
                other.explainableTrust == explainableTrust) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, distanceKm,
      trustScore, explainableTrust, phone, lat, lng);

  @override
  String toString() {
    return 'NearbyService(id: $id, name: $name, type: $type, distanceKm: $distanceKm, trustScore: $trustScore, explainableTrust: $explainableTrust, phone: $phone, lat: $lat, lng: $lng)';
  }
}

/// @nodoc
abstract mixin class _$NearbyServiceCopyWith<$Res>
    implements $NearbyServiceCopyWith<$Res> {
  factory _$NearbyServiceCopyWith(
          _NearbyService value, $Res Function(_NearbyService) _then) =
      __$NearbyServiceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      @JsonKey(name: 'distance_km') double distanceKm,
      @JsonKey(name: 'trust_score') double trustScore,
      @JsonKey(name: 'explainable_trust') String explainableTrust,
      String? phone,
      double lat,
      double lng});
}

/// @nodoc
class __$NearbyServiceCopyWithImpl<$Res>
    implements _$NearbyServiceCopyWith<$Res> {
  __$NearbyServiceCopyWithImpl(this._self, this._then);

  final _NearbyService _self;
  final $Res Function(_NearbyService) _then;

  /// Create a copy of NearbyService
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? distanceKm = null,
    Object? trustScore = null,
    Object? explainableTrust = null,
    Object? phone = freezed,
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_NearbyService(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      distanceKm: null == distanceKm
          ? _self.distanceKm
          : distanceKm // ignore: cast_nullable_to_non_nullable
              as double,
      trustScore: null == trustScore
          ? _self.trustScore
          : trustScore // ignore: cast_nullable_to_non_nullable
              as double,
      explainableTrust: null == explainableTrust
          ? _self.explainableTrust
          : explainableTrust // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
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
mixin _$EmergencyBundle {
  @JsonKey(name: 'incident_id')
  String get incidentId;
  String get severity;
  @JsonKey(name: 'confidence_overall')
  double get confidenceScore;
  @JsonKey(name: 'golden_hour_risk_index')
  double get goldenHourRisk;
  @JsonKey(name: 'recommended_action_plan')
  List<Map<String, dynamic>> get actionPlan;
  @JsonKey(name: 'medical')
  List<NearbyService> get medicalServices;
  @JsonKey(name: 'safety')
  List<NearbyService> get safetyServices;
  @JsonKey(name: 'vehicle')
  List<NearbyService> get vehicleServices;
  @JsonKey(name: 'offline_payload')
  Map<String, dynamic>? get offlinePayload;
  @JsonKey(name: 'country_fallback')
  Map<String, String>? get countryFallbacks;

  /// Create a copy of EmergencyBundle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmergencyBundleCopyWith<EmergencyBundle> get copyWith =>
      _$EmergencyBundleCopyWithImpl<EmergencyBundle>(
          this as EmergencyBundle, _$identity);

  /// Serializes this EmergencyBundle to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmergencyBundle &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            (identical(other.goldenHourRisk, goldenHourRisk) ||
                other.goldenHourRisk == goldenHourRisk) &&
            const DeepCollectionEquality()
                .equals(other.actionPlan, actionPlan) &&
            const DeepCollectionEquality()
                .equals(other.medicalServices, medicalServices) &&
            const DeepCollectionEquality()
                .equals(other.safetyServices, safetyServices) &&
            const DeepCollectionEquality()
                .equals(other.vehicleServices, vehicleServices) &&
            const DeepCollectionEquality()
                .equals(other.offlinePayload, offlinePayload) &&
            const DeepCollectionEquality()
                .equals(other.countryFallbacks, countryFallbacks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      incidentId,
      severity,
      confidenceScore,
      goldenHourRisk,
      const DeepCollectionEquality().hash(actionPlan),
      const DeepCollectionEquality().hash(medicalServices),
      const DeepCollectionEquality().hash(safetyServices),
      const DeepCollectionEquality().hash(vehicleServices),
      const DeepCollectionEquality().hash(offlinePayload),
      const DeepCollectionEquality().hash(countryFallbacks));

  @override
  String toString() {
    return 'EmergencyBundle(incidentId: $incidentId, severity: $severity, confidenceScore: $confidenceScore, goldenHourRisk: $goldenHourRisk, actionPlan: $actionPlan, medicalServices: $medicalServices, safetyServices: $safetyServices, vehicleServices: $vehicleServices, offlinePayload: $offlinePayload, countryFallbacks: $countryFallbacks)';
  }
}

/// @nodoc
abstract mixin class $EmergencyBundleCopyWith<$Res> {
  factory $EmergencyBundleCopyWith(
          EmergencyBundle value, $Res Function(EmergencyBundle) _then) =
      _$EmergencyBundleCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'incident_id') String incidentId,
      String severity,
      @JsonKey(name: 'confidence_overall') double confidenceScore,
      @JsonKey(name: 'golden_hour_risk_index') double goldenHourRisk,
      @JsonKey(name: 'recommended_action_plan')
      List<Map<String, dynamic>> actionPlan,
      @JsonKey(name: 'medical') List<NearbyService> medicalServices,
      @JsonKey(name: 'safety') List<NearbyService> safetyServices,
      @JsonKey(name: 'vehicle') List<NearbyService> vehicleServices,
      @JsonKey(name: 'offline_payload') Map<String, dynamic>? offlinePayload,
      @JsonKey(name: 'country_fallback')
      Map<String, String>? countryFallbacks});
}

/// @nodoc
class _$EmergencyBundleCopyWithImpl<$Res>
    implements $EmergencyBundleCopyWith<$Res> {
  _$EmergencyBundleCopyWithImpl(this._self, this._then);

  final EmergencyBundle _self;
  final $Res Function(EmergencyBundle) _then;

  /// Create a copy of EmergencyBundle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incidentId = null,
    Object? severity = null,
    Object? confidenceScore = null,
    Object? goldenHourRisk = null,
    Object? actionPlan = null,
    Object? medicalServices = null,
    Object? safetyServices = null,
    Object? vehicleServices = null,
    Object? offlinePayload = freezed,
    Object? countryFallbacks = freezed,
  }) {
    return _then(_self.copyWith(
      incidentId: null == incidentId
          ? _self.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      confidenceScore: null == confidenceScore
          ? _self.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double,
      goldenHourRisk: null == goldenHourRisk
          ? _self.goldenHourRisk
          : goldenHourRisk // ignore: cast_nullable_to_non_nullable
              as double,
      actionPlan: null == actionPlan
          ? _self.actionPlan
          : actionPlan // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      medicalServices: null == medicalServices
          ? _self.medicalServices
          : medicalServices // ignore: cast_nullable_to_non_nullable
              as List<NearbyService>,
      safetyServices: null == safetyServices
          ? _self.safetyServices
          : safetyServices // ignore: cast_nullable_to_non_nullable
              as List<NearbyService>,
      vehicleServices: null == vehicleServices
          ? _self.vehicleServices
          : vehicleServices // ignore: cast_nullable_to_non_nullable
              as List<NearbyService>,
      offlinePayload: freezed == offlinePayload
          ? _self.offlinePayload
          : offlinePayload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      countryFallbacks: freezed == countryFallbacks
          ? _self.countryFallbacks
          : countryFallbacks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [EmergencyBundle].
extension EmergencyBundlePatterns on EmergencyBundle {
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
    TResult Function(_EmergencyBundle value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmergencyBundle() when $default != null:
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
    TResult Function(_EmergencyBundle value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmergencyBundle():
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
    TResult? Function(_EmergencyBundle value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmergencyBundle() when $default != null:
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
            @JsonKey(name: 'incident_id') String incidentId,
            String severity,
            @JsonKey(name: 'confidence_overall') double confidenceScore,
            @JsonKey(name: 'golden_hour_risk_index') double goldenHourRisk,
            @JsonKey(name: 'recommended_action_plan')
            List<Map<String, dynamic>> actionPlan,
            @JsonKey(name: 'medical') List<NearbyService> medicalServices,
            @JsonKey(name: 'safety') List<NearbyService> safetyServices,
            @JsonKey(name: 'vehicle') List<NearbyService> vehicleServices,
            @JsonKey(name: 'offline_payload')
            Map<String, dynamic>? offlinePayload,
            @JsonKey(name: 'country_fallback')
            Map<String, String>? countryFallbacks)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _EmergencyBundle() when $default != null:
        return $default(
            _that.incidentId,
            _that.severity,
            _that.confidenceScore,
            _that.goldenHourRisk,
            _that.actionPlan,
            _that.medicalServices,
            _that.safetyServices,
            _that.vehicleServices,
            _that.offlinePayload,
            _that.countryFallbacks);
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
            @JsonKey(name: 'incident_id') String incidentId,
            String severity,
            @JsonKey(name: 'confidence_overall') double confidenceScore,
            @JsonKey(name: 'golden_hour_risk_index') double goldenHourRisk,
            @JsonKey(name: 'recommended_action_plan')
            List<Map<String, dynamic>> actionPlan,
            @JsonKey(name: 'medical') List<NearbyService> medicalServices,
            @JsonKey(name: 'safety') List<NearbyService> safetyServices,
            @JsonKey(name: 'vehicle') List<NearbyService> vehicleServices,
            @JsonKey(name: 'offline_payload')
            Map<String, dynamic>? offlinePayload,
            @JsonKey(name: 'country_fallback')
            Map<String, String>? countryFallbacks)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmergencyBundle():
        return $default(
            _that.incidentId,
            _that.severity,
            _that.confidenceScore,
            _that.goldenHourRisk,
            _that.actionPlan,
            _that.medicalServices,
            _that.safetyServices,
            _that.vehicleServices,
            _that.offlinePayload,
            _that.countryFallbacks);
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
            @JsonKey(name: 'incident_id') String incidentId,
            String severity,
            @JsonKey(name: 'confidence_overall') double confidenceScore,
            @JsonKey(name: 'golden_hour_risk_index') double goldenHourRisk,
            @JsonKey(name: 'recommended_action_plan')
            List<Map<String, dynamic>> actionPlan,
            @JsonKey(name: 'medical') List<NearbyService> medicalServices,
            @JsonKey(name: 'safety') List<NearbyService> safetyServices,
            @JsonKey(name: 'vehicle') List<NearbyService> vehicleServices,
            @JsonKey(name: 'offline_payload')
            Map<String, dynamic>? offlinePayload,
            @JsonKey(name: 'country_fallback')
            Map<String, String>? countryFallbacks)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _EmergencyBundle() when $default != null:
        return $default(
            _that.incidentId,
            _that.severity,
            _that.confidenceScore,
            _that.goldenHourRisk,
            _that.actionPlan,
            _that.medicalServices,
            _that.safetyServices,
            _that.vehicleServices,
            _that.offlinePayload,
            _that.countryFallbacks);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _EmergencyBundle implements EmergencyBundle {
  const _EmergencyBundle(
      {@JsonKey(name: 'incident_id') required this.incidentId,
      required this.severity,
      @JsonKey(name: 'confidence_overall') required this.confidenceScore,
      @JsonKey(name: 'golden_hour_risk_index') required this.goldenHourRisk,
      @JsonKey(name: 'recommended_action_plan')
      required final List<Map<String, dynamic>> actionPlan,
      @JsonKey(name: 'medical')
      required final List<NearbyService> medicalServices,
      @JsonKey(name: 'safety')
      required final List<NearbyService> safetyServices,
      @JsonKey(name: 'vehicle')
      required final List<NearbyService> vehicleServices,
      @JsonKey(name: 'offline_payload')
      final Map<String, dynamic>? offlinePayload,
      @JsonKey(name: 'country_fallback')
      final Map<String, String>? countryFallbacks})
      : _actionPlan = actionPlan,
        _medicalServices = medicalServices,
        _safetyServices = safetyServices,
        _vehicleServices = vehicleServices,
        _offlinePayload = offlinePayload,
        _countryFallbacks = countryFallbacks;
  factory _EmergencyBundle.fromJson(Map<String, dynamic> json) =>
      _$EmergencyBundleFromJson(json);

  @override
  @JsonKey(name: 'incident_id')
  final String incidentId;
  @override
  final String severity;
  @override
  @JsonKey(name: 'confidence_overall')
  final double confidenceScore;
  @override
  @JsonKey(name: 'golden_hour_risk_index')
  final double goldenHourRisk;
  final List<Map<String, dynamic>> _actionPlan;
  @override
  @JsonKey(name: 'recommended_action_plan')
  List<Map<String, dynamic>> get actionPlan {
    if (_actionPlan is EqualUnmodifiableListView) return _actionPlan;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionPlan);
  }

  final List<NearbyService> _medicalServices;
  @override
  @JsonKey(name: 'medical')
  List<NearbyService> get medicalServices {
    if (_medicalServices is EqualUnmodifiableListView) return _medicalServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicalServices);
  }

  final List<NearbyService> _safetyServices;
  @override
  @JsonKey(name: 'safety')
  List<NearbyService> get safetyServices {
    if (_safetyServices is EqualUnmodifiableListView) return _safetyServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_safetyServices);
  }

  final List<NearbyService> _vehicleServices;
  @override
  @JsonKey(name: 'vehicle')
  List<NearbyService> get vehicleServices {
    if (_vehicleServices is EqualUnmodifiableListView) return _vehicleServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vehicleServices);
  }

  final Map<String, dynamic>? _offlinePayload;
  @override
  @JsonKey(name: 'offline_payload')
  Map<String, dynamic>? get offlinePayload {
    final value = _offlinePayload;
    if (value == null) return null;
    if (_offlinePayload is EqualUnmodifiableMapView) return _offlinePayload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, String>? _countryFallbacks;
  @override
  @JsonKey(name: 'country_fallback')
  Map<String, String>? get countryFallbacks {
    final value = _countryFallbacks;
    if (value == null) return null;
    if (_countryFallbacks is EqualUnmodifiableMapView) return _countryFallbacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of EmergencyBundle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmergencyBundleCopyWith<_EmergencyBundle> get copyWith =>
      __$EmergencyBundleCopyWithImpl<_EmergencyBundle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EmergencyBundleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmergencyBundle &&
            (identical(other.incidentId, incidentId) ||
                other.incidentId == incidentId) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            (identical(other.goldenHourRisk, goldenHourRisk) ||
                other.goldenHourRisk == goldenHourRisk) &&
            const DeepCollectionEquality()
                .equals(other._actionPlan, _actionPlan) &&
            const DeepCollectionEquality()
                .equals(other._medicalServices, _medicalServices) &&
            const DeepCollectionEquality()
                .equals(other._safetyServices, _safetyServices) &&
            const DeepCollectionEquality()
                .equals(other._vehicleServices, _vehicleServices) &&
            const DeepCollectionEquality()
                .equals(other._offlinePayload, _offlinePayload) &&
            const DeepCollectionEquality()
                .equals(other._countryFallbacks, _countryFallbacks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      incidentId,
      severity,
      confidenceScore,
      goldenHourRisk,
      const DeepCollectionEquality().hash(_actionPlan),
      const DeepCollectionEquality().hash(_medicalServices),
      const DeepCollectionEquality().hash(_safetyServices),
      const DeepCollectionEquality().hash(_vehicleServices),
      const DeepCollectionEquality().hash(_offlinePayload),
      const DeepCollectionEquality().hash(_countryFallbacks));

  @override
  String toString() {
    return 'EmergencyBundle(incidentId: $incidentId, severity: $severity, confidenceScore: $confidenceScore, goldenHourRisk: $goldenHourRisk, actionPlan: $actionPlan, medicalServices: $medicalServices, safetyServices: $safetyServices, vehicleServices: $vehicleServices, offlinePayload: $offlinePayload, countryFallbacks: $countryFallbacks)';
  }
}

/// @nodoc
abstract mixin class _$EmergencyBundleCopyWith<$Res>
    implements $EmergencyBundleCopyWith<$Res> {
  factory _$EmergencyBundleCopyWith(
          _EmergencyBundle value, $Res Function(_EmergencyBundle) _then) =
      __$EmergencyBundleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'incident_id') String incidentId,
      String severity,
      @JsonKey(name: 'confidence_overall') double confidenceScore,
      @JsonKey(name: 'golden_hour_risk_index') double goldenHourRisk,
      @JsonKey(name: 'recommended_action_plan')
      List<Map<String, dynamic>> actionPlan,
      @JsonKey(name: 'medical') List<NearbyService> medicalServices,
      @JsonKey(name: 'safety') List<NearbyService> safetyServices,
      @JsonKey(name: 'vehicle') List<NearbyService> vehicleServices,
      @JsonKey(name: 'offline_payload') Map<String, dynamic>? offlinePayload,
      @JsonKey(name: 'country_fallback')
      Map<String, String>? countryFallbacks});
}

/// @nodoc
class __$EmergencyBundleCopyWithImpl<$Res>
    implements _$EmergencyBundleCopyWith<$Res> {
  __$EmergencyBundleCopyWithImpl(this._self, this._then);

  final _EmergencyBundle _self;
  final $Res Function(_EmergencyBundle) _then;

  /// Create a copy of EmergencyBundle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? incidentId = null,
    Object? severity = null,
    Object? confidenceScore = null,
    Object? goldenHourRisk = null,
    Object? actionPlan = null,
    Object? medicalServices = null,
    Object? safetyServices = null,
    Object? vehicleServices = null,
    Object? offlinePayload = freezed,
    Object? countryFallbacks = freezed,
  }) {
    return _then(_EmergencyBundle(
      incidentId: null == incidentId
          ? _self.incidentId
          : incidentId // ignore: cast_nullable_to_non_nullable
              as String,
      severity: null == severity
          ? _self.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as String,
      confidenceScore: null == confidenceScore
          ? _self.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as double,
      goldenHourRisk: null == goldenHourRisk
          ? _self.goldenHourRisk
          : goldenHourRisk // ignore: cast_nullable_to_non_nullable
              as double,
      actionPlan: null == actionPlan
          ? _self._actionPlan
          : actionPlan // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      medicalServices: null == medicalServices
          ? _self._medicalServices
          : medicalServices // ignore: cast_nullable_to_non_nullable
              as List<NearbyService>,
      safetyServices: null == safetyServices
          ? _self._safetyServices
          : safetyServices // ignore: cast_nullable_to_non_nullable
              as List<NearbyService>,
      vehicleServices: null == vehicleServices
          ? _self._vehicleServices
          : vehicleServices // ignore: cast_nullable_to_non_nullable
              as List<NearbyService>,
      offlinePayload: freezed == offlinePayload
          ? _self._offlinePayload
          : offlinePayload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      countryFallbacks: freezed == countryFallbacks
          ? _self._countryFallbacks
          : countryFallbacks // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

// dart format on
