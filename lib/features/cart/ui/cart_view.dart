import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/shared_back_button.dart';
import 'package:fashion_flutter/features/cart/ui/widgets/cart_payment_info_widget.dart';
import 'package:fashion_flutter/features/cart/ui/widgets/cart_products_listview_widget.dart';
import 'package:fashion_flutter/features/cart/ui/widgets/shopping_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/models/product_model.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          const Gap(60),
          ShoppingAppBar(title: "Your Cart"),

          CartProductsListviewWidget(),

          CartPaymentInfoWidget(),
        ],
      ),
    );
  }
}
