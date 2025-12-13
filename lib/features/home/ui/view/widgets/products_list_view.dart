import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/show_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/product_item_widget.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        ShowAllWidget(title: "Products"),
        SizedBox(
          height: 230,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ProductItem(product: products[index]);
            },
            itemCount: products.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
