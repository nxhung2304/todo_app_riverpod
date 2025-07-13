import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/todo/constants/home_strings.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedScaffold(
      title: "Home",
      body: Text(HomeStrings.title),
      currentRoute: '/home',
    );
  }
}
