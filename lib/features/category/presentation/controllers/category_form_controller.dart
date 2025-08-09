import 'package:learn_riverpod/features/category/presentation/states/category_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_form_controller.g.dart';

@riverpod
class CategoryFormController extends _$CategoryFormController {
  @override
  CategoryFormState build(String? categoryId) {
    // if (categoryId != null) {
    //   _loadCategoryForEdit(categoryId);
    // }

    return CategoryFormState(name: "", color: "", icon: "");
  }

  // Future<void> _loadCategoryForEdit(String categoryId) async {
  //   try {
  //     final todo = await ref.read(todosRepositoryProvider).getTodoById(categoryId);
  //     state = state.copyWith(
  //       title: todo.title,
  //       description: todo.description,
  //       selectedDate: todo.dueDate,
  //       selectedTime: todo.dueTime,
  //       isLoading: false,
  //     );
  //   } catch (e) {
  //     state = state.copyWith(error: e.toString(), isLoading: false);
  //   }
  // }

  Future<void> submit() async {
    if (categoryId == null) {
      print("Create a categorty");
    } else {
      print("Edit a categorty");
    }
  }
}
