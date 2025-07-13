import 'package:flutter/material.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedScaffold(
      title: "Settings",
      currentRoute: '/settings',
      body: Center(child: Text('Search')),
    );
  }
}
