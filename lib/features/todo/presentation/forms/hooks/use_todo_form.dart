import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learn_riverpod/features/category/data/models/category.dart';
import 'package:learn_riverpod/features/todo/data/models/todo.dart';
import 'package:learn_riverpod/features/todo/presentation/forms/todo_form_state.dart';

TodoFormState useTodoForm({Todo? initialTodo}) {
  final titleController = useTextEditingController();
  final descriptionController = useTextEditingController();
  final selectedDate = useState<DateTime?>(null);
  final selectedTime = useState<TimeOfDay?>(null);
  final selectedCategory = useState<Category?>(null);
  final formKey = useMemoized(() => GlobalKey<FormState>());
  final isValid = useState(false);
  List<Category> categories = const [];

  final formState = useMemoized(
    () => TodoFormState(
      titleController: titleController,
      descriptionController: descriptionController,
      selectedDate: selectedDate,
      selectedTime: selectedTime,
      selectedCategory: selectedCategory,
      formKey: formKey,
      isValid: isValid,
      categories: categories
    ),
  );

  useEffect(() {
    void onTextChanged() {
      formState.validateForm();
    }

    titleController.addListener(onTextChanged);
    descriptionController.addListener(onTextChanged);

    return () {
      titleController.removeListener(onTextChanged);
      descriptionController.removeListener(onTextChanged);
    };
  }, [titleController, descriptionController]);

  useEffect(() {
    if (initialTodo != null) {
      formState.fillFromTodo(initialTodo);
    }

    return null;
  }, [initialTodo]);

  return formState;
}
