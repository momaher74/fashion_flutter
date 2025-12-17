import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomText(
                    "Good morning! Get 20% Voucher",
                    fontSize: size16,
                  ),
                ),
                // Container(
                //   width: 5,
                //   height: 5,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.red,
                //   ),
                // ),

                CustomText(
                  "seen",
                  fontSize: 8,
                  fontWeight: bold,
                  color: Colors.grey,
                ),
              ],
            ),
            Gap(10),
            CustomText(
              "Summer sale up to 20% off. Limited voucher. Get now!! 😜",
              fontSize: 12,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
