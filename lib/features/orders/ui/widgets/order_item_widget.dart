import 'package:fashion_flutter/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../data/models/order_model.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key,required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomText(
                    "Order#${order.code}",
                    fontWeight: bold,
                    fontSize: size18,
                  ),
                ),
                CustomText(
                  order.date,
                  color: Colors.grey,
                  fontSize: size14,
                ),
              ],
            ),
            Gap(15) ,
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CustomText(
                        "Quantity: ",
                        color: Colors.grey,
                        fontSize: size14,
                      ),

                      CustomText(
                        order.quantity,
                        fontSize: size14,
                        fontWeight: bold,

                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        "Subtotal: ",
                        color: Colors.grey,
                        fontSize: size14,
                      ),

                      CustomText(
                        order.subTotal,
                        fontSize: size14,
                        fontWeight: bold,
                      ),

                    ],
                  ),
                ),
              ],
            ) ,
            Gap(15) ,

            Row(
              children: [
                CustomText(order.status ,fontSize: size14,fontWeight: FontWeight.w600,color: getOrderStatusColor(status: order.status), ),
                Spacer() ,
                PrimaryButton( fontSize: 12, title: "View"  , width: 60,height: 35,horizontal: 0,)
              ],
            )


          ],
        ),
      ),
    );
  }
}
