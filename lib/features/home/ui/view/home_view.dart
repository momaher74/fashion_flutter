import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/banner_widget.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/category_list_view_widget.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/collecation_container.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/collections_list_view.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/custom_drawer_widget.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/products_list_view.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/recommanded_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SliderDrawer(
          key: _sliderDrawerKey,
        
          appBar: SliderAppBar(
            
            config: SliderAppBarConfig(
              drawerIconSize: 28,
              
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                                   Spacer() ,

                  const CustomText("Fashion" , fontSize: size22 ,fontWeight: bold, ) , 
                 Spacer() ,
                 Icon(PhosphorIcons.bell(), size: 28),
                ],
              ),
              
            ),
            
          ),
          sliderOpenSize: 250,
          
          slider: const CustomDrawerWidget(),
          child: Column(
            children: [
              // Scrollable Content
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
          ),
        ),
      ),
    );
  }
}
