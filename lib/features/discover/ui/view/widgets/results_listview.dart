import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ResultsListview extends StatelessWidget {
  const ResultsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.custom(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // Disable inner scroll since outer handles it
        padding: EdgeInsets.symmetric(horizontal: 10),
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            const QuiltedGridTile(2, 2),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (context, index) =>
              CustomCachedImage(imageUrl: products[index].imageUrl),
          childCount: products.length,
        ),
      ),
    );
  }
}
