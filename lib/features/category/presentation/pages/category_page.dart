import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/core/extensions/string_extension.dart';
import 'package:learn_riverpod/features/category/data/models/category.dart';
import 'package:learn_riverpod/features/category/presentation/controllers/category_controller.dart';
import 'package:learn_riverpod/features/category/strings/category_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';
import 'package:learn_riverpod/shared/widgets/notifications/app_snackbar.dart';

class CategoryPage extends LocalizedConsumerWidget {
  const CategoryPage({super.key});

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoryControllerProvider);
    return SharedScaffold(
      title: CategoryStrings.title,
      currentRoute: AppRoutes.category,
      body: categoriesAsync.when(
        data:
            (categories) => Column(
              children: [
                _buildAddButton(context),
                Expanded(child: _buildCategoriesList(context, ref, categories)),
              ],
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $error'),
                  ElevatedButton(
                    onPressed: () => ref.refresh(categoryControllerProvider),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
      ),
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () => context.push(AppRoutes.newCategory),
        child: Text(CategoryStrings.createTitle),
      ),
    );
  }

  Widget _buildCategoriesList(
    BuildContext context,
    WidgetRef ref,
    List<Category> categories,
  ) {
    if (categories.isEmpty) {
      return Center(child: Text(CategoryStrings.noCategoriesFound));
    }

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return ListTile(
          leading: Icon(
            category.icon?.toIconData() ?? Icons.category,
            color: category.color?.toColor() ?? Colors.grey,
          ),
          trailing: ElevatedButton(
            onPressed: () async {
              print("delted category");
              final controller = ref.read(categoryControllerProvider.notifier);
              final result = await controller.deleteCategory(category.id);

              if (!context.mounted) return;

              if (result.isSuccess) {
                AppSnackBar.showSuccess(
                  context,
                  "Deleted category: ${category.name}",
                );
              }
            },
            child: Text("Delete"),
          ),
          title: Text(category.name),
          onTap:
              () => context.push(
                AppRoutes.editCategory.replaceFirst(
                  ':categoryId',
                  category.id.toString(),
                ),
              ),
        );
      },
    );
  }
}
