import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/todo_provider.dart';
import 'package:learn_riverpod/features/todo/strings/edit_todo_strings.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/todo_form_provider.dart';
import 'package:learn_riverpod/features/todo/presentation/services/new_todo_form_service.dart';
import 'package:learn_riverpod/features/todo/presentation/validators/todo_validators.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/form/date_form_field.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/form/time_form_field.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';
import 'package:learn_riverpod/shared/widgets/navigation/shared_app_bar.dart';

class EditTodoPage extends LocalizedConsumerWidget {
  final int todoId;

  const EditTodoPage({super.key, required this.todoId});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    final todoNotifierAsync = ref.watch(todoNotifierProvider);
    return todoNotifierAsync.when(
      loading:
          () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
      error:
          (error, stackTree) => Scaffold(
            appBar: const SharedAppBar(title: 'Error'),
            body: Center(child: Text('Error: $error')),
          ),
      data: (todos) {
        final todo = todos.firstWhere(
          (todo) => todo.id == todoId,
          orElse: () => throw Exception(EditTodoStrings.todoNotFound),
        );

        return _buildEditForm(context, ref, todo);
      },
    );
  }

  Widget _buildDateField(WidgetRef ref, DateTime? selectedDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date", style: TextStyle(fontSize: 14)),
        DateFormField(
          initialDate: selectedDate,
          labelText: "",
          validator: TodoValidators.validateDate,
          onChanged: ref.read(todoFormProvider.notifier).updateDate,
        ),
      ],
    );
  }

  Widget _buildEditForm(BuildContext context, WidgetRef ref, Todo todo) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final formService = useMemoized(() => TodoFormService(ref, formKey));

    final formState = ref.watch(todoFormProvider);
    final submitState = ref.watch(todoNotifierProvider);

    useEffect(() {
      Future.microtask(() {
        ref.read(todoFormProvider.notifier).loadTodo(todo);
      });
      return null;
    }, [todo.id]);
    ref.listen(todoNotifierProvider, (prev, next) {
      next.when(
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Todo đã được tạo thành công!"),
              backgroundColor: Colors.green,
            ),
          );
          context.pop();
        },
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Lỗi: ${error.toString()}"),
              backgroundColor: Colors.red,
            ),
          );
        },
        loading: () {
          CircularProgressIndicator();
        },
      );
    });

    return SharedScaffold(
      title: EditTodoStrings.title,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildTodoTitle(ref, formState.title),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildDateField(ref, formState.selectedDate)),
                  SizedBox(width: 16),
                  Expanded(child: _buildTimeField(ref, formState.selectedTime)),
                ],
              ),
              SizedBox(height: 16),
              _buildNotesField(ref, formState.notes),
              SizedBox(height: 24),
              _buildSubmitButton(context, ref, formService, submitState),
            ],
          ),
        ),
      ),
      currentRoute: AppRoutes.todo,
    );
  }

  Widget _buildNotesField(WidgetRef ref, String currentNotes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Notes",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        InputFormField(
          initialValue: currentNotes,
          validator: TodoValidators.validateNotes,
          maxLines: 6,
          onChanged: ref.read(todoFormProvider.notifier).updateNotes,
        ),
      ],
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    WidgetRef ref,
    TodoFormService formService,
    AsyncValue<void> submitState,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          formService.submitForm();
          final formKey = useMemoized(() => GlobalKey<FormState>());
          if (!formKey.currentState!.validate()) {
            return;
          }

          final formState = ref.read(todoFormProvider);

          await ref
              .read(todoNotifierProvider.notifier)
              .addTodo(
                title: formState.title,
                date: formState.selectedDate,
                time: formState.selectedTime,
                notes: formState.notes,
              );
        },
        child:
            submitState.isLoading
                ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    SizedBox(width: 8),
                    Text(EditTodoStrings.editting),
                    // Text(context.tr("todo.edit.edtting")),
                  ],
                )
                : Text("Save"),
      ),
    );
  }

  Widget _buildTimeField(WidgetRef ref, TimeOfDay? selectedTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Time",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        TimeFormField(
          labelText: "",
          validator: TodoValidators.validateTime,
          onChanged: ref.read(todoFormProvider.notifier).updateTime,
        ),
      ],
    );
  }

  Widget _buildTodoTitle(WidgetRef ref, String currentTitle) {
    final titleKey = "title_field_$currentTitle";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        InputFormField(
          key: ValueKey(titleKey),
          validator: TodoValidators.validateTitle,
          initialValue: currentTitle,
          onChanged: ref.read(todoFormProvider.notifier).updateTitle,
        ),
      ],
    );
  }
}
