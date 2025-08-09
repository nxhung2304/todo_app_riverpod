import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learn_riverpod/core/config/router/app_routes.dart';
import 'package:learn_riverpod/features/category/presentation/forms/category_form.dart';
import 'package:learn_riverpod/features/category/strings/category_strings.dart';
import 'package:learn_riverpod/shared/widgets/base/localized_cosumer_widget.dart';
import 'package:learn_riverpod/shared/widgets/layout/shared_scaffold.dart';

class CategoryNewPage extends LocalizedConsumerWidget {
  const CategoryNewPage({super.key});

  Future<void> onSubmit(BuildContext context, WidgetRef ref) async {
    print("Category creating");
  }

  @override
  Widget buildLocalized(BuildContext context, WidgetRef ref) {
    return SharedScaffold(
      title: CategoryStrings.title,
      currentRoute: AppRoutes.category,
      body: CategoryForm.create(onSubmit: () => onSubmit(context, ref)),
    );
  }
}
