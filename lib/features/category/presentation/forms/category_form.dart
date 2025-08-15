import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/extensions/color_extension.dart';
import 'package:learn_riverpod/core/extensions/icon_extension.dart';
import 'package:learn_riverpod/core/extensions/string_extension.dart';
import 'package:learn_riverpod/features/category/data/models/params/category_params.dart';
import 'package:learn_riverpod/features/category/data/providers/category_providers.dart';
import 'package:learn_riverpod/features/category/presentation/forms/validators/category_validators.dart';
import 'package:learn_riverpod/features/category/presentation/forms/widgets/color_picker.dart';
import 'package:learn_riverpod/features/category/presentation/forms/widgets/icon_picker.dart';
import 'package:learn_riverpod/features/category/strings/category_strings.dart';
import 'package:learn_riverpod/shared/enums/form_mode.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';

class CategoryForm extends LocalizedConsumerWidget {
  final FormMode mode;
  final int? categoryId;
  final Future<void> Function(CategoryParams) onSubmit;

  const CategoryForm.create({super.key, required this.onSubmit})
    : mode = FormMode.create,
      categoryId = null;

  const CategoryForm.edit({
    super.key,
    required this.categoryId,
    required this.onSubmit,
  }) : mode = FormMode.edit;

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final nameController = useTextEditingController();
    final selectedIcon = useState<IconData?>(null);
    var selectedColor = useState<Color?>(Colors.blue);
    final isEdit = mode == FormMode.edit;
    final categoryAsync =
        isEdit && categoryId != null
            ? ref.watch(categoryByIdProvider(categoryId!))
            : null;

    useEffect(() {
      if (categoryAsync?.hasValue == true) {
        final category = categoryAsync!.value!.data;
        if (category != null) {
          nameController.text = category.name;
          selectedIcon.value = category.icon?.toIconData();
          selectedColor.value = category.color?.toColor() ?? Colors.blue;
        }
      }
      return null;
    }, [categoryAsync]);

    if (categoryAsync?.isLoading == true) {
      return const Center(child: CircularProgressIndicator());
    }

    if (categoryAsync?.hasError == true) {
      return Center(child: Text('Error: ${categoryAsync!.error}'));
    }

    String _getButtonTitle() {
      return isEdit ? CategoryStrings.editButton : CategoryStrings.newButton;
    }

    _onCategoryFormSubmit() {
      if (formKey.currentState?.validate() ?? false) {
        final categoryParams = CategoryParams(
          name: nameController.text,
          color: selectedColor.value?.toHex(),
          icon: selectedIcon.value?.toStorageString() ?? '',
        );

        onSubmit(categoryParams);
      }
    }

    _onIconSelected(IconData? icon) {
      selectedIcon.value = icon;
    }

    _onColorSelected(Color? color) {
      selectedColor.value = color;
    }

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InputFormField(
              labelText: CategoryStrings.name,
              controller: nameController,
              validator: CategoryValidators.validateName,
            ),

            const SizedBox(height: 20),
            IconPicker(
              onIconSelected: _onIconSelected,
              initialIcon: selectedIcon.value,
            ),
            const SizedBox(height: 20),
            ColorPicker(
              onColorSelected: _onColorSelected,
              initialColor: selectedColor.value ?? Colors.blue,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _onCategoryFormSubmit,
              child: Text(_getButtonTitle()),
            ),
          ],
        ),
      ),
    );
  }
}
