import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SharedAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final List<Widget>? actions;
  final bool centerTitle;

  const SharedAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
    this.actions,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(title),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? Colors.blue,
      foregroundColor: foregroundColor,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
