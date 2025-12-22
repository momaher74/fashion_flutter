import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WishlistShimmerItem extends StatelessWidget {
  const WishlistShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 10),

          // title
          Container(
            height: 14,
            width: double.infinity,
            color: Colors.white,
          ),
          const SizedBox(height: 8),

          // price
          Container(
            height: 14,
            width: 80,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}



class WishlistShimmerGrid extends StatelessWidget {
  const WishlistShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 70),
      itemCount: 6,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .75,
        mainAxisSpacing: 30,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (_, __) => const WishlistShimmerItem(),
    );
  }
}
