import 'package:flutter/material.dart';

class SelectableTile extends StatelessWidget {
  final String title;
  final String? trailing;
  final bool isSelected;
  final VoidCallback? onTap;

  const SelectableTile({
    super.key,
    required this.title,
    this.trailing,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.black : Colors.white, // Background color
      elevation: isSelected ? 3: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black, // Text color
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            fontSize: 12
          ),
        ),
        trailing: trailing != null
            ? Text(
          trailing!,
          style: TextStyle(

            color: isSelected ? Colors.white : Colors.black, // Text color
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        )
            : Icon(
          isSelected
              ? Icons.radio_button_checked
              : Icons.radio_button_off,
          color: isSelected ? Colors.white : Colors.black45, // Icon color
        ),
      ),
    );
  }
}
