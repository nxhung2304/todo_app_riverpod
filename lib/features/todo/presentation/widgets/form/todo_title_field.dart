import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/todo_form_provider.dart';
import 'package:learn_riverpod/features/todo/presentation/validators/todo_validators.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';

class TodoTitleField extends ConsumerWidget {
  const TodoTitleField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTitle = ref.watch(todoFormProvider.select((s) => s.title));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        InputFormField(
          validator: TodoValidators.validateTitle,
          initialValue: currentTitle,
          onChanged: ref.read(todoFormProvider.notifier).updateTitle,
        ),
      ],
    );
  }
}
