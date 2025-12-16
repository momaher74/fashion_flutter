import 'package:fashion_flutter/core/services/constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_widget.dart';

class OrdersHeaderWidget extends StatelessWidget {
  const OrdersHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: CustomText("Pending" , textAlign: TextAlign.center, fontSize: size14, fontWeight: bold,)) ,
        Expanded(child: CustomText("Delivered" ,  textAlign: TextAlign.center, fontSize: size14, fontWeight: bold,)) ,
        Expanded(child: CustomText("Cancelled" , textAlign: TextAlign.center, fontSize: size14, fontWeight: bold,)) ,
      ],
    );
  }
}
