import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/product_item_widget.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/color_size_widget.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/descripation_widget.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/product_details_image_widget.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/product_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';


import '../../../core/widgets/animated_divider_widget.dart';
import 'widgets/all_images_list_view.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 30),
          width: double.infinity,
          child: Column(
            children: [
              ProductDetailsImageWidget(
                imageUrl: productModel.imageUrl,
                isFavourite: productModel.isFavourite,
              ),
              Container(
           
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, -2),
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                                
                    children: [
                      Center(child: ProductAllImagesListView(images: productImages)),
                      PremiumAnimatedDivider(height: 1,indicatorWidth: 6,) ,
                      ProductHeaderWidget(productModel: productModel),
                      ColorSizeWidget() ,
                      DescriptionWidget(description: productModel.description,) , 
                      Gap(30) ,

                                
                                
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
