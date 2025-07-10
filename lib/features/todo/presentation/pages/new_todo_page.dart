import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/app/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/todo_list.dart';
import 'package:learn_riverpod/features/todo/presentation/validators/todo_validators.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/base_text_form_field.dart';

class NewTodoPage extends HookConsumerWidget {
  const NewTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoTitleController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Add New Todo", style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTodoTitle(todoTitleController),
              _buildSubmitTodo(context, todoTitleController, ref, formKey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTodoTitle(TextEditingController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Todo title"),
        BaseTextFormField(
          validator: TodoValidators.validateTitle,
          textFieldController: controller,
        ),
      ],
    );
  }

  Widget _buildSubmitTodo(
    BuildContext context,
    TextEditingController todoTitleController,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
  ) {
    return ElevatedButton(
      child: Text("Save"),
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
          final todoTitle = todoTitleController.text.trim();
          ref.read(todoListProvider.notifier).addTodo(title: todoTitle);
          context.go(AppRoutes.root);
        }
      },
    );
  }
}
