import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:fashion_flutter/features/cart/ui/widgets/cart_payment_info_widget.dart';
import 'package:fashion_flutter/features/cart/ui/widgets/cart_products_listview_widget.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool _enabled = true;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _enabled = false;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: _enabled,
      enableSwitchAnimation: true,
  
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(60),
            ShoppingAppBar(title: AppLocalizations.cart.myCart, horizontal: 10),

            Gap(20),

            CartProductsListviewWidget(),

            CartPaymentInfoWidget(),
          ],
        ),
      ),
    );
  }
}
