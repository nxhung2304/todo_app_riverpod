import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SharedAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const SharedAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Center(child: Text(title)),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
