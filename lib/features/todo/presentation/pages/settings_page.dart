import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/config/localization/app_locale.dart';
import 'package:learn_riverpod/config/localization/app_locale_provider.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/settings/language_bottom_sheet.dart';
import 'package:learn_riverpod/features/todo/strings/settings_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class SettingsPage extends LocalizedConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    final currentAppLocale = ref.watch(appLocaleNotifierProvider);

    return SharedScaffold(
      title: SettingsStrings.title,
      currentRoute: AppRoutes.settings,
      body: ListView(
        children: [_buildSelectLanguage(context, ref, currentAppLocale)],
      ),
    );
  }

  Widget _buildSelectLanguage(
    BuildContext context,
    WidgetRef ref,
    AppLocale currentAppLocale,
  ) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.language),
        title: Text(SettingsStrings.changeLanguage),
        subtitle: Text(currentAppLocale.nativeName),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap:
            () => {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => LanguageBottomSheet(),
              ),
            },
      ),
    );
  }
}
