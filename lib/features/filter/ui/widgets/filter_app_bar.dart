import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/constants.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/shared_back_button.dart';

class FilterAppBar extends StatelessWidget {
  const FilterAppBar({super.key, required this.title});
  final String title ;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SharedBackButton(),
        Gap(30),
        CustomText(title, fontWeight: bold, fontSize: size18),
      ],
    );
  }
}
