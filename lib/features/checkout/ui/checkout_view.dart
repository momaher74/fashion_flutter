import 'package:fashion_flutter/core/services/constants.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Column(
        spacing: verticalSpace ,
        children: [
          headerGap() ,


        ],
      ) ,
    );
  }
}