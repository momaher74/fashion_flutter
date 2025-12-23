import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:fashion_flutter/features/product_details/ui/manager/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductAllImagesListView extends StatelessWidget {
  const ProductAllImagesListView({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      buildWhen: (previous, current) =>
          previous.selectedImageIndex != current.selectedImageIndex,
      builder: (context, state) {
        final selectedIndex = state.selectedImageIndex ;
        final prodImgs = state.productDetailsModel!.data.images;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: SizedBox(
            height: 60,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(prodImgs.length, (index) {
                  final img = prodImgs[index];
                  final isSelected = index == selectedIndex;

                  return GestureDetector(
                    onTap: () {
                      context
                          .read<ProductDetailsCubit>()
                          .selectBackgroundImage(
                            selectedIndex: index,
                          );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 7,
                      ),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: isSelected
                              ? Colors.black
                              : Colors.grey.withOpacity(0.5),
                          width: isSelected ? 2 : 1,
                        ),
                      ),
                      child: CustomCachedImage(
                        imageUrl: img,
                        width: 40,
                        height: 50,
                        fit: BoxFit.fitHeight,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        );
      },
    );
  }
}
