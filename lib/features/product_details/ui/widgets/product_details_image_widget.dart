import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_flutter/core/widgets/shared_back_button.dart';
import 'package:fashion_flutter/core/widgets/shared_favourite_button.dart';
import 'package:fashion_flutter/features/product_details/ui/manager/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsImageWidget extends StatelessWidget {
  const ProductDetailsImageWidget({
    super.key,
    required this.imageUrl,
    required this.isFavourite,
    required this.onFavoriteTap,
  });

  final String imageUrl;
  final bool isFavourite;
  final VoidCallback onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: .4.sh,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Background circle
              Container(
                width: 234,
                height: 234,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: .4),
                  shape: BoxShape.circle,
                ),
              ),

              // Product Image with animation
              BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
                buildWhen: (previous, current) =>
                    previous.selectedImageIndex !=
                    current.selectedImageIndex,
                builder: (context, state) {
                  final image =
                      state.productDetailsModel!.data.images[
                          state.selectedImageIndex];

                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.95,
                              end: 1.0,
                            ).animate(animation),
                            child: child,
                          ),
                        );
                      },
                      child: CachedNetworkImage(
                        key: ValueKey(image), // IMPORTANT
                        imageUrl: image,
                        width: 300,
                        height: 500,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

          // Top buttons
          Positioned(
            top: 10,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  const SharedBackButton(),
                  const Spacer(),
                  SharedFavouriteButton(
                    isFavourite: isFavourite,
                    padding: 15,
                    onTap: onFavoriteTap,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
