import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gap/gap.dart';

class ReviewsListviewWidget extends StatelessWidget {
  const ReviewsListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130, // Set a fixed height for the ListView
      width: double.infinity,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,

        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            width: 250,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withValues(alpha: .3)),

              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        CustomText(
                          "Jennifer Rose",
                          fontWeight: bold,
                          fontSize: 13,
                        ),
                        StarRating(
                          size: 10.0,
                          rating: 4,
                          color: Color(0xff508A7B),
                          borderColor: Colors.grey,
                          allowHalfRating: true,
                          starCount: 5,
                          onRatingChanged: (rating) {},
                        ),
                      ],
                    ),

                    Spacer(),

                    CustomText(
                      "5m ago",
                      color: Colors.grey,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Gap(15),
                Expanded(
                  child: CustomText(
                    "I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!",
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Gap(8);
        },
        itemCount: 2,
      ),
    );
  }
}
