import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class ColorSizeWidget extends StatelessWidget {
  const ColorSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText("Color", fontSize: 14, color: Colors.grey),

          SizedBox(
            height: 35,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: colorHex.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(int.parse(colorHex[index])),
                  ),
                );
              }, separatorBuilder: (BuildContext context, int index) { return Gap(8); },
            ),
          ),


          CustomText("Size", fontSize: 14, color: Colors.grey),
          SizedBox(
            height: 35,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: sizes.length,
              itemBuilder: (context, index) {
                return Container(

                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle ,
                    color: Colors.grey.withValues(alpha: .1)

                  ),
                  child: Center(child: CustomText(sizes[index])),
                );
              }, separatorBuilder: (BuildContext context, int index) { return Gap(8); },
            ),
          ),
        ],
      ),
    );
  }
}
