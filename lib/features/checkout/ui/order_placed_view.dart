import 'package:fashion_flutter/core/assets/app_assets.dart';
import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/primary_button.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/checkout/ui/widget/dottoed_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class OrderPlacedView extends StatelessWidget {
  const OrderPlacedView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          spacing: verticalSpace,
          children: [
            headerGap(),
            ShoppingAppBar(title: "Order placed") ,
            Gap(10),
            DottedLineWidget() ,
            CustomText("Order Completed") ,
            
            Gap(60) ,
            Image.asset(AppAssets.orderPlaced ,width: 120, height: 120, ) ,
            Gap(60) ,

            CustomText("Thank you for your purchase You can view your order in  \n  ‘My Orders’ section." , fontSize: size14,textAlign: TextAlign.center,) ,


            Gap(60) ,

            PrimaryButton(title:"Continue shopping" , onTap: (){
              context.pushNamed(ordersView) ;
            }) ,



          ],
        ),
      ),
    );
  }
}
