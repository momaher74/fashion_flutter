import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/shared_gridview.dart';
import 'package:fashion_flutter/core/widgets/show_all_widget.dart';
import 'package:flutter/material.dart';

class RecommendedListView extends StatelessWidget {
  const RecommendedListView({super.key, required this.recommendedProducts});

  final List<ProductModel> recommendedProducts;

  @override
  Widget build(BuildContext context) {
    recommendedProducts.forEach((link){
      if(!discoverImages.contains(link.images.last)){
        discoverImages.add(link.images.last);
      }
    }) ;
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowAllWidget(title: "Recommended"),
        SharedProductsGridView(gridProducts: recommendedProducts,ratio: .75,),
      ],
    );
  }
}
