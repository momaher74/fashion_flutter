import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/shared_app_bar.dart';
import 'package:fashion_flutter/features/orders/ui/widgets/order_item_widget.dart';
import 'package:fashion_flutter/features/orders/ui/widgets/order_products_listview.dart';
import 'package:fashion_flutter/features/orders/ui/widgets/orders_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../data/models/order_model.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          spacing: verticalSpace,
          children: [
            headerGap(),
            SharedAppBar(title: "My Orders"),
            Gap(5),
            OrdersHeaderWidget(),
            OrderProductsListview(),
          ],
        ),
      ),
    );
  }
}
