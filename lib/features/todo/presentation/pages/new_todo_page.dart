// 1. Architecture & State Management
//
// Tạo Form State Provider để quản lý toàn bộ form state thay vì dùng nhiều useState
// Implement Loading/Error states khi submit todo
// Tách Form Logic ra khỏi UI component
//
// 2. UX/UI Improvements
//
// Thêm Loading indicator khi submit
// Auto-save draft khi user gõ
// Confirm dialog khi user back mà chưa save
// Keyboard shortcuts (Ctrl+S to save)
// Focus management tự động chuyển field
//
// 3. Validation Enhancements
//
// Real-time validation thay vì chỉ validate khi submit
// Auto-format date/time input
// Smart defaults (default time = current time + 1 hour)
// Conditional validation (time required nếu có date)
//
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
import 'package:learn_riverpod/features/app/presentation/widgets/shared_app_bar.dart';
import 'package:learn_riverpod/features/app/presentation/widgets/shared_bottom_nav.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/new_todo_form_provider.dart';
import 'package:learn_riverpod/features/todo/presentation/providers/submit_todo_provider.dart';
import 'package:learn_riverpod/features/todo/presentation/services/new_todo_form_service.dart';
import 'package:learn_riverpod/features/todo/presentation/validators/todo_validators.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/date_form_field.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/input_form_field.dart';
import 'package:learn_riverpod/features/todo/presentation/widgets/time_form_field.dart';

class NewTodoPage extends HookConsumerWidget {
  const NewTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final formService = useMemoized(() => NewTodoFormService(ref, formKey));

    final formState = ref.watch(newTodoFormProvider);
    final submitState = ref.watch(submitTodoProvider);

    ref.listen(submitTodoProvider, (prev, next) {
      next.when(
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Todo đã được tạo thành công!"),
              backgroundColor: Colors.green,
            ),
          );
          context.pop();
          // context.go(AppRoutes.home);
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

    return Scaffold(
      appBar: SharedAppBar('new todo', Colors.blue, Colors.white),
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
              _buildSubmitButton(ref, formService, submitState),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SharedBottomNav(currentRoute: '/todo'),
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
          onChanged:
              (value) =>
                  ref.read(newTodoFormProvider.notifier).updateTitle(value),
        ),
      ],
    );
  }

  Widget _buildDateField(WidgetRef ref, DateTime? selectedDate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ngày",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        DateFormField(
          initialDate: selectedDate,
          labelText: "",
          validator: TodoValidators.validateDate,
          onChanged:
              (date) => ref.read(newTodoFormProvider.notifier).updateDate(date),
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
          onChanged:
              (value) =>
                  ref.read(newTodoFormProvider.notifier).updateNotes(value),
        ),
      ],
    );
  }

  Widget _buildTimeField(WidgetRef ref, TimeOfDay? selectedTime) {
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
              (time) => ref.read(newTodoFormProvider.notifier).updateTime(time),
        ),
      ],
    );
  }

  Widget _buildSubmitButton(
    WidgetRef ref,
    NewTodoFormService formService,
    AsyncValue<void> submitState,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          formService.submitForm();
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
