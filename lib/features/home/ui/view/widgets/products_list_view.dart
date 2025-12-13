import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      margin: const EdgeInsets.symmetric(horizontal: 8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCachedImage(
            imageUrl: product.imageUrl,
            height: 170,
            width: double.infinity,
            borderRadius: BorderRadius.circular(10),
          ),

          Gap(5), 

         CustomText(product.name, fontSize: 14, maxLines: 1, overflow: TextOverflow.ellipsis , fontWeight: FontWeight.w600,),
         CustomText(product.price.toString(), fontSize: 16, maxLines: 1, overflow: TextOverflow.ellipsis , fontWeight: bold,),
        ],
      ),
    );
  }
}
