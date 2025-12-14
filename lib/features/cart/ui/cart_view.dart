
import 'package:fashion_flutter/features/cart/ui/widgets/cart_payment_info_widget.dart';
import 'package:fashion_flutter/features/cart/ui/widgets/cart_products_listview_widget.dart';
import 'package:fashion_flutter/features/cart/ui/widgets/shopping_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';



class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(60),
          ShoppingAppBar(title: "Your Cart"),

          Gap(20),

          CartProductsListviewWidget(),

          CartPaymentInfoWidget(),
        ],
      ),
    );
  }
}
