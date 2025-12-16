import 'package:fashion_flutter/core/widgets/product_item_widget.dart';
import 'package:fashion_flutter/features/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/models/product_model.dart';
import '../../../../core/services/constants.dart';
import 'order_info_row_widget.dart';

class OrderInfoWidget extends StatelessWidget {
  const OrderInfoWidget({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white,
      elevation: 5,
      borderOnForeground: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          spacing: verticalSpace,
          children: [
            OrderInfoRowWidget(itemKey: "Order Number", value: order.code),
            OrderInfoRowWidget(itemKey: "Sub Total", value: order.subTotal),
            OrderInfoRowWidget(itemKey: "Status", value: order.status),
            OrderInfoRowWidget(itemKey: "Delivery address", value: "address - street -city"),

          ],
        ),
      ),
    );
  }
}
