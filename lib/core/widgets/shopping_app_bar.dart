import 'package:flutter/material.dart';

import '../services/constants.dart';
import 'custom_text_widget.dart';
import 'shared_back_button.dart';

class ShoppingAppBar extends StatelessWidget {
  const ShoppingAppBar({super.key, required this.title});
  final String title ;

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SharedBackButton(),
          ),
          CustomText(
           title,
            fontSize: size18,
            fontWeight: bold,
          ),
        ],
      ),
    );
  }
}
