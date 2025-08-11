import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/category/data/models/params/category_params.dart';
import 'package:learn_riverpod/features/category/presentation/controllers/category_controller.dart';
import 'package:learn_riverpod/features/category/presentation/forms/category_form.dart';
import 'package:learn_riverpod/features/category/strings/category_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';
import 'package:learn_riverpod/shared/widgets/notifications/app_snackbar.dart';

class CategoryEditPage extends LocalizedConsumerWidget {
  final int? categoryId;

  const CategoryEditPage({super.key, required this.categoryId});

  Future<void> onSubmit(
    BuildContext context,
    WidgetRef ref,
    CategoryParams params,
  ) async {
    if (categoryId == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(CategoryStrings.categoryNotFound)));
      return;
    }

    try {
      final controller = ref.read(categoryControllerProvider.notifier);

      final result = await controller.updateCategory(categoryId!, params);

      if (!context.mounted) return;

      if (result.isSuccess) {
        AppSnackBar.showSuccess(context, CategoryStrings.updateSuccess);
        context.pop();
      } else {
        AppSnackBar.showError(context, CategoryStrings.updateError);
      }
    } catch (e) {
      AppSnackBar.showError(context, e.toString());
    }
  }

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    return SharedScaffold(
      title: CategoryStrings.title,
      currentRoute: AppRoutes.category,
      body: CategoryForm.edit(
        categoryId: categoryId,
        onSubmit: (params) => onSubmit(context, ref, params),
      ),
    );
  }
}
