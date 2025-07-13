import 'package:flutter/material.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedScaffold(
      title: "Search",
      currentRoute: '/search',
      body: Center(child: Text('Search')),
    );
  }
}
