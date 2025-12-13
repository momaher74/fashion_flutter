import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CollectionContainer extends StatelessWidget {
  const CollectionContainer({super.key, required this.title, required this.subTitle, required this.imageUrl,  this.marginPercentage = 0.08});
  final String title , subTitle , imageUrl;
  final double marginPercentage ;

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate responsive sizes based on screen width
    final containerHeight = screenWidth * 0.5; // 50% of screen width
    final outerCircleSize = screenWidth * 0.45; // 45% of screen width
    final innerCircleSize = screenWidth * 0.36; // 36% of screen width
    final imageWidth = screenWidth * 0.35; // 35% of screen width
    final imageHeight = imageWidth * 1.4; // Maintain aspect ratio

    return Container(
      margin: EdgeInsets.only(top: screenWidth * marginPercentage), // 8% of screen width
      width: double.infinity,
      height: containerHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background container
          Container(
            width: double.infinity,
            height: containerHeight,
            color: Colors.blueGrey.withOpacity(0.1),
          ),

          // Circles and image aligned to the right
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(
                right: screenWidth * 0.04,
              ), // 4% padding from right
              child: SizedBox(
                width: outerCircleSize,
                height: containerHeight,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    // Outer circle
                    Container(
                      width: outerCircleSize,
                      height: outerCircleSize * 0.85,
                      decoration: BoxDecoration(
                        color: Color(0xffE2E2E2),
                        shape: BoxShape.circle,
                      ),
                    ),

                    // Inner circle
                    Container(
                      width: innerCircleSize,
                      height: innerCircleSize * 0.85,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                    ),

                    // Product image - positioned to overflow at the top
                    Positioned(
                      top: -(containerHeight * 0.15), // Overflow at top
                      child: CustomCachedImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        width: imageWidth,
                        height: imageHeight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 40, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 30,
              children: [
                CustomText(
                  title,
                  color: Colors.grey,
                  fontSize: size16,
                ),

                CustomText(
                  subTitle,
                  color: Colors.grey,
                  fontSize: size18,
                  fontWeight: bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
