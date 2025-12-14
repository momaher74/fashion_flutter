import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/features/product_details/ui/widgets/reviews_listview_widget.dart';
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Divider(),
          CustomText("Description", fontWeight: bold, fontSize: size16),
          CustomText(description, fontSize: 12),
          Divider(),
          CustomText("Reviews", fontWeight: bold, fontSize: size16),
          ReviewsListviewWidget(),
        ],
      ),
    );
  }
}
