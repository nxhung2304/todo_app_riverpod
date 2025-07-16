import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/strings/search_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class SearchPage extends LocalizedConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    return SharedScaffold(
      title: SearchStrings.title,
      currentRoute: AppRoutes.search,
      body: Center(child: Text(SearchStrings.title)),
    );
  }
}
