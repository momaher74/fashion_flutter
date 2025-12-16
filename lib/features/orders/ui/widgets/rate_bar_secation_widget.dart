import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/services/constants.dart';

class RateBarSectionWidget extends StatelessWidget {
  const RateBarSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  RatingBar.builder(
      initialRating: 5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color:starColor,
        size: 45,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
