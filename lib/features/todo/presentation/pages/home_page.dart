import 'package:flutter/material.dart';
import 'package:learn_riverpod/config/router/app_routes.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/shared_app_bar.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/shared_bottom_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(title: 'Home'),
      body: Center(child: Text('Home Content 1')),
      bottomNavigationBar: SharedBottomNav(currentRoute: AppRoutes.home),
    );
  }
}
