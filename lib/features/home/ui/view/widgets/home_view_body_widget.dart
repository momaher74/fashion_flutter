import 'package:fashion_flutter/features/home/data/models/home_model.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/offers_widget.dart';
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
  const HomeViewBodyWidget({super.key, required this.data});
  final HomeData ? data ;
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
                 CategoryListViewWidget(categories: data?.categories ??[],),
                 BannerWidget(banners:data?.banners??[] ,),
                 ProductsListView(popularProducts: data?.popularProducts ?? [],),
                 RecommendedListView(recommendedProducts:data ?.recommendedProducts?? [],),
                OffersWidget(offers: data?.offers ??[]) ,
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
