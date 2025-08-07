import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/core/extensions/string_extension.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/features/todo/presentation/controllers/todo_controller.dart';
import 'package:learn_riverpod/features/todo/presentation/controllers/todo_form_controller.dart';
import 'package:learn_riverpod/features/todo/presentation/validators/todo_validators.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/form/date_form_field.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/form/time_form_field.dart';
import 'package:learn_riverpod/features/todo/strings/edit_todo_strings.dart';
import 'package:learn_riverpod/features/todo/strings/todo_strings.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';
import 'package:learn_riverpod/shared/widgets/notifications/app_snackbar.dart';

class EditTodoForm extends HookConsumerWidget {
  final Todo todo;

  const EditTodoForm({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: todo.title);
    final descriptionController = useTextEditingController(
      text: todo.description,
    );
    final selectedDate = useState<DateTime?>(
      todo.dueDate != null ? DateTime.parse(todo.dueDate!) : null,
    );
    final selectedTime = useState<TimeOfDay?>(todo.time?.toTimeOfDay());
    final isSubmitting = useState(false);

    final formKey = useMemoized(() => GlobalKey<FormState>());

    Future<void> handleEditTodoSubmit(
      BuildContext context,
      WidgetRef ref,
      GlobalKey<FormState> formKey,
      ValueNotifier<bool> isSubmitting,
    ) async {
      if (!formKey.currentState!.validate()) {
        return;
      }
      isSubmitting.value = true;

      try {
        await ref
            .read(todoControllerProvider.notifier)
            .updateTodo(
              id: todo.id,
              title: titleController.text,
              description: descriptionController.text,
              date: selectedDate.value,
              time: selectedTime.value,
            );

        if (context.mounted) {
          AppSnackBar.showSuccess(context, EditTodoStrings.editedTodoSuccess);

          context.pop();
        }
      } catch (e) {
        if (context.mounted) {
          AppSnackBar.showError(
            context,
            "Failed to update todo: ${e.toString()}",
          );
        }
      } finally {
        isSubmitting.value = false;
      }
    }

    return SharedScaffold(
      title: EditTodoStrings.title,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TodoStrings.name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  InputFormField(
                    controller: titleController,
                    validator: TodoValidators.validateTitle,
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(TodoStrings.date, style: TextStyle(fontSize: 14)),
                        DateFormField(
                          initialDate: selectedDate.value,
                          validator: TodoValidators.validateDate,
                          onChanged: (newDate) => selectedDate.value = newDate,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TodoStrings.time,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TimeFormField(
                          initialTime: selectedTime.value,
                          validator: TodoValidators.validateTime,
                          onChanged: (time) => selectedTime.value = time,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TodoStrings.description,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  InputFormField(
                    controller: descriptionController,
                    validator: TodoValidators.validateNotes,
                    maxLines: 6,
                    textInputAction: TextInputAction.newline,
                  ),
                ],
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed:
                      isSubmitting.value
                          ? null
                          : () => handleEditTodoSubmit(
                            context,
                            ref,
                            formKey,
                            isSubmitting,
                          ),
                  child:
                      isSubmitting.value
                          ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(EditTodoStrings.editting),
                            ],
                          )
                          : Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
      currentRoute: AppRoutes.todo,
    );
  }
}
