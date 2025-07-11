import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bar_state.freezed.dart';

@freezed
sealed class AppBarState with _$AppBarState {
  const factory AppBarState({
    required String title,
    @Default(Colors.blue) Color backgroundColor,
    @Default(Colors.white) Color foregroundColor,
    @Default(false) bool showBackButton,
    VoidCallback? onBackPressed,
    List<Widget>? actions,
    @Default(true) bool showBottomNav,
    @Default(false) bool centerTitle,
    double? elevation,
  }) = _AppBarState;
}

