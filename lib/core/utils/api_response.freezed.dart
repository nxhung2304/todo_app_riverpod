// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiResponse<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponse<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ApiResponse<$T>()';
}


}

/// @nodoc
class $ApiResponseCopyWith<T,$Res>  {
$ApiResponseCopyWith(ApiResponse<T> _, $Res Function(ApiResponse<T>) __);
}


/// Adds pattern-matching-related methods to [ApiResponse].
extension ApiResponsePatterns<T> on ApiResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ApiSuccess<T> value)?  success,TResult Function( ApiError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that);case ApiError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ApiSuccess<T> value)  success,required TResult Function( ApiError<T> value)  error,}){
final _that = this;
switch (_that) {
case ApiSuccess():
return success(_that);case ApiError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ApiSuccess<T> value)?  success,TResult? Function( ApiError<T> value)?  error,}){
final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that);case ApiError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( T data)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that.data);case ApiError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( T data)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ApiSuccess():
return success(_that.data);case ApiError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( T data)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ApiSuccess() when success != null:
return success(_that.data);case ApiError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ApiSuccess<T> extends ApiResponse<T> {
  const ApiSuccess(this.data): super._();
  

 final  T data;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiSuccessCopyWith<T, ApiSuccess<T>> get copyWith => _$ApiSuccessCopyWithImpl<T, ApiSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ApiResponse<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ApiSuccessCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory $ApiSuccessCopyWith(ApiSuccess<T> value, $Res Function(ApiSuccess<T>) _then) = _$ApiSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$ApiSuccessCopyWithImpl<T,$Res>
    implements $ApiSuccessCopyWith<T, $Res> {
  _$ApiSuccessCopyWithImpl(this._self, this._then);

  final ApiSuccess<T> _self;
  final $Res Function(ApiSuccess<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ApiSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ApiError<T> extends ApiResponse<T> {
  const ApiError(this.message): super._();
  

 final  String message;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiErrorCopyWith<T, ApiError<T>> get copyWith => _$ApiErrorCopyWithImpl<T, ApiError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiError<T>&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ApiResponse<$T>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ApiErrorCopyWith<T,$Res> implements $ApiResponseCopyWith<T, $Res> {
  factory $ApiErrorCopyWith(ApiError<T> value, $Res Function(ApiError<T>) _then) = _$ApiErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ApiErrorCopyWithImpl<T,$Res>
    implements $ApiErrorCopyWith<T, $Res> {
  _$ApiErrorCopyWithImpl(this._self, this._then);

  final ApiError<T> _self;
  final $Res Function(ApiError<T>) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ApiError<T>(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
