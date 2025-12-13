import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/show_all_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecommandedListView extends StatelessWidget {
  const RecommandedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShowAllWidget(title:  "Recommanded" ,),
        Container(
          height: 70,
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final ProductModel product = products[index];
              return Container(
                padding: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.withValues(alpha: .18)),
                ),
                child: Row(
                  children: [
                    CustomCachedImage(imageUrl: product.imageUrl, width: 60 , fit: BoxFit.cover,height: 70,borderRadius: BorderRadius.circular(10),),
                    Gap(10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       CustomText(   product.name , fontSize: size18, fontWeight: bold,),
                       CustomText( product.price.toString()),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 20);
            },
            itemCount: products.length,
          ),
        ),
      ],
    );
  }
}
