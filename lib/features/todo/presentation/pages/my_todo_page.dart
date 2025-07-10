import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_riverpod/app/router/app_routes.dart';

class MyTodoPage extends StatelessWidget {
  const MyTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Todo List", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          TextButton(
            child: Text("Add new"),
            onPressed: () {
              context.go(AppRoutes.newTodo);
            },
          ),
        ],
      ),
    );
  }
}
