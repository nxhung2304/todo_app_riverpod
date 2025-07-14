import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/todo/constants/settings_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class SettingsPage extends LocalizedConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    return SharedScaffold(
      // title: context.tr("settings.title"),
      title: SettingsStrings.title,
      currentRoute: '/settings',
      // body: Center(child: Text(context.tr("search.title"))),
      body: Center(child: Text(SettingsStrings.title)),
    );
  }
}
