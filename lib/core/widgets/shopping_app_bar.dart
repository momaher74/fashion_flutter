import 'package:flutter/material.dart';

import '../services/constants.dart';
import 'custom_text_widget.dart';
import 'shared_back_button.dart';

class ShoppingAppBar extends StatelessWidget {
  const ShoppingAppBar({
    super.key,
    required this.title,
    this.horizontal,
    this.showBackButton = true,
  });

  final String title;

  final double? horizontal;

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 20),
      child:showBackButton ? Stack(
        alignment: Alignment.center,
        children: [

            Align(alignment: Alignment.centerLeft, child: SharedBackButton()),
          CustomText(title, fontSize: size18, fontWeight: bold),
        ],
      ):Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CustomText(title, fontSize: size20, fontWeight: bold),
          ),

        ],
      ),
    );
  }
}
