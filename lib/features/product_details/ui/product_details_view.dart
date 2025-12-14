import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/product_details_image_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});
  final ProductModel productModel ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
           ProductDetailsImageWidget(imageUrl: productModel.imageUrl ,isFavourite: productModel.isFavourite, ),
          ],
        ),
      ),
    );
  }
}
