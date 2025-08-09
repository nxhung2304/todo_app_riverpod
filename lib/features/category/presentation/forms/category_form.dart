import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/category/presentation/forms/validators/category_validators.dart';
import 'package:learn_riverpod/features/category/strings/category_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

enum CategoryFormMode { create, edit }

class CategoryForm extends LocalizedConsumerWidget {
  final CategoryFormMode mode;
  final String? categoryId;
  final Future<void> Function() onSubmit;

  const CategoryForm.create({super.key, required this.onSubmit})
    : mode = CategoryFormMode.create,
      categoryId = null;

  const CategoryForm.edit({super.key, required this.categoryId, required this.onSubmit})
    : mode = CategoryFormMode.edit;

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final nameController = useTextEditingController();
    final colorController = useTextEditingController();
    final iconController = useTextEditingController();
    final isEdit = mode == CategoryFormMode.edit;

    String getPageTitle() {
      switch (mode) {
        case CategoryFormMode.create:
          return CategoryStrings.createTitle;
        case CategoryFormMode.edit:
          return CategoryStrings.editTitle;
      }
    }

    String getButtonTitle() {
      return isEdit ? CategoryStrings.editButton : CategoryStrings.newButton;
    }

    return PopScope(
      canPop: true,
      child: SharedScaffold(
        title: getPageTitle(),
        currentRoute: AppRoutes.newCategory,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                InputFormField(
                  labelText: CategoryStrings.name,
                  controller: nameController,
                  validator: CategoryValidators.validateName,
                ),
                InputFormField(
                  labelText: CategoryStrings.color,
                  controller: colorController,
                  validator: CategoryValidators.validateColor,
                ),
                InputFormField(
                  labelText: CategoryStrings.icon,
                  controller: iconController,
                  validator: CategoryValidators.validateIcon,
                ),
                ElevatedButton(onPressed: onSubmit, child: Text(getButtonTitle())),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
