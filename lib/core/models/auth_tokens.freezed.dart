// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_tokens.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthTokens {

 String get accessToken; String get client; String get uid; String get tokenType; int get expiry; DateTime? get createdAt;
/// Create a copy of AuthTokens
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthTokensCopyWith<AuthTokens> get copyWith => _$AuthTokensCopyWithImpl<AuthTokens>(this as AuthTokens, _$identity);

  /// Serializes this AuthTokens to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthTokens&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.client, client) || other.client == client)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiry, expiry) || other.expiry == expiry)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,client,uid,tokenType,expiry,createdAt);

@override
String toString() {
  return 'AuthTokens(accessToken: $accessToken, client: $client, uid: $uid, tokenType: $tokenType, expiry: $expiry, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AuthTokensCopyWith<$Res>  {
  factory $AuthTokensCopyWith(AuthTokens value, $Res Function(AuthTokens) _then) = _$AuthTokensCopyWithImpl;
@useResult
$Res call({
 String accessToken, String client, String uid, String tokenType, int expiry, DateTime? createdAt
});




}
/// @nodoc
class _$AuthTokensCopyWithImpl<$Res>
    implements $AuthTokensCopyWith<$Res> {
  _$AuthTokensCopyWithImpl(this._self, this._then);

  final AuthTokens _self;
  final $Res Function(AuthTokens) _then;

/// Create a copy of AuthTokens
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? client = null,Object? uid = null,Object? tokenType = null,Object? expiry = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiry: null == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthTokens].
extension AuthTokensPatterns on AuthTokens {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthTokens value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthTokens() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthTokens value)  $default,){
final _that = this;
switch (_that) {
case _AuthTokens():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthTokens value)?  $default,){
final _that = this;
switch (_that) {
case _AuthTokens() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accessToken,  String client,  String uid,  String tokenType,  int expiry,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthTokens() when $default != null:
return $default(_that.accessToken,_that.client,_that.uid,_that.tokenType,_that.expiry,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accessToken,  String client,  String uid,  String tokenType,  int expiry,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _AuthTokens():
return $default(_that.accessToken,_that.client,_that.uid,_that.tokenType,_that.expiry,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accessToken,  String client,  String uid,  String tokenType,  int expiry,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AuthTokens() when $default != null:
return $default(_that.accessToken,_that.client,_that.uid,_that.tokenType,_that.expiry,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthTokens implements AuthTokens {
  const _AuthTokens({required this.accessToken, required this.client, required this.uid, required this.tokenType, required this.expiry, this.createdAt});
  factory _AuthTokens.fromJson(Map<String, dynamic> json) => _$AuthTokensFromJson(json);

@override final  String accessToken;
@override final  String client;
@override final  String uid;
@override final  String tokenType;
@override final  int expiry;
@override final  DateTime? createdAt;

/// Create a copy of AuthTokens
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthTokensCopyWith<_AuthTokens> get copyWith => __$AuthTokensCopyWithImpl<_AuthTokens>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthTokensToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthTokens&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.client, client) || other.client == client)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.expiry, expiry) || other.expiry == expiry)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,client,uid,tokenType,expiry,createdAt);

@override
String toString() {
  return 'AuthTokens(accessToken: $accessToken, client: $client, uid: $uid, tokenType: $tokenType, expiry: $expiry, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AuthTokensCopyWith<$Res> implements $AuthTokensCopyWith<$Res> {
  factory _$AuthTokensCopyWith(_AuthTokens value, $Res Function(_AuthTokens) _then) = __$AuthTokensCopyWithImpl;
@override @useResult
$Res call({
 String accessToken, String client, String uid, String tokenType, int expiry, DateTime? createdAt
});




}
/// @nodoc
class __$AuthTokensCopyWithImpl<$Res>
    implements _$AuthTokensCopyWith<$Res> {
  __$AuthTokensCopyWithImpl(this._self, this._then);

  final _AuthTokens _self;
  final $Res Function(_AuthTokens) _then;

/// Create a copy of AuthTokens
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? client = null,Object? uid = null,Object? tokenType = null,Object? expiry = null,Object? createdAt = freezed,}) {
  return _then(_AuthTokens(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,client: null == client ? _self.client : client // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,tokenType: null == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String,expiry: null == expiry ? _self.expiry : expiry // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
