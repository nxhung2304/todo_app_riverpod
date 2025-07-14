import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:learn_riverpod/config/localization/app_locale.dart';
import 'package:learn_riverpod/config/localization/app_locale_provider.dart';
import 'package:learn_riverpod/features/todo/strings/settings_strings.dart';

class LanguageBottomSheet extends ConsumerWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentAppLocale = ref.watch(appLocaleNotifierProvider);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            SettingsStrings.changeLanguage,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 20),

          for (final appLocale in AppLocale.values)
            _buildLanguageOption(
              context,
              ref,
              appLocale: appLocale,
              isSelected: currentAppLocale == appLocale,
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    WidgetRef ref, {
    required AppLocale appLocale,
    required bool isSelected,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor:
            isSelected ? Theme.of(context).primaryColor : Colors.grey[300],
        child: Text(appLocale.flag, style: const TextStyle(fontSize: 20)),
      ),
      title: Text(appLocale.nativeName),
      subtitle: Text(appLocale.englishName),
      trailing:
          isSelected
              ? Icon(Icons.check, color: Theme.of(context).primaryColor)
              : null,
      onTap: () async {
        ref
            .read(appLocaleNotifierProvider.notifier)
            .setLocale(appLocale: appLocale);
        await context.setLocale(appLocale.locale);
        if (context.mounted) {
          Navigator.pop(context);
        }
      },
    );
  }
}
