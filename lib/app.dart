import 'package:flutter/material.dart';
import 'package:learn_riverpod/app/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Todos',
    //   theme: ThemeData(
    //     primaryColor: Colors.red
    //   ),
    //   home: const MyTodoPage(),
    // );
    return MaterialApp.router(routerConfig: router);
  }
}
