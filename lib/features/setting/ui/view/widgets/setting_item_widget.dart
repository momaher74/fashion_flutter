import 'package:fashion_flutter/core/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/custom_text_widget.dart';

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget({
    super.key,
    required this.text,
    required this.iconData, required this.onTap,
  });

  final String text;

  final IconData iconData;
  final VoidCallback onTap ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),

        child: Column(
          children: [
            Row(
              children: [
                Icon(iconData ,color: Colors.grey,),
                Gap(10) ,

                Expanded(child: CustomText(text , fontSize: 15,fontWeight: bold,)),
                Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
            Gap(15) ,
            Divider(),
            Gap(5) ,

          ],
        ),
      ),
    );
  }
}
