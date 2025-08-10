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
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';

enum CategoryFormMode { create, edit }

class CategoryForm extends LocalizedConsumerWidget {
  final CategoryFormMode mode;
  final String? categoryId;
  final Future<void> Function(CategoryParams) onSubmit;

  const CategoryForm.create({super.key, required this.onSubmit})
    : mode = CategoryFormMode.create,
      categoryId = null;

  const CategoryForm.edit({
    super.key,
    required this.categoryId,
    required this.onSubmit,
  }) : mode = CategoryFormMode.edit;

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final nameController = useTextEditingController();
    final selectedIcon = useState<IconData?>(null);
    final selectedColor = useState<Color>(Colors.blue);
    final isEdit = mode == CategoryFormMode.edit;

    Future<void> _loadCategoryData() async {
      try {
        final category = await ref
            .read(categoryRepositoryProvider)
            .getById(categoryId!);

        nameController.text = category.data?.name ?? '';
        selectedIcon.value = category.data?.icon.toIconData();
        selectedColor.value = category.data?.color.toColor() ?? Colors.blue;
      } catch (e) {
        print(e.toString());
      }
    }

    useEffect(() {
      if (isEdit && categoryId != null) {
        _loadCategoryData();
      }
      return null;
    }, []);

    String getButtonTitle() {
      return isEdit ? CategoryStrings.editButton : CategoryStrings.newButton;
    }

    _onCategoryFormSubmit() {
      if (formKey.currentState?.validate() ?? false) {
        final categoryParams = CategoryParams(
          name: nameController.text,
          color: selectedColor.value.toHex(),
          icon: selectedIcon.value?.toStorageString() ?? '',
        );

        onSubmit(categoryParams);
      }
    }

    _onIconSelected(IconData? icon) {
      print(selectedIcon);
      selectedIcon.value = icon;
    }

    _onColorSelected(Color? selectedColor) {
      print(selectedColor);
      selectedColor = selectedColor;
    }

    return PopScope(
      canPop: true,
      child: Form(
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
              SizedBox(height: 20),
              IconPicker(
                onIconSelected: _onIconSelected,
                initialIcon: selectedIcon.value,
              ),
              SizedBox(height: 20),
              ColorPicker(
                onColorSelected: _onColorSelected,
                initialColor: selectedColor.value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _onCategoryFormSubmit,
                child: Text(getButtonTitle()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
