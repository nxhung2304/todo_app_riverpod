import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/todo/strings/home_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class HomePage extends LocalizedConsumerWidget {
  const HomePage({super.key});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    return SharedScaffold(
      title: HomeStrings.title,
      body: Text(HomeStrings.title),
      currentRoute: '/home',
    );
  }
}
