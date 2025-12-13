import 'package:easy_localization/easy_localization.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CategoryListViewWidget extends StatelessWidget {
  const CategoryListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      tr("women"),
      "men",
      "kids",
      "shoes",
      "bags",
      "accessories",
    ];
    final categoryIcons = [
      PhosphorIcon(PhosphorIcons.genderFemale()),
      PhosphorIcon(PhosphorIcons.genderMale()),
      PhosphorIcon(PhosphorIcons.knife()),
      PhosphorIcon(PhosphorIcons.sneaker()),
      PhosphorIcon(PhosphorIcons.bag()),
      PhosphorIcon(PhosphorIcons.sunglasses()),
    ];

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
                child: Center(child: categoryIcons[index]),
              ),
              Spacer(),
              CustomText(categories[index], fontSize: 10),
            ],
          );
        },
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
