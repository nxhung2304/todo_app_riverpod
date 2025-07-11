// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bar_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppBarState {

 String get title; Color get backgroundColor; Color get foregroundColor; bool get showBackButton; VoidCallback? get onBackPressed; List<Widget>? get actions; bool get showBottomNav; bool get centerTitle; double? get elevation;
/// Create a copy of AppBarState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppBarStateCopyWith<AppBarState> get copyWith => _$AppBarStateCopyWithImpl<AppBarState>(this as AppBarState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppBarState&&(identical(other.title, title) || other.title == title)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.foregroundColor, foregroundColor) || other.foregroundColor == foregroundColor)&&(identical(other.showBackButton, showBackButton) || other.showBackButton == showBackButton)&&(identical(other.onBackPressed, onBackPressed) || other.onBackPressed == onBackPressed)&&const DeepCollectionEquality().equals(other.actions, actions)&&(identical(other.showBottomNav, showBottomNav) || other.showBottomNav == showBottomNav)&&(identical(other.centerTitle, centerTitle) || other.centerTitle == centerTitle)&&(identical(other.elevation, elevation) || other.elevation == elevation));
}


@override
int get hashCode => Object.hash(runtimeType,title,backgroundColor,foregroundColor,showBackButton,onBackPressed,const DeepCollectionEquality().hash(actions),showBottomNav,centerTitle,elevation);

@override
String toString() {
  return 'AppBarState(title: $title, backgroundColor: $backgroundColor, foregroundColor: $foregroundColor, showBackButton: $showBackButton, onBackPressed: $onBackPressed, actions: $actions, showBottomNav: $showBottomNav, centerTitle: $centerTitle, elevation: $elevation)';
}


}

/// @nodoc
abstract mixin class $AppBarStateCopyWith<$Res>  {
  factory $AppBarStateCopyWith(AppBarState value, $Res Function(AppBarState) _then) = _$AppBarStateCopyWithImpl;
@useResult
$Res call({
 String title, Color backgroundColor, Color foregroundColor, bool showBackButton, VoidCallback? onBackPressed, List<Widget>? actions, bool showBottomNav, bool centerTitle, double? elevation
});




}
/// @nodoc
class _$AppBarStateCopyWithImpl<$Res>
    implements $AppBarStateCopyWith<$Res> {
  _$AppBarStateCopyWithImpl(this._self, this._then);

  final AppBarState _self;
  final $Res Function(AppBarState) _then;

/// Create a copy of AppBarState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? backgroundColor = null,Object? foregroundColor = null,Object? showBackButton = null,Object? onBackPressed = freezed,Object? actions = freezed,Object? showBottomNav = null,Object? centerTitle = null,Object? elevation = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,foregroundColor: null == foregroundColor ? _self.foregroundColor : foregroundColor // ignore: cast_nullable_to_non_nullable
as Color,showBackButton: null == showBackButton ? _self.showBackButton : showBackButton // ignore: cast_nullable_to_non_nullable
as bool,onBackPressed: freezed == onBackPressed ? _self.onBackPressed : onBackPressed // ignore: cast_nullable_to_non_nullable
as VoidCallback?,actions: freezed == actions ? _self.actions : actions // ignore: cast_nullable_to_non_nullable
as List<Widget>?,showBottomNav: null == showBottomNav ? _self.showBottomNav : showBottomNav // ignore: cast_nullable_to_non_nullable
as bool,centerTitle: null == centerTitle ? _self.centerTitle : centerTitle // ignore: cast_nullable_to_non_nullable
as bool,elevation: freezed == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppBarState].
extension AppBarStatePatterns on AppBarState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppBarState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppBarState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppBarState value)  $default,){
final _that = this;
switch (_that) {
case _AppBarState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppBarState value)?  $default,){
final _that = this;
switch (_that) {
case _AppBarState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  Color backgroundColor,  Color foregroundColor,  bool showBackButton,  VoidCallback? onBackPressed,  List<Widget>? actions,  bool showBottomNav,  bool centerTitle,  double? elevation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppBarState() when $default != null:
return $default(_that.title,_that.backgroundColor,_that.foregroundColor,_that.showBackButton,_that.onBackPressed,_that.actions,_that.showBottomNav,_that.centerTitle,_that.elevation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  Color backgroundColor,  Color foregroundColor,  bool showBackButton,  VoidCallback? onBackPressed,  List<Widget>? actions,  bool showBottomNav,  bool centerTitle,  double? elevation)  $default,) {final _that = this;
switch (_that) {
case _AppBarState():
return $default(_that.title,_that.backgroundColor,_that.foregroundColor,_that.showBackButton,_that.onBackPressed,_that.actions,_that.showBottomNav,_that.centerTitle,_that.elevation);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  Color backgroundColor,  Color foregroundColor,  bool showBackButton,  VoidCallback? onBackPressed,  List<Widget>? actions,  bool showBottomNav,  bool centerTitle,  double? elevation)?  $default,) {final _that = this;
switch (_that) {
case _AppBarState() when $default != null:
return $default(_that.title,_that.backgroundColor,_that.foregroundColor,_that.showBackButton,_that.onBackPressed,_that.actions,_that.showBottomNav,_that.centerTitle,_that.elevation);case _:
  return null;

}
}

}

/// @nodoc


class _AppBarState implements AppBarState {
  const _AppBarState({required this.title, this.backgroundColor = Colors.blue, this.foregroundColor = Colors.white, this.showBackButton = false, this.onBackPressed, final  List<Widget>? actions, this.showBottomNav = true, this.centerTitle = false, this.elevation}): _actions = actions;
  

@override final  String title;
@override@JsonKey() final  Color backgroundColor;
@override@JsonKey() final  Color foregroundColor;
@override@JsonKey() final  bool showBackButton;
@override final  VoidCallback? onBackPressed;
 final  List<Widget>? _actions;
@override List<Widget>? get actions {
  final value = _actions;
  if (value == null) return null;
  if (_actions is EqualUnmodifiableListView) return _actions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey() final  bool showBottomNav;
@override@JsonKey() final  bool centerTitle;
@override final  double? elevation;

/// Create a copy of AppBarState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppBarStateCopyWith<_AppBarState> get copyWith => __$AppBarStateCopyWithImpl<_AppBarState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppBarState&&(identical(other.title, title) || other.title == title)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.foregroundColor, foregroundColor) || other.foregroundColor == foregroundColor)&&(identical(other.showBackButton, showBackButton) || other.showBackButton == showBackButton)&&(identical(other.onBackPressed, onBackPressed) || other.onBackPressed == onBackPressed)&&const DeepCollectionEquality().equals(other._actions, _actions)&&(identical(other.showBottomNav, showBottomNav) || other.showBottomNav == showBottomNav)&&(identical(other.centerTitle, centerTitle) || other.centerTitle == centerTitle)&&(identical(other.elevation, elevation) || other.elevation == elevation));
}


@override
int get hashCode => Object.hash(runtimeType,title,backgroundColor,foregroundColor,showBackButton,onBackPressed,const DeepCollectionEquality().hash(_actions),showBottomNav,centerTitle,elevation);

@override
String toString() {
  return 'AppBarState(title: $title, backgroundColor: $backgroundColor, foregroundColor: $foregroundColor, showBackButton: $showBackButton, onBackPressed: $onBackPressed, actions: $actions, showBottomNav: $showBottomNav, centerTitle: $centerTitle, elevation: $elevation)';
}


}

/// @nodoc
abstract mixin class _$AppBarStateCopyWith<$Res> implements $AppBarStateCopyWith<$Res> {
  factory _$AppBarStateCopyWith(_AppBarState value, $Res Function(_AppBarState) _then) = __$AppBarStateCopyWithImpl;
@override @useResult
$Res call({
 String title, Color backgroundColor, Color foregroundColor, bool showBackButton, VoidCallback? onBackPressed, List<Widget>? actions, bool showBottomNav, bool centerTitle, double? elevation
});




}
/// @nodoc
class __$AppBarStateCopyWithImpl<$Res>
    implements _$AppBarStateCopyWith<$Res> {
  __$AppBarStateCopyWithImpl(this._self, this._then);

  final _AppBarState _self;
  final $Res Function(_AppBarState) _then;

/// Create a copy of AppBarState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? backgroundColor = null,Object? foregroundColor = null,Object? showBackButton = null,Object? onBackPressed = freezed,Object? actions = freezed,Object? showBottomNav = null,Object? centerTitle = null,Object? elevation = freezed,}) {
  return _then(_AppBarState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,foregroundColor: null == foregroundColor ? _self.foregroundColor : foregroundColor // ignore: cast_nullable_to_non_nullable
as Color,showBackButton: null == showBackButton ? _self.showBackButton : showBackButton // ignore: cast_nullable_to_non_nullable
as bool,onBackPressed: freezed == onBackPressed ? _self.onBackPressed : onBackPressed // ignore: cast_nullable_to_non_nullable
as VoidCallback?,actions: freezed == actions ? _self._actions : actions // ignore: cast_nullable_to_non_nullable
as List<Widget>?,showBottomNav: null == showBottomNav ? _self.showBottomNav : showBottomNav // ignore: cast_nullable_to_non_nullable
as bool,centerTitle: null == centerTitle ? _self.centerTitle : centerTitle // ignore: cast_nullable_to_non_nullable
as bool,elevation: freezed == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
