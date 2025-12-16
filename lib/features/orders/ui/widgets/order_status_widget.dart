import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/assets/app_assets.dart';
import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20 , horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10) ,
          color: Colors.black ,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                color: Colors.black
            )
          ]
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText("Your order is delivered" , color: Colors.white, fontSize: size16,) ,
                Gap(6),
                CustomText("Rate product to get 5 points for collect." , color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500,) ,
              ],
            ),
          ),
          Image.asset(AppAssets.orderIcon, width: 60, height: 60,fit: BoxFit.cover,) ,
        ],
      ),
    );
  }
}
