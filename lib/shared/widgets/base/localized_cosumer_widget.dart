import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/localization/app_locale_provider.dart';

abstract class LocalizedConsumerWidget extends HookConsumerWidget {
  const LocalizedConsumerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appLocaleNotifierProvider);

    return buildLocalized(context, ref);
  }

  Widget buildLocalized(BuildContext context, WidgetRef ref);
}
