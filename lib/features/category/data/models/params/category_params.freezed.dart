// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryParams {

 int? get id; String get name; String? get color; String? get icon;
/// Create a copy of CategoryParams
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryParamsCopyWith<CategoryParams> get copyWith => _$CategoryParamsCopyWithImpl<CategoryParams>(this as CategoryParams, _$identity);

  /// Serializes this CategoryParams to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryParams&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,icon);

@override
String toString() {
  return 'CategoryParams(id: $id, name: $name, color: $color, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $CategoryParamsCopyWith<$Res>  {
  factory $CategoryParamsCopyWith(CategoryParams value, $Res Function(CategoryParams) _then) = _$CategoryParamsCopyWithImpl;
@useResult
$Res call({
 int? id, String name, String? color, String? icon
});




}
/// @nodoc
class _$CategoryParamsCopyWithImpl<$Res>
    implements $CategoryParamsCopyWith<$Res> {
  _$CategoryParamsCopyWithImpl(this._self, this._then);

  final CategoryParams _self;
  final $Res Function(CategoryParams) _then;

/// Create a copy of CategoryParams
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? color = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryParams].
extension CategoryParamsPatterns on CategoryParams {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryParams value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryParams() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryParams value)  $default,){
final _that = this;
switch (_that) {
case _CategoryParams():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryParams value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryParams() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String name,  String? color,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryParams() when $default != null:
return $default(_that.id,_that.name,_that.color,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String name,  String? color,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _CategoryParams():
return $default(_that.id,_that.name,_that.color,_that.icon);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String name,  String? color,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _CategoryParams() when $default != null:
return $default(_that.id,_that.name,_that.color,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryParams implements CategoryParams {
  const _CategoryParams({this.id, required this.name, this.color, this.icon});
  factory _CategoryParams.fromJson(Map<String, dynamic> json) => _$CategoryParamsFromJson(json);

@override final  int? id;
@override final  String name;
@override final  String? color;
@override final  String? icon;

/// Create a copy of CategoryParams
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryParamsCopyWith<_CategoryParams> get copyWith => __$CategoryParamsCopyWithImpl<_CategoryParams>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryParamsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryParams&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.color, color) || other.color == color)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,color,icon);

@override
String toString() {
  return 'CategoryParams(id: $id, name: $name, color: $color, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$CategoryParamsCopyWith<$Res> implements $CategoryParamsCopyWith<$Res> {
  factory _$CategoryParamsCopyWith(_CategoryParams value, $Res Function(_CategoryParams) _then) = __$CategoryParamsCopyWithImpl;
@override @useResult
$Res call({
 int? id, String name, String? color, String? icon
});




}
/// @nodoc
class __$CategoryParamsCopyWithImpl<$Res>
    implements _$CategoryParamsCopyWith<$Res> {
  __$CategoryParamsCopyWithImpl(this._self, this._then);

  final _CategoryParams _self;
  final $Res Function(_CategoryParams) _then;

/// Create a copy of CategoryParams
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? color = freezed,Object? icon = freezed,}) {
  return _then(_CategoryParams(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
