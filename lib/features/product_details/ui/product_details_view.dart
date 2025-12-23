import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_loading_widget.dart';
import 'package:fashion_flutter/core/widgets/custome_error_widget.dart';
import 'package:fashion_flutter/features/product_details/ui/manager/product_details_cubit.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/add_to_cart_button_widget.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/color_size_widget.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/descripation_widget.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/product_details_image_widget.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/product_header_widget.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/similar_products_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../core/widgets/animated_divider_widget.dart';

import 'widgets/all_images_list_view.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailsCubit>(
      create: (context) => ProductDetailsCubit()..fetchProductDetails(id: id),
      child: Scaffold(
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return CustomLoadingWidget();
            }
            if (state.error != null) {
              return CustomErrorWidget(message: state.error ?? "error");
            }

            final data = state.productDetailsModel!.data;
            final cubit = context.read<ProductDetailsCubit>();

            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 30),
                width: double.infinity,
                child: Column(
                  children: [
                    ProductDetailsImageWidget(
                      imageUrl: data.images.first,
                      isFavourite: data.inFavourite,
                      onFavoriteTap: () async {
                        // Show loading toast
                        if (state.isTogglingFavorite) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text('loading...'),
                                ],
                              ),
                            ),
                            duration: Duration(milliseconds: 800),
                            backgroundColor: Colors.black87,
                          ),
                        );

                        await cubit.toggleFavorite();
                      },
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
                            Center(
                              child: ProductAllImagesListView(
                                images: productImages,
                              ),
                            ),
                            PremiumAnimatedDivider(
                              height: 1,
                              indicatorWidth: 6,
                            ),
                            ProductHeaderWidget(
                              productModel: state.productDetailsModel!,
                            ),
                            ColorSizeWidget(),
                            DescriptionWidget(description: data.description),
                            Gap(30),
                            SimilarProductsWidget(),

                            // Add to Cart Button with dynamic state
                            AddToCartButtonWidget(),

                            Gap(30),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
