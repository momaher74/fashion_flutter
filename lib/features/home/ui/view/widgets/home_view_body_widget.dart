import 'package:fashion_flutter/features/home/data/models/home_model.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/offers_widget.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/products_list_view.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/recommanded_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


import 'banner_widget.dart';
import 'category_list_view_widget.dart';

class HomeViewBodyWidget extends StatelessWidget {
  const HomeViewBodyWidget({super.key, required this.data});

  final HomeData? data;

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
                CategoryListViewWidget(categories: data?.categories ?? []),
                BannerWidget(banners: data?.banners ?? []),
                ProductsListView(popularProducts: data?.popularProducts ?? []),
                OffersWidget(offers: data?.offers ?? []),

                RecommendedListView(
                  recommendedProducts: data?.recommendedProducts ?? [],
                ),
                const Gap(15),
                // const CollectionsListView(),
                // const Gap(60),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
