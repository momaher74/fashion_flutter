import 'package:fashion_flutter/core/widgets/shared_favourite_button.dart';
import 'package:fashion_flutter/features/product_details/ui/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../models/product_model.dart';
import '../services/constants.dart';
import 'cached_network_image.dart';
import 'custom_text_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    this.isGrid = false,
    this.showFavIcon = true,
    required this.onTap,
  });

  final ProductModel product;
  final bool isGrid, showFavIcon;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      margin: const EdgeInsets.symmetric(horizontal: 8),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: isGrid ? 6 : 0,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsView(productModel: product),
                    ),
                  );
                },
                child: CustomCachedImage(
                  imageUrl: product.images.last,
                  height: isGrid ? 200 : 170,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              Container(
                height: isGrid ? 200 : 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black.withValues(alpha: .1),
                ),
              ),
              if (showFavIcon)
                Positioned(
                  top: 0,
                  right: 0,
                  child: SharedFavouriteButton(
                    isFavourite: product.isFavourite,
                    onTap: onTap,
                  ),
                ),
            ],
          ),
          Gap(10),
          CustomText(
            product.name,
            fontSize: 14,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w600,
          ),
          if (isGrid)
            CustomText(
              product.description,
              fontSize: 10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              color: Colors.grey,
            ),
          Row(
            spacing: 8,
            children: [
              CustomText(
                product.finalPrice.toString(),
                fontSize: 16,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                fontWeight: bold,
              ),
              if (product.finalPrice != product.price)
                CustomText(
                  product.price.toString(),
                  fontSize: 16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: normal,
                  color: Colors.grey,
                  lineThrough: true,
                ),

              CustomText(product.currency, fontSize: 8, fontWeight: bold),
            ],
          ),
        ],
      ),
    );
  }
}
