import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/todo/constants/search_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class SearchPage extends LocalizedConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    print('🔄 SearchPage rebuild called');

    return SharedScaffold(
      // title: context.tr("search.title"),
      title: SearchStrings.title,
      currentRoute: '/search',
      // body: Center(child: Text(context.tr("search.title"))),
      body: Center(child: Text(SearchStrings.title)),
    );
  }
}
