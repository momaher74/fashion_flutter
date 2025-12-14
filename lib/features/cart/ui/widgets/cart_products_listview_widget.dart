import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/models/product_model.dart';
import '../../../../core/services/constants.dart';
import '../../../../core/widgets/cached_network_image.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class CartProductsListviewWidget extends StatelessWidget {
  const CartProductsListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: products.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final ProductModel product = products[index];
          return Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: .2),

                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                CustomCachedImage(
                  imageUrl: product.imageUrl,
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(12),
                ),
                Gap(20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(product.name, fontWeight: bold, fontSize: 13),
                      Gap(10),
                      CustomText(
                        product.discountPrice.toString(),
                        fontWeight: bold,
                        fontSize: 13,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              "Size: L  |  Color: Cream",
                              color: Colors.grey,
                            ),
                          ),

                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.remove, color: Colors.grey),
                                CustomText("3"),
                                Icon(Icons.add, color: Colors.grey),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(5),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Gap(10);
        },
      ),
    );
  }
}
