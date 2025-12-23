import 'package:fashion_flutter/features/product_details/data/models/product_details_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';


class ProductHeaderWidget extends StatelessWidget {
  const ProductHeaderWidget({super.key, required this.productModel});

  final ProductDetailsModel productModel ;


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
                  productModel.data.name,
                  fontWeight: bold,
                  fontSize: size18,
                  maxLines: 2,
                ),
              ),
              Spacer(),
              CustomText(
                productModel.data.finalPrice.toString(),
                fontWeight: bold,
                fontSize: size18,
              ),
              if (  productModel.data !=
                  productModel.data.finalPrice)
                Padding(
                  padding: EdgeInsets.all(4),
                  child: CustomText(
                    productModel.data.price.toString(),
                    fontWeight: normal,
                    color: Colors.grey,
                    fontSize: 10,
                    lineThrough: true,
                  ),
                ),
            ],
          ),
          Gap(12),

          LottieRatingStars(rating: double.parse(  productModel.data.rate.toInt().toString()),)






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
      Icons.star,
      size: size,
      color: Colors.amber,
    );
  }
}
