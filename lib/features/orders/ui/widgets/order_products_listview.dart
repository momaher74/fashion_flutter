import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/models/product_model.dart';
import '../../../../core/services/constants.dart';
import '../../../../core/widgets/product_item_widget.dart';
import '../../../home/data/models/home_model.dart';

class OrderProductsListview extends StatelessWidget {
  const OrderProductsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final ProductModel product = products[index];
          return ProductItem(product: product, showFavIcon: false);
        },
        separatorBuilder: (context, index) {
          return Gap(10);
        },
        itemCount: productImages.length,
      ),
    );
  }
}
