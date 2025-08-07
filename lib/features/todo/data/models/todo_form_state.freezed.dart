// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoFormState {

 int get id; String get title; String get description; DateTime? get selectedDate; TimeOfDay? get selectedTime; bool get isLoading; String? get errorMessage;
/// Create a copy of TodoFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoFormStateCopyWith<TodoFormState> get copyWith => _$TodoFormStateCopyWithImpl<TodoFormState>(this as TodoFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoFormState&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedTime, selectedTime) || other.selectedTime == selectedTime)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,selectedDate,selectedTime,isLoading,errorMessage);

@override
String toString() {
  return 'TodoFormState(id: $id, title: $title, description: $description, selectedDate: $selectedDate, selectedTime: $selectedTime, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $TodoFormStateCopyWith<$Res>  {
  factory $TodoFormStateCopyWith(TodoFormState value, $Res Function(TodoFormState) _then) = _$TodoFormStateCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, DateTime? selectedDate, TimeOfDay? selectedTime, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$TodoFormStateCopyWithImpl<$Res>
    implements $TodoFormStateCopyWith<$Res> {
  _$TodoFormStateCopyWithImpl(this._self, this._then);

  final TodoFormState _self;
  final $Res Function(TodoFormState) _then;

/// Create a copy of TodoFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? selectedDate = freezed,Object? selectedTime = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTime: freezed == selectedTime ? _self.selectedTime : selectedTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoFormState].
extension TodoFormStatePatterns on TodoFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoFormState value)  $default,){
final _that = this;
switch (_that) {
case _TodoFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoFormState value)?  $default,){
final _that = this;
switch (_that) {
case _TodoFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description,  DateTime? selectedDate,  TimeOfDay? selectedTime,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoFormState() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.selectedDate,_that.selectedTime,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description,  DateTime? selectedDate,  TimeOfDay? selectedTime,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _TodoFormState():
return $default(_that.id,_that.title,_that.description,_that.selectedDate,_that.selectedTime,_that.isLoading,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description,  DateTime? selectedDate,  TimeOfDay? selectedTime,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _TodoFormState() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.selectedDate,_that.selectedTime,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _TodoFormState implements TodoFormState {
  const _TodoFormState({this.id = 0, this.title = '', this.description = '', this.selectedDate, this.selectedTime, this.isLoading = false, this.errorMessage});
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String title;
@override@JsonKey() final  String description;
@override final  DateTime? selectedDate;
@override final  TimeOfDay? selectedTime;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of TodoFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoFormStateCopyWith<_TodoFormState> get copyWith => __$TodoFormStateCopyWithImpl<_TodoFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoFormState&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.selectedDate, selectedDate) || other.selectedDate == selectedDate)&&(identical(other.selectedTime, selectedTime) || other.selectedTime == selectedTime)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,selectedDate,selectedTime,isLoading,errorMessage);

@override
String toString() {
  return 'TodoFormState(id: $id, title: $title, description: $description, selectedDate: $selectedDate, selectedTime: $selectedTime, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$TodoFormStateCopyWith<$Res> implements $TodoFormStateCopyWith<$Res> {
  factory _$TodoFormStateCopyWith(_TodoFormState value, $Res Function(_TodoFormState) _then) = __$TodoFormStateCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, DateTime? selectedDate, TimeOfDay? selectedTime, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$TodoFormStateCopyWithImpl<$Res>
    implements _$TodoFormStateCopyWith<$Res> {
  __$TodoFormStateCopyWithImpl(this._self, this._then);

  final _TodoFormState _self;
  final $Res Function(_TodoFormState) _then;

/// Create a copy of TodoFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? selectedDate = freezed,Object? selectedTime = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_TodoFormState(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,selectedDate: freezed == selectedDate ? _self.selectedDate : selectedDate // ignore: cast_nullable_to_non_nullable
as DateTime?,selectedTime: freezed == selectedTime ? _self.selectedTime : selectedTime // ignore: cast_nullable_to_non_nullable
as TimeOfDay?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
