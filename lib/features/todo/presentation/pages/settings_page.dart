import 'package:flutter/material.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';
import 'package:learn_riverpod/shared/presentation/widgets/shared_app_bar.dart';
import 'package:learn_riverpod/shared/presentation/widgets/shared_bottom_nav.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(title: 'Settings Page'),
      body: Center(child: Text('Search')),
      bottomNavigationBar: SharedBottomNav(currentRoute: AppRoutes.settings),
    );
  }
}
