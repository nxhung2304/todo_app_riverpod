import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/todo/data/models/params/todo_params.dart';
import 'package:learn_riverpod/features/todo/presentation/forms/hooks/use_todo_form.dart';
import 'package:learn_riverpod/features/todo/presentation/forms/todo_form_builder.dart';
import 'package:learn_riverpod/features/todo/presentation/forms/widgets/category_picker.dart';
import 'package:learn_riverpod/shared/enums/form_mode.dart';

class TodoForm extends HookConsumerWidget {
  final FormMode mode;
  final int? todoId;
  final Future<void> Function(TodoParams) onSubmit;

  const TodoForm.create({super.key, required this.onSubmit})
    : mode = FormMode.create,
      todoId = null;

  const TodoForm.edit({super.key, required this.todoId, required this.onSubmit})
    : mode = FormMode.edit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TodoFormBuilder(
      isEdit: mode == FormMode.edit,
      todoId: todoId,
      builder: (context, formData, isLoading, error) {
        if (isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (error != null) {
          return Center(child: Text('Error: $error'));
        }

        final formState = useTodoForm(initialTodo: formData.todo);

        return Form(
          key: formState.formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTitleField(formState.titleController),
                SizedBox(height: 16),

                CategoryPicker(
                  onCategorySelected:
                      (category) => formState.selectedCategory.value = category,
                  categories: formData.categories,
                  initialCategory: formState.selectedCategory.value,
                ),
                SizedBox(height: 16),

                Row(
                  children: [
                    Expanded(
                      child: _buildDateField(
                        context,
                        formState.selectedDate.value,
                        (date) => formState.selectedDate.value = date,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildTimeField(
                        context,
                        formState.selectedTime.value,
                        formState.selectedDate.value,
                        (time) => formState.selectedTime.value = time,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                _buildDescriptionField(formState.descriptionController),
                SizedBox(height: 24),

                ElevatedButton(
                  onPressed: () {
                    if (formState.formKey.currentState?.validate() ?? false) {
                      final params = formState.toParams();
                      onSubmit(params);
                    }
                  },
                  child: Text(formData.isEdit ? 'Update Todo' : 'Create Todo'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        TextFormField(
          controller: controller,
          validator:
              (value) => value?.isEmpty == true ? 'Title required' : null,
          decoration: InputDecoration(hintText: 'Enter todo title'),
        ),
      ],
    );
  }

  Widget _buildDateField(
    BuildContext context,
    DateTime? selectedDate,
    ValueChanged<DateTime?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
            );
            if (date != null) onChanged(date);
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              selectedDate?.toString().split(' ')[0] ?? 'Select date',
              style: TextStyle(
                color: selectedDate != null ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeField(
    BuildContext context,
    TimeOfDay? selectedTime,
    DateTime? selectedDate,
    ValueChanged<TimeOfDay?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Time',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: selectedTime ?? TimeOfDay.now(),
            );
            if (time != null) onChanged(time);
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              selectedTime?.format(context) ?? 'Select time',
              style: TextStyle(
                color: selectedTime != null ? Colors.black : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        TextFormField(
          controller: controller,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Enter description (optional)',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
