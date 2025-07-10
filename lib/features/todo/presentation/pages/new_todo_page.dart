import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/base_text_field.dart';

class NewTodoPage extends HookConsumerWidget {
  NewTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoTitleController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Todo", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          _buildTodoTitle(todoTitleController),
          _buildSubmitTodo(todoTitleController, ref),
        ],
      ),
    );
  }

  Widget _buildTodoTitle(TextEditingController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Todo title"),
        BaseTextField(textFieldController: controller),
      ],
    );
  }

  Widget _buildSubmitTodo(
    TextEditingController todoTitleController,
    WidgetRef ref,
  ) {
    return ElevatedButton(onPressed: () {}, child: Text("Add todo"));
  }
}
