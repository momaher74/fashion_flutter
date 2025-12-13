import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/product_item_widget.dart';
import 'package:fashion_flutter/features/filter/ui/widgets/filter_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Gap(60),
          
              FilterAppBar(title: "Dresses"),
          
              CustomText(
                "Found \n152 Results",
                fontWeight: bold,
                fontSize: size20,
              ),
          
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .65,
                  mainAxisSpacing: 30
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ProductItem(product: products[index] , isGrid: true,);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
