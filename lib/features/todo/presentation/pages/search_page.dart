import 'package:flutter/material.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/shared_app_bar.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/shared_bottom_nav.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(title: 'Search Page'),
      body: Center(child: Text('Search')),
      bottomNavigationBar: SharedBottomNav(currentRoute: AppRoutes.search),
    );
  }
}
