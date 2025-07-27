// 4. Performance Optimizations
//
// Memoize các widget builder methods
// Debounce validation để tránh lag khi gõ
// Lazy initialization cho các expensive operations
//
// 5. Accessibility
//
// Thêm semantic labels cho screen readers
// Keyboard navigation support
// High contrast mode support
// Text scaling compatibility
//
// 6. Error Handling
//
// Comprehensive error handling cho network/storage failures
// Retry mechanism khi submit fail
// Offline support với sync khi online
//
// 7. Code Organization
//
// Tạo Custom Hook useNewTodoForm() để encapsulate logic
// Extract constants (strings, styles) ra file riêng
// Builder pattern cho form fields
// Factory methods cho different todo types
//
// 8. Testing
//
// Widget tests cho UI components
// Unit tests cho validation logic
// Integration tests cho full flow
//
// 9. Internationalization
//
// Multi-language support cho labels/messages
// Date/time formatting theo locale
// RTL support cho Arabic/Hebrew
//
// 10. Advanced Features
//
// Voice input cho title field
// Quick actions (duplicate, template)
// Drag & drop để reorder fields
// Auto-complete cho frequently used titles
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/todo/presentation/controllers/todo_controller.dart';
import 'package:learn_riverpod/features/todo/presentation/controllers/todo_form_controller.dart';
import 'package:learn_riverpod/features/todo/strings/new_todo_strings.dart';
import 'package:learn_riverpod/features/todo/presentation/services/new_todo_form_service.dart';
import 'package:learn_riverpod/features/todo/presentation/validators/todo_validators.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/form/date_form_field.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/form/time_form_field.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class NewTodoPage extends LocalizedConsumerWidget {
  const NewTodoPage({super.key});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final formState = ref.watch(todoFormControllerProvider);
    final submitState = ref.watch(todoControllerProvider);

    ref.listen(todoControllerProvider, (prev, next) {
      next.when(
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(NewTodoStrings.createdTodo),
              // content: Text(context.tr("todo.new.created_todo")),
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

    return WillPopScope(
      child: SharedScaffold(
        title: NewTodoStrings.title,
        currentRoute: AppRoutes.todo,
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
                    Expanded(
                      child: _buildDateField(ref, formState.selectedDate),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildTimeField(ref, formState.selectedTime),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _buildNotesField(ref, formState.description),
                SizedBox(height: 24),
                _buildSubmitButton(ref, submitState, formKey),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        final hasChanges =
            ref.read(todoFormControllerProvider.notifier).hasChanges();
        if (!hasChanges) {
          return true;
        }

        final willPop = await _showExitDialog(context);
        return willPop ?? false;
      },
    );
  }

  Future<bool?> _showExitDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
            title: Text('Confirm exit'),
            content: Text('Are you want to exit? Data unsave will be lost.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  Widget _buildTodoTitle(WidgetRef ref, String currentTitle) {
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
          onChanged: ref.read(todoFormControllerProvider.notifier).updateTitle,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }

  Widget _buildDateField(WidgetRef ref, DateTime? selectedDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        DateFormField(
          initialDate: selectedDate,
          labelText: "",
          validator: TodoValidators.validateDate,
          onChanged: ref.read(todoFormControllerProvider.notifier).updateDate,
        ),
      ],
    );
  }

  Widget _buildNotesField(WidgetRef ref, String currentNotes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Notes",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        InputFormField(
          initialValue: currentNotes,
          validator: TodoValidators.validateNotes,
          maxLines: 6,
          onChanged: ref.read(todoFormControllerProvider.notifier).updateNotes,
        ),
      ],
    );
  }

  Widget _buildTimeField(WidgetRef ref, TimeOfDay? selectedTime) {
    final formState = ref.watch(todoFormControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Time",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        TimeFormField(
          labelText: "",
          validator: TodoValidators.validateTimeWithDate(
            formState.selectedDate,
          ),
          onChanged: ref.read(todoFormControllerProvider.notifier).updateTime,
        ),
      ],
    );
  }

  Widget _buildSubmitButton(
    WidgetRef ref,
    AsyncValue<void> submitState,
    GlobalKey<FormState> formKey,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (!formKey.currentState!.validate()) {
            print("Todo invalid");
            return;
          }

          final formState = ref.read(todoFormControllerProvider);

          await ref
              .read(todoControllerProvider.notifier)
              .addTodo(
                title: formState.title,
                date: formState.selectedDate,
                time: formState.selectedTime,
                description: formState.description,
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
                    Text("Đang tạo..."),
                  ],
                )
                : Text("Save"),
      ),
    );
  }
}
