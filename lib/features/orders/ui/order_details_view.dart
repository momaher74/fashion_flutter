import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/primary_button.dart';
import 'package:fashion_flutter/features/orders/data/models/order_model.dart';
import 'package:fashion_flutter/features/orders/ui/widgets/order_info_widget.dart';
import 'package:fashion_flutter/features/orders/ui/widgets/order_products_listview.dart';
import 'package:fashion_flutter/features/orders/ui/widgets/order_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/product_model.dart';
import '../../../core/widgets/product_item_widget.dart';
import '../../../core/widgets/shopping_app_bar.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,

          children: [
            headerGap(),
            ShoppingAppBar(
              title: AppLocalizations.orders.orderDetails,
              horizontal: 0,
            ),

            OrderStatusWidget(),

            OrderInfoWidget(order: order),
            CustomText(
              AppLocalizations.orders.orderProducts,
              fontWeight: bold,
              fontSize: size16,
            ),
            OrderProductsListview(),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: CustomText(
                        "Go Home",
                        fontSize: size15,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: PrimaryButton(
                    title: AppLocalizations.product.rating,
                    onTap: () {
                      context.pushNamed(rateOrderView);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
