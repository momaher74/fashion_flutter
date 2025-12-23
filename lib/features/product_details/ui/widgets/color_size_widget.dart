import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/features/product_details/ui/manager/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/app_localizations.dart';
import '../../../../core/widgets/custom_text_widget.dart';

class ColorSizeWidget extends StatelessWidget {
  const ColorSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubit>();
        final data = state.productDetailsModel?.data;

        if (data == null) return SizedBox.shrink();

        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Colors
              CustomText(
                AppLocalizations.product.color,
                fontSize: 14,
                color: Colors.grey,
              ),
              SizedBox(
                height: 65,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.colors.length,
                  itemBuilder: (context, index) {
                    final color = data.colors[index];
                    final isSelected = state.selectedColorId == color.id;
                    final isAvailable = cubit.isColorAvailable(color.id);

                    return GestureDetector(
                      onTap: () => cubit.selectColor(color.id),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(
                                int.parse(
                                  color.hexCode.replaceFirst('#', '0xFF'),
                                ),
                              ),
                              border: isSelected
                                  ? Border.all(color: Colors.black, width: 3)
                                  : null,
                            ),
                          ),
                   
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(12);
                  },
                ),
              ),

              // Sizes
              CustomText(
                AppLocalizations.product.size,
                fontSize: 14,
                color: Colors.grey,
              ),
              SizedBox(
                height: 65,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.sizes.length,
                  itemBuilder: (context, index) {
                    final size = data.sizes[index];
                    final isSelected = state.selectedSizeId == size.id;

                    return GestureDetector(
                      onTap: () => cubit.selectSize(size.id),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? Colors.black
                                  : Colors.grey.withValues(alpha: .1),
                            ),
                            child: Center(
                              child: CustomText(
                                size.name,
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 12,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                    
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Gap(12);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
