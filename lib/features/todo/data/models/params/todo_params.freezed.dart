// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoParams {

 String get title; String? get description; String? get time; DateTime? get date; String? get dueDate;
/// Create a copy of TodoParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoParamsCopyWith<TodoParams> get copyWith => _$TodoParamsCopyWithImpl<TodoParams>(this as TodoParams, _$identity);

  /// Serializes this TodoParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoParams&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.time, time) || other.time == time)&&(identical(other.date, date) || other.date == date)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,time,date,dueDate);

@override
String toString() {
  return 'TodoParams(title: $title, description: $description, time: $time, date: $date, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class $TodoParamsCopyWith<$Res>  {
  factory $TodoParamsCopyWith(TodoParams value, $Res Function(TodoParams) _then) = _$TodoParamsCopyWithImpl;
@useResult
$Res call({
 String title, String? description, String? time, DateTime? date, String? dueDate
});




}
/// @nodoc
class _$TodoParamsCopyWithImpl<$Res>
    implements $TodoParamsCopyWith<$Res> {
  _$TodoParamsCopyWithImpl(this._self, this._then);

  final TodoParams _self;
  final $Res Function(TodoParams) _then;

/// Create a copy of TodoParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = freezed,Object? time = freezed,Object? date = freezed,Object? dueDate = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoParams].
extension TodoParamsPatterns on TodoParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoParams value)  $default,){
final _that = this;
switch (_that) {
case _TodoParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoParams value)?  $default,){
final _that = this;
switch (_that) {
case _TodoParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? description,  String? time,  DateTime? date,  String? dueDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoParams() when $default != null:
return $default(_that.title,_that.description,_that.time,_that.date,_that.dueDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? description,  String? time,  DateTime? date,  String? dueDate)  $default,) {final _that = this;
switch (_that) {
case _TodoParams():
return $default(_that.title,_that.description,_that.time,_that.date,_that.dueDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? description,  String? time,  DateTime? date,  String? dueDate)?  $default,) {final _that = this;
switch (_that) {
case _TodoParams() when $default != null:
return $default(_that.title,_that.description,_that.time,_that.date,_that.dueDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodoParams implements TodoParams {
  const _TodoParams({required this.title, this.description, this.time, this.date, this.dueDate});
  factory _TodoParams.fromJson(Map<String, dynamic> json) => _$TodoParamsFromJson(json);

@override final  String title;
@override final  String? description;
@override final  String? time;
@override final  DateTime? date;
@override final  String? dueDate;

/// Create a copy of TodoParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoParamsCopyWith<_TodoParams> get copyWith => __$TodoParamsCopyWithImpl<_TodoParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodoParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoParams&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.time, time) || other.time == time)&&(identical(other.date, date) || other.date == date)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,time,date,dueDate);

@override
String toString() {
  return 'TodoParams(title: $title, description: $description, time: $time, date: $date, dueDate: $dueDate)';
}


}

/// @nodoc
abstract mixin class _$TodoParamsCopyWith<$Res> implements $TodoParamsCopyWith<$Res> {
  factory _$TodoParamsCopyWith(_TodoParams value, $Res Function(_TodoParams) _then) = __$TodoParamsCopyWithImpl;
@override @useResult
$Res call({
 String title, String? description, String? time, DateTime? date, String? dueDate
});




}
/// @nodoc
class __$TodoParamsCopyWithImpl<$Res>
    implements _$TodoParamsCopyWith<$Res> {
  __$TodoParamsCopyWithImpl(this._self, this._then);

  final _TodoParams _self;
  final $Res Function(_TodoParams) _then;

/// Create a copy of TodoParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? time = freezed,Object? date = freezed,Object? dueDate = freezed,}) {
  return _then(_TodoParams(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
