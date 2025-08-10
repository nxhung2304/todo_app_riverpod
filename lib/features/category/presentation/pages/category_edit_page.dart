import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/category/data/models/params/category_params.dart';
import 'package:learn_riverpod/features/category/presentation/forms/category_form.dart';
import 'package:learn_riverpod/features/category/strings/category_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class CategoryEditPage extends LocalizedConsumerWidget {
  final String? categoryId;

  const CategoryEditPage({super.key, required this.categoryId});

  Future<void> onSubmit(
    BuildContext context,
    WidgetRef ref,
    CategoryParams params,
  ) async {
    print("Category submitted with ID: $categoryId");
    print("Category params: ${params.toJson()}");
    // Navigator.of(context).pop();
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
