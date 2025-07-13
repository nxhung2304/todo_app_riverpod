import 'package:flutter/material.dart';
import 'package:learn_riverpod/shared/widgets/navigation/shared_app_bar.dart';
import 'package:learn_riverpod/shared/widgets/navigation/shared_bottom_nav.dart';

class SharedScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final String currentRoute;
  final List<Widget>? appBarActions;
  final FloatingActionButton? floatingActionButton;
  final bool showBottomNav;
  final bool showAppBar;

  const SharedScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.currentRoute,
    this.appBarActions,
    this.floatingActionButton,
    this.showBottomNav = true,
    this.showAppBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? SharedAppBar(
        title: title,
        // actions: appBarActions,
      ) : null,
      bottomNavigationBar: showBottomNav ? SharedBottomNav(
        currentRoute: currentRoute,
      ) : null,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
