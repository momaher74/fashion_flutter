import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/shared_app_bar.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/banner_widget.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/category_list_view_widget.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/collecation_container.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            Gap(60),
            SharedAppBar(),
            CategoryListViewWidget(),
            BannerWidget(),
            ProductsListView(),
            CollecationContainer(),
          ],
        ),
      ),
    );
  }
}
