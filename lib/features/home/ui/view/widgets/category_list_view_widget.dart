import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/models/product_model.dart';

class CategoryListViewWidget extends StatelessWidget {
  const CategoryListViewWidget({super.key, required this.categories});
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 70,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(child: CustomCachedImage(imageUrl: categories[index].image , width: 25, height: 25,borderRadius: BorderRadius.circular(50),)),
              ),
              Gap(5) ,
              CustomText(categories[index].name, fontSize: 10),
            ],
          );
        },
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
