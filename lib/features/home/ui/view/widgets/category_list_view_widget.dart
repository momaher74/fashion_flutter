import 'package:fashion_flutter/core/models/filter_argument_model.dart';
import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/models/product_model.dart';

class CategoryListViewWidget extends StatelessWidget {
  const CategoryListViewWidget({super.key, required this.categories});
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 0),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(
                filterView,
                extra: FilterArgumentModel(categoryId: categories[index].id),
              );
              // Navigate to category products page
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2 ,
                      color: primaryColor
                    )
                  ),
                  child: CustomCachedImage(
                    imageUrl: categories[index].image,
                    width: 48,
                    height: 48,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Gap(5),
                Expanded(child: CustomText(categories[index].name, fontSize: 10 ,fontWeight: FontWeight.bold,)),
              ],
            ),
          );
        },
        itemCount: categories.length,
        scrollDirection: Axis.horizontal, separatorBuilder: (BuildContext context, int index) {
          return Gap(10);
      },
      ),
    );
  }
}
