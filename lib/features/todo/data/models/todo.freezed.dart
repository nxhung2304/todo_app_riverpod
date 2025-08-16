// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Todo {

 int get id; String get title;@JsonKey(name: 'category_id') int get categoryId; String? get description; bool get done; int? get priority;@JsonKey(name: 'priority_label') String? get priorityLabel;@JsonKey(name: 'due_date') String? get dueDate; String? get color; String? get reminder;@JsonKey(name: 'is_overdue') bool get isOverdue;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(includeFromJson: false, includeToJson: false) DateTime? get date;@JsonKey(includeFromJson: false, includeToJson: false) String? get time;
/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoCopyWith<Todo> get copyWith => _$TodoCopyWithImpl<Todo>(this as Todo, _$identity);

  /// Serializes this Todo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Todo&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.description, description) || other.description == description)&&(identical(other.done, done) || other.done == done)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.priorityLabel, priorityLabel) || other.priorityLabel == priorityLabel)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.reminder, reminder) || other.reminder == reminder)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,categoryId,description,done,priority,priorityLabel,dueDate,color,reminder,isOverdue,createdAt,updatedAt,date,time);

@override
String toString() {
  return 'Todo(id: $id, title: $title, categoryId: $categoryId, description: $description, done: $done, priority: $priority, priorityLabel: $priorityLabel, dueDate: $dueDate, color: $color, reminder: $reminder, isOverdue: $isOverdue, createdAt: $createdAt, updatedAt: $updatedAt, date: $date, time: $time)';
}


}

/// @nodoc
abstract mixin class $TodoCopyWith<$Res>  {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) _then) = _$TodoCopyWithImpl;
@useResult
$Res call({
 int id, String title,@JsonKey(name: 'category_id') int categoryId, String? description, bool done, int? priority,@JsonKey(name: 'priority_label') String? priorityLabel,@JsonKey(name: 'due_date') String? dueDate, String? color, String? reminder,@JsonKey(name: 'is_overdue') bool isOverdue,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(includeFromJson: false, includeToJson: false) DateTime? date,@JsonKey(includeFromJson: false, includeToJson: false) String? time
});




}
/// @nodoc
class _$TodoCopyWithImpl<$Res>
    implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._self, this._then);

  final Todo _self;
  final $Res Function(Todo) _then;

/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? categoryId = null,Object? description = freezed,Object? done = null,Object? priority = freezed,Object? priorityLabel = freezed,Object? dueDate = freezed,Object? color = freezed,Object? reminder = freezed,Object? isOverdue = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? date = freezed,Object? time = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int?,priorityLabel: freezed == priorityLabel ? _self.priorityLabel : priorityLabel // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,reminder: freezed == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as String?,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Todo].
extension TodoPatterns on Todo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Todo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Todo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Todo value)  $default,){
final _that = this;
switch (_that) {
case _Todo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Todo value)?  $default,){
final _that = this;
switch (_that) {
case _Todo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'category_id')  int categoryId,  String? description,  bool done,  int? priority, @JsonKey(name: 'priority_label')  String? priorityLabel, @JsonKey(name: 'due_date')  String? dueDate,  String? color,  String? reminder, @JsonKey(name: 'is_overdue')  bool isOverdue, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? date, @JsonKey(includeFromJson: false, includeToJson: false)  String? time)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Todo() when $default != null:
return $default(_that.id,_that.title,_that.categoryId,_that.description,_that.done,_that.priority,_that.priorityLabel,_that.dueDate,_that.color,_that.reminder,_that.isOverdue,_that.createdAt,_that.updatedAt,_that.date,_that.time);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title, @JsonKey(name: 'category_id')  int categoryId,  String? description,  bool done,  int? priority, @JsonKey(name: 'priority_label')  String? priorityLabel, @JsonKey(name: 'due_date')  String? dueDate,  String? color,  String? reminder, @JsonKey(name: 'is_overdue')  bool isOverdue, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? date, @JsonKey(includeFromJson: false, includeToJson: false)  String? time)  $default,) {final _that = this;
switch (_that) {
case _Todo():
return $default(_that.id,_that.title,_that.categoryId,_that.description,_that.done,_that.priority,_that.priorityLabel,_that.dueDate,_that.color,_that.reminder,_that.isOverdue,_that.createdAt,_that.updatedAt,_that.date,_that.time);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title, @JsonKey(name: 'category_id')  int categoryId,  String? description,  bool done,  int? priority, @JsonKey(name: 'priority_label')  String? priorityLabel, @JsonKey(name: 'due_date')  String? dueDate,  String? color,  String? reminder, @JsonKey(name: 'is_overdue')  bool isOverdue, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(includeFromJson: false, includeToJson: false)  DateTime? date, @JsonKey(includeFromJson: false, includeToJson: false)  String? time)?  $default,) {final _that = this;
switch (_that) {
case _Todo() when $default != null:
return $default(_that.id,_that.title,_that.categoryId,_that.description,_that.done,_that.priority,_that.priorityLabel,_that.dueDate,_that.color,_that.reminder,_that.isOverdue,_that.createdAt,_that.updatedAt,_that.date,_that.time);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Todo implements Todo {
   _Todo({this.id = 0, required this.title, @JsonKey(name: 'category_id') required this.categoryId, this.description, this.done = false, this.priority, @JsonKey(name: 'priority_label') this.priorityLabel, @JsonKey(name: 'due_date') this.dueDate, this.color, this.reminder, @JsonKey(name: 'is_overdue') this.isOverdue = false, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(includeFromJson: false, includeToJson: false) this.date, @JsonKey(includeFromJson: false, includeToJson: false) this.time});
  factory _Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

@override@JsonKey() final  int id;
@override final  String title;
@override@JsonKey(name: 'category_id') final  int categoryId;
@override final  String? description;
@override@JsonKey() final  bool done;
@override final  int? priority;
@override@JsonKey(name: 'priority_label') final  String? priorityLabel;
@override@JsonKey(name: 'due_date') final  String? dueDate;
@override final  String? color;
@override final  String? reminder;
@override@JsonKey(name: 'is_overdue') final  bool isOverdue;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  DateTime? date;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? time;

/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoCopyWith<_Todo> get copyWith => __$TodoCopyWithImpl<_Todo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Todo&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.description, description) || other.description == description)&&(identical(other.done, done) || other.done == done)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.priorityLabel, priorityLabel) || other.priorityLabel == priorityLabel)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.color, color) || other.color == color)&&(identical(other.reminder, reminder) || other.reminder == reminder)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,categoryId,description,done,priority,priorityLabel,dueDate,color,reminder,isOverdue,createdAt,updatedAt,date,time);

@override
String toString() {
  return 'Todo(id: $id, title: $title, categoryId: $categoryId, description: $description, done: $done, priority: $priority, priorityLabel: $priorityLabel, dueDate: $dueDate, color: $color, reminder: $reminder, isOverdue: $isOverdue, createdAt: $createdAt, updatedAt: $updatedAt, date: $date, time: $time)';
}


}

/// @nodoc
abstract mixin class _$TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$TodoCopyWith(_Todo value, $Res Function(_Todo) _then) = __$TodoCopyWithImpl;
@override @useResult
$Res call({
 int id, String title,@JsonKey(name: 'category_id') int categoryId, String? description, bool done, int? priority,@JsonKey(name: 'priority_label') String? priorityLabel,@JsonKey(name: 'due_date') String? dueDate, String? color, String? reminder,@JsonKey(name: 'is_overdue') bool isOverdue,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(includeFromJson: false, includeToJson: false) DateTime? date,@JsonKey(includeFromJson: false, includeToJson: false) String? time
});




}
/// @nodoc
class __$TodoCopyWithImpl<$Res>
    implements _$TodoCopyWith<$Res> {
  __$TodoCopyWithImpl(this._self, this._then);

  final _Todo _self;
  final $Res Function(_Todo) _then;

/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? categoryId = null,Object? description = freezed,Object? done = null,Object? priority = freezed,Object? priorityLabel = freezed,Object? dueDate = freezed,Object? color = freezed,Object? reminder = freezed,Object? isOverdue = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? date = freezed,Object? time = freezed,}) {
  return _then(_Todo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as bool,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int?,priorityLabel: freezed == priorityLabel ? _self.priorityLabel : priorityLabel // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,reminder: freezed == reminder ? _self.reminder : reminder // ignore: cast_nullable_to_non_nullable
as String?,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
