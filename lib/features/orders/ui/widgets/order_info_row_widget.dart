import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class OrderInfoRowWidget extends StatelessWidget {
  const OrderInfoRowWidget({super.key, required this.itemKey, required this.value});
  final String itemKey ,value ;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CustomText(
          itemKey,
          color: Colors.grey,
          fontSize: size14,
          fontWeight: bold,
        ),
        Gap(10) ,
 
        Expanded(
          child: CustomText(
            value,
            fontSize: 12,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
