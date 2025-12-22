import 'package:fashion_flutter/core/models/filter_argument_model.dart';
import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/features/categories/data/model/category_model.dart';
import 'package:fashion_flutter/features/categories/view/widgets/subcategory_card_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubcategoryList extends StatelessWidget {
  final List<SubCategoryModel> subCategories;

  const SubcategoryList({super.key, required this.subCategories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: subCategories.length,
        itemBuilder: (context, index) {
          return SubcategoryCard(
            subCategory: subCategories[index],
            onTap: () {
              context.pushNamed(
                filterView,
                extra: FilterArgumentModel(
                  categoryId: subCategories[index].categoryId,
                  subCategoryId: subCategories[index].id,
                ),
              );
              // Handle subcategory tap
            },
          );
        },
      ),
    );
  }
}
