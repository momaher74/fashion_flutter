import 'package:fashion_flutter/features/home/ui/view/widgets/products_list_view.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/recommanded_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/services/constants.dart';
import 'banner_widget.dart';
import 'category_list_view_widget.dart';
import 'collecation_container.dart';
import 'collections_list_view.dart';

class HomeViewBodyWidget extends StatelessWidget {
  const HomeViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                const Gap(2),
                const CategoryListViewWidget(),
                const BannerWidget(),
                const ProductsListView(),
                CollectionContainer(
                  title: 'New Collection',
                  subTitle: 'For SLIM\n& BEAUTY',
                  imageUrl: productImages[4],
                ),
                const RecommandedListView(),
                const Gap(10),
                const CollectionsListView(),
                const Gap(60),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
