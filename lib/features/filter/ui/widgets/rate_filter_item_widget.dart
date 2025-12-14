// --- Custom Filter Item Widget ---
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RateFilterItem extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const RateFilterItem({
    super.key,
    required this.text,
    this.backgroundColor = Colors.grey,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.black , size: 12,),
          Gap(2),
          Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
