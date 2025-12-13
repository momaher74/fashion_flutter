import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    // Copy borderRadius to a local variable
    final BorderRadiusGeometry effectiveBorderRadius = borderRadius ?? BorderRadius.zero;

    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: effectiveBorderRadius,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: effectiveBorderRadius,
        ),
        child: const Icon(Icons.broken_image, color: Colors.grey),
      ),
    );

    // Wrap in ClipRRect only if borderRadius is provided
    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: image,
      );
    }

    return image;
  }
}
