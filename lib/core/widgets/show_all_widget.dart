import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ShowAllWidget extends StatelessWidget {
  const ShowAllWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CustomText(title, fontSize: size20, fontWeight: bold),
          Spacer(),
          CustomText(
            "Show all",
            fontSize: size16,
            fontWeight: normal,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
