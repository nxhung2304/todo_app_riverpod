import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/features/category/data/models/category.dart';
import 'package:learn_riverpod/shared/widgets/form/bottom_sheet_picker.dart';

class CategoryPicker extends HookConsumerWidget {
  final Function(Category?) onCategorySelected;
  final List<Category> categories;
  final Category? initialCategory;

  const CategoryPicker({
    super.key,
    required this.onCategorySelected,
    required this.categories,
    this.initialCategory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = useState<Category?>(initialCategory);

    useEffect(() {
      selectedCategory.value = initialCategory;
      return null;
    }, [initialCategory]);

    if (selectedCategory.value == null && categories.isNotEmpty) {
      selectedCategory.value = categories.first;
    }

    return BottomSheetPicker<Category>(
      items: categories,
      title: 'Select Category',
      crossAxisCount: 4,
      childAspectRatio: 1.2,
      onItemSelected: (category) {
        selectedCategory.value = category;
        onCategorySelected(category);
      },
      initialItem: selectedCategory.value,
      itemBuilder: (category, isSelected, selectedCategory) {
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color:
                isSelected ? Colors.blue.withOpacity(0.2) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? Colors.blue : Colors.grey.withOpacity(0.3),
            ),
          ),
          child: Center(
            child: Text(
              category.name,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      },
      previewBuilder: (category, _) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category?.name ?? 'Select Category',
                style: TextStyle(
                  color: category != null ? Colors.black : Colors.grey,
                ),
              ),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        );
      },
    );
  }
}
