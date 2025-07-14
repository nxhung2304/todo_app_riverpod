import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/config/localization/locale_provider.dart';
import 'package:learn_riverpod/shared/widgets/language_switcher.dart';

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
    // ref.watch(localeNotifierProvider);

    return AppBar(
      title: Center(child: Text(title)),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      actions: [LanguageSwitcher(key: key)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
