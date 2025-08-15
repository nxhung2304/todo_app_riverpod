import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/core/models/api_response.dart';
import 'package:learn_riverpod/features/category/data/models/params/category_params.dart';
import 'package:learn_riverpod/features/category/presentation/controllers/category_controller.dart';
import 'package:learn_riverpod/features/category/presentation/forms/category_form.dart';
import 'package:learn_riverpod/features/category/strings/category_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';
import 'package:learn_riverpod/shared/widgets/notifications/app_snackbar.dart';

class CategoryNewPage extends LocalizedConsumerWidget {
  const CategoryNewPage({super.key});

  Future<void> onSubmit(
    BuildContext context,
    WidgetRef ref,
    CategoryParams categoryParams,
  ) async {
    final result = await ref
        .read(categoryControllerProvider.notifier)
        .createCategory(categoryParams);

    if (!context.mounted) return;

    if (result is ApiSuccess) {
      AppSnackBar.showSuccess(context, CategoryStrings.createdSuccess);
      context.pop();
    } else {
      AppSnackBar.showError(context, CategoryStrings.failedCreate);
    }
  }

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    return SharedScaffold(
      title: CategoryStrings.title,
      currentRoute: AppRoutes.category,
      body: CategoryForm.create(
        onSubmit:
            (CategoryParams categoryParams) =>
                onSubmit(context, ref, categoryParams),
      ),
    );
  }
}
