// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoogleLoginResponse {

 bool get success; User get user;@JsonKey(name: 'auth_tokens') AuthTokens get authTokens; String? get message;
/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleLoginResponseCopyWith<GoogleLoginResponse> get copyWith => _$GoogleLoginResponseCopyWithImpl<GoogleLoginResponse>(this as GoogleLoginResponse, _$identity);

  /// Serializes this GoogleLoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleLoginResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.user, user) || other.user == user)&&(identical(other.authTokens, authTokens) || other.authTokens == authTokens)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,user,authTokens,message);

@override
String toString() {
  return 'GoogleLoginResponse(success: $success, user: $user, authTokens: $authTokens, message: $message)';
}


}

/// @nodoc
abstract mixin class $GoogleLoginResponseCopyWith<$Res>  {
  factory $GoogleLoginResponseCopyWith(GoogleLoginResponse value, $Res Function(GoogleLoginResponse) _then) = _$GoogleLoginResponseCopyWithImpl;
@useResult
$Res call({
 bool success, User user,@JsonKey(name: 'auth_tokens') AuthTokens authTokens, String? message
});


$UserCopyWith<$Res> get user;$AuthTokensCopyWith<$Res> get authTokens;

}
/// @nodoc
class _$GoogleLoginResponseCopyWithImpl<$Res>
    implements $GoogleLoginResponseCopyWith<$Res> {
  _$GoogleLoginResponseCopyWithImpl(this._self, this._then);

  final GoogleLoginResponse _self;
  final $Res Function(GoogleLoginResponse) _then;

/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? user = null,Object? authTokens = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,authTokens: null == authTokens ? _self.authTokens : authTokens // ignore: cast_nullable_to_non_nullable
as AuthTokens,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokensCopyWith<$Res> get authTokens {
  
  return $AuthTokensCopyWith<$Res>(_self.authTokens, (value) {
    return _then(_self.copyWith(authTokens: value));
  });
}
}


/// Adds pattern-matching-related methods to [GoogleLoginResponse].
extension GoogleLoginResponsePatterns on GoogleLoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleLoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleLoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleLoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _GoogleLoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleLoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleLoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  User user, @JsonKey(name: 'auth_tokens')  AuthTokens authTokens,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleLoginResponse() when $default != null:
return $default(_that.success,_that.user,_that.authTokens,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  User user, @JsonKey(name: 'auth_tokens')  AuthTokens authTokens,  String? message)  $default,) {final _that = this;
switch (_that) {
case _GoogleLoginResponse():
return $default(_that.success,_that.user,_that.authTokens,_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  User user, @JsonKey(name: 'auth_tokens')  AuthTokens authTokens,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _GoogleLoginResponse() when $default != null:
return $default(_that.success,_that.user,_that.authTokens,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleLoginResponse implements GoogleLoginResponse {
  const _GoogleLoginResponse({required this.success, required this.user, @JsonKey(name: 'auth_tokens') required this.authTokens, this.message});
  factory _GoogleLoginResponse.fromJson(Map<String, dynamic> json) => _$GoogleLoginResponseFromJson(json);

@override final  bool success;
@override final  User user;
@override@JsonKey(name: 'auth_tokens') final  AuthTokens authTokens;
@override final  String? message;

/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleLoginResponseCopyWith<_GoogleLoginResponse> get copyWith => __$GoogleLoginResponseCopyWithImpl<_GoogleLoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleLoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleLoginResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.user, user) || other.user == user)&&(identical(other.authTokens, authTokens) || other.authTokens == authTokens)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,user,authTokens,message);

@override
String toString() {
  return 'GoogleLoginResponse(success: $success, user: $user, authTokens: $authTokens, message: $message)';
}


}

/// @nodoc
abstract mixin class _$GoogleLoginResponseCopyWith<$Res> implements $GoogleLoginResponseCopyWith<$Res> {
  factory _$GoogleLoginResponseCopyWith(_GoogleLoginResponse value, $Res Function(_GoogleLoginResponse) _then) = __$GoogleLoginResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, User user,@JsonKey(name: 'auth_tokens') AuthTokens authTokens, String? message
});


@override $UserCopyWith<$Res> get user;@override $AuthTokensCopyWith<$Res> get authTokens;

}
/// @nodoc
class __$GoogleLoginResponseCopyWithImpl<$Res>
    implements _$GoogleLoginResponseCopyWith<$Res> {
  __$GoogleLoginResponseCopyWithImpl(this._self, this._then);

  final _GoogleLoginResponse _self;
  final $Res Function(_GoogleLoginResponse) _then;

/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? user = null,Object? authTokens = null,Object? message = freezed,}) {
  return _then(_GoogleLoginResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,authTokens: null == authTokens ? _self.authTokens : authTokens // ignore: cast_nullable_to_non_nullable
as AuthTokens,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of GoogleLoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthTokensCopyWith<$Res> get authTokens {
  
  return $AuthTokensCopyWith<$Res>(_self.authTokens, (value) {
    return _then(_self.copyWith(authTokens: value));
  });
}
}

// dart format on
