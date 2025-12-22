import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/models/filter_argument_model.dart';
import '../../../../../core/models/product_model.dart';
import '../../../../../core/router/routes_names.dart';
import '../../../data/models/home_model.dart';

class BannerWidget extends StatefulWidget {
  final List<BannerModel> banners;

  const BannerWidget({super.key, required this.banners});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox();

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.banners.length,
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () {
                final b = widget.banners[_currentIndex];
                context.pushNamed(
                  filterView,
                  extra: FilterArgumentModel(
                    productId: b.productId,
                    categoryId: b.categoryId,
                    searchQuery: b.subCategoryId,
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomCachedImage(
                  imageUrl: widget.banners[index].image,
                  width: double.infinity,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 200,
            autoPlay: true,

            enlargeCenterPage: true,
            viewportFraction: .98,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),

        const SizedBox(height: 12),

        // Dots indicator
        DotsIndicator(
          dotsCount: widget.banners.length,
          position: _currentIndex.toDouble(),
          decorator: DotsDecorator(
            activeColor: Colors.deepPurple,
            size: const Size.square(8.0),
            activeSize: const Size(16.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
      ],
    );
  }
}
