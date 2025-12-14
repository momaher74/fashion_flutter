import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class ProductHeaderWidget extends StatelessWidget {
  const ProductHeaderWidget({super.key, required this.productModel});

  final ProductModel productModel ;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomText(
                  productModel.name,
                  fontWeight: bold,
                  fontSize: size20,
                ),
              ),
              Spacer(),
              CustomText(
                productModel.discountPrice.toString(),
                fontWeight: bold,
                fontSize: size20,
              ),
              if (productModel.price !=
                  productModel.discountPrice)
                Padding(
                  padding: EdgeInsets.all(4),
                  child: CustomText(
                    productModel.price.toString(),
                    fontWeight: normal,
                    color: Colors.grey,
                    fontSize: 12,
                    lineThrough: true,
                  ),
                ),
            ],
          ),
          Gap(12),

          LottieRatingStars(rating: double.parse(productModel.rate.toInt().toString()),)






        ],
      ),
    );
  }
}

class LottieRatingStars extends StatelessWidget {
  const LottieRatingStars({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 24,
  });

  final double rating;
  final int maxRating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        final starIndex = index + 1;

        if (rating >= starIndex) {
          return _animatedStar();
        } else if (rating >= starIndex - 0.5) {
          return _halfStar();
        } else {
          return _emptyStar();
        }
      }),
    );
  }

  Widget _animatedStar() {
    return SizedBox(
      width: size,
      height: size,
      child: Lottie.asset(
        'assets/animations/star.json',
        repeat: true, // 🔁
      ),
    );
  }

  Widget _halfStar() {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          _emptyStar(),
          ClipRect(
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: 0.5,
              child: _animatedStar(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyStar() {
    return Icon(
      Icons.star_border,
      size: size,
      color: Colors.amber,
    );
  }
}
