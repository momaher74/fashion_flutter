import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/app_localizations.dart';
import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/product_item_widget.dart';

class SimilarProductsWidget extends StatelessWidget {
  const SimilarProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            AppLocalizations.product.similarProducts,
            fontWeight: bold,
            fontSize: size16,
          ),
          Gap(30),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ProductItem(product: products[index]);
              },
              separatorBuilder: (context, index) {
                return Gap(10);
              },
              itemCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
