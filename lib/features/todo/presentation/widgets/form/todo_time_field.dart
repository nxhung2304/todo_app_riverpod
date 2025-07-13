import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/todo_form_provider.dart';
import 'package:learn_riverpod/features/todo/presentation/validators/todo_validators.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/form/time_form_field.dart';

class TodoTimeField extends ConsumerWidget {
  const TodoTimeField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Thời gian",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        TimeFormField(
          labelText: "",
          validator: TodoValidators.validateTime,
          onChanged:
              (time) => ref.read(todoFormProvider.notifier).updateTime(time),
        ),
      ],
    );
  }
}
