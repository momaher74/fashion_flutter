import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class RateHeaderWidget extends StatelessWidget {
  const RateHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(PhosphorIcons.gift(), size: 30, color: Colors.white),
            Gap(10),
            Expanded(
              child: CustomText(
                "Submit your review to get 5 points",
                color: Colors.white,
                fontWeight: bold,
              ),
            ),
            Gap(10) ,
            Icon(Icons.arrow_forward_ios_rounded ,color: Colors.white,) ,
            Gap(5) ,

          ],
        ),
      );
  }
}
