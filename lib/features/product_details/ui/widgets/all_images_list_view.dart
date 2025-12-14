import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductAllImagesListView extends StatelessWidget {
  const ProductAllImagesListView({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // <-- CENTER
            children: images.map((img) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                ),
                child: CustomCachedImage(
                  imageUrl: img,
                  width: 40,height: 50,
                  fit: BoxFit.fitHeight,
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
