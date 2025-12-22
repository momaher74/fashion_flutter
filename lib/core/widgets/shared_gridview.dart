import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/core/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

import '../services/constants.dart';

class SharedProductsGridView extends StatelessWidget {
  const SharedProductsGridView({
    super.key,
    this.gridProducts,
    this.ratio,
    required this.onTap,
  });

  final List<ProductModel>? gridProducts;

  final VoidCallback onTap;
  final double? ratio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: gridProducts != null ? gridProducts!.length : products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: ratio ?? .75,
        mainAxisSpacing: 30,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ProductItem(
          product: gridProducts != null
              ? gridProducts![index]
              : products[index],
          isGrid: true,
          onTap: onTap,
        );
      },
    );
  }
}
