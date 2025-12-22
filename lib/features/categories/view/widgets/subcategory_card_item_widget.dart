import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/features/categories/data/model/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/constants.dart';

class SubcategoryCard extends StatelessWidget {
  final SubCategoryModel subCategory;
  final VoidCallback onTap;

  const SubcategoryCard({
    super.key,
    required this.subCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: CustomCachedImage(
                      imageUrl: subCategory.image,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Dark overlay
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),

                  // Subcategory name at bottom left
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Text(
                      subCategory.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.black26,
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
