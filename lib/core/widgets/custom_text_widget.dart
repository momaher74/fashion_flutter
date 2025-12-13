import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText(
    this.text, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final themeStyle = Theme.of(context).textTheme.bodySmall;

    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: themeStyle?.copyWith(
        fontSize: fontSize ?? themeStyle.fontSize,
        fontWeight: fontWeight ?? themeStyle.fontWeight,
        color: color ?? themeStyle.color,
      ),
    );
  }
}
