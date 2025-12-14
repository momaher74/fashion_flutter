// --- Custom Filter Item Widget ---
import 'package:flutter/material.dart';

class FilterOptionItem extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const FilterOptionItem({
    super.key,
    required this.text,
    this.backgroundColor = Colors.grey,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
      ),
    );
  }
}
