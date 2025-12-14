import 'package:flutter/material.dart';

import '../services/constants.dart';
import 'custom_text_widget.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.title});
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8) ,
          color: Colors.black ,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -1)
            )
          ]
      ),
      child: Center(child: CustomText(title ,color: Colors.white, fontWeight: bold, fontSize: size16,)),
    ) ;
  }
}
