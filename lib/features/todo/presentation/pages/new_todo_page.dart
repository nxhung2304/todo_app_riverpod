import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/app/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/todo_list.dart';
import 'package:learn_riverpod/features/todo/presentation/validators/todo_validators.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/base_date_form_field.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/base_text_form_field.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/base_time_form_field.dart';

class NewTodoPage extends HookConsumerWidget {
  const NewTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoTitleController = useTextEditingController();
    final notesController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final selectedDate = useState<DateTime?>(null);
    final selectedTime = useState<TimeOfDay?>(null);

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
              SizedBox(height: 16),
              _buildDateField(selectedDate),
              SizedBox(height: 16),
              _buildTimeField(selectedTime),
              SizedBox(height: 16),
              _buildNotesField(notesController),
              SizedBox(height: 24),
              _buildSubmitTodo(
                context,
                todoTitleController,
                ref,
                formKey,
                selectedDate,
                selectedTime,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTodoTitle(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        BaseTextFormField(
          validator: TodoValidators.validateTitle,
          controller: controller,
        ),
      ],
    );
  }

  Widget _buildSubmitTodo(
    BuildContext context,
    TextEditingController todoTitleController,
    WidgetRef ref,
    GlobalKey<FormState> formKey,
    ValueNotifier<DateTime?> selectedDate,
    ValueNotifier<TimeOfDay?> selectedTime,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            final todoTitle = todoTitleController.text.trim();

            ref.read(todoListProvider.notifier).addTodo(title: todoTitle);
            context.go(AppRoutes.root);
          }
        },
        child: Text("Add todo"),
      ),
    );
  }

  Widget _buildDateField(ValueNotifier<DateTime?> selectedDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ngày",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        DateFormField(
          labelText: "Chọn ngày",
          validator: TodoValidators.validateDate,
          onChanged: (date) => selectedDate.value = date,
        ),
      ],
    );
  }

  Widget _buildNotesField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Notes",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        BaseTextFormField(
          controller: controller,
          validator: TodoValidators.validateNotes,
          maxLines: 6,
        ),
      ],
    );
  }

  Widget _buildTimeField(ValueNotifier<TimeOfDay?> selectedTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Thời gian",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        TimeFormField(
          labelText: "Chọn thời gian",
          validator: TodoValidators.validateTime,
          onChanged: (time) => selectedTime.value = time,
        ),
      ],
    );
  }
}
