import 'package:flutter/material.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/shared_back_button.dart';

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
