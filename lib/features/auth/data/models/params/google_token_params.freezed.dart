// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_token_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoogleTokenParams {

@JsonKey(name: 'id_token') String get idToken;
/// Create a copy of GoogleTokenParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleTokenParamsCopyWith<GoogleTokenParams> get copyWith => _$GoogleTokenParamsCopyWithImpl<GoogleTokenParams>(this as GoogleTokenParams, _$identity);

  /// Serializes this GoogleTokenParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleTokenParams&&(identical(other.idToken, idToken) || other.idToken == idToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idToken);

@override
String toString() {
  return 'GoogleTokenParams(idToken: $idToken)';
}


}

/// @nodoc
abstract mixin class $GoogleTokenParamsCopyWith<$Res>  {
  factory $GoogleTokenParamsCopyWith(GoogleTokenParams value, $Res Function(GoogleTokenParams) _then) = _$GoogleTokenParamsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_token') String idToken
});




}
/// @nodoc
class _$GoogleTokenParamsCopyWithImpl<$Res>
    implements $GoogleTokenParamsCopyWith<$Res> {
  _$GoogleTokenParamsCopyWithImpl(this._self, this._then);

  final GoogleTokenParams _self;
  final $Res Function(GoogleTokenParams) _then;

/// Create a copy of GoogleTokenParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idToken = null,}) {
  return _then(_self.copyWith(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GoogleTokenParams].
extension GoogleTokenParamsPatterns on GoogleTokenParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleTokenParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleTokenParams() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleTokenParams value)  $default,){
final _that = this;
switch (_that) {
case _GoogleTokenParams():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleTokenParams value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleTokenParams() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_token')  String idToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleTokenParams() when $default != null:
return $default(_that.idToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_token')  String idToken)  $default,) {final _that = this;
switch (_that) {
case _GoogleTokenParams():
return $default(_that.idToken);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_token')  String idToken)?  $default,) {final _that = this;
switch (_that) {
case _GoogleTokenParams() when $default != null:
return $default(_that.idToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleTokenParams implements GoogleTokenParams {
  const _GoogleTokenParams({@JsonKey(name: 'id_token') required this.idToken});
  factory _GoogleTokenParams.fromJson(Map<String, dynamic> json) => _$GoogleTokenParamsFromJson(json);

@override@JsonKey(name: 'id_token') final  String idToken;

/// Create a copy of GoogleTokenParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleTokenParamsCopyWith<_GoogleTokenParams> get copyWith => __$GoogleTokenParamsCopyWithImpl<_GoogleTokenParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleTokenParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleTokenParams&&(identical(other.idToken, idToken) || other.idToken == idToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idToken);

@override
String toString() {
  return 'GoogleTokenParams(idToken: $idToken)';
}


}

/// @nodoc
abstract mixin class _$GoogleTokenParamsCopyWith<$Res> implements $GoogleTokenParamsCopyWith<$Res> {
  factory _$GoogleTokenParamsCopyWith(_GoogleTokenParams value, $Res Function(_GoogleTokenParams) _then) = __$GoogleTokenParamsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_token') String idToken
});




}
/// @nodoc
class __$GoogleTokenParamsCopyWithImpl<$Res>
    implements _$GoogleTokenParamsCopyWith<$Res> {
  __$GoogleTokenParamsCopyWithImpl(this._self, this._then);

  final _GoogleTokenParams _self;
  final $Res Function(_GoogleTokenParams) _then;

/// Create a copy of GoogleTokenParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idToken = null,}) {
  return _then(_GoogleTokenParams(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
