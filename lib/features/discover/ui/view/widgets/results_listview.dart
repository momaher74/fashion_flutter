import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/core/widgets/shared_gridview.dart';
import 'package:fashion_flutter/features/discover/ui/manager/discover_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/show_all_widget.dart';

class ResultsListview extends StatelessWidget {
  const ResultsListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      buildWhen: (old, current) => old.products != current.products,
      builder: (context, state) {
        if (state.products.isNotEmpty) {
          return  SharedProductsGridView(
            gridProducts: state.products, onTap: () {  },

          );
        }
        return Column(
          children: [
            ShowAllWidget(title: "Popular"),
            Gap(10) ,
            SingleChildScrollView(
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
                      CustomCachedImage(imageUrl: discoverImages[index]),
                  childCount: discoverImages.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
