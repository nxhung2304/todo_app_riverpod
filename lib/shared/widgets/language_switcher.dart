import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/config/localization/locale_provider.dart';

class LanguageSwitcher extends ConsumerWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            final newLocale = Locale('vi', 'VN');

            ref
                .read(localeNotifierProvider.notifier)
                .setLocale(locale: newLocale);

            EasyLocalization.of(context)?.setLocale(newLocale);
          },
          child: Text('VN'),
        ),
        ElevatedButton(
          onPressed: () {
            final newLocale = Locale('en', 'US');

            ref
                .read(localeNotifierProvider.notifier)
                .setLocale(locale: newLocale);

            EasyLocalization.of(context)?.setLocale(newLocale);
          },
          child: Text('EN'),
        ),
      ],
    );
  }
}
