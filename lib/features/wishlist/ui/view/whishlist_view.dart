import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/custom_loading_widget.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/custome_error_widget.dart';
import 'package:fashion_flutter/features/wishlist/ui/manager/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/no_products_widget.dart';
import '../../../../core/widgets/product_item_widget.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WishlistCubit()..fetchProducts(),
      child: Scaffold(
        body: BlocBuilder<WishlistCubit, WishlistState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const CustomLoadingWidget();
            }

            if (state.error != null) {
              return CustomErrorWidget(message: state.error!);
            }

            return Column(
              children: [
                headerGap(),
                CustomText("wishlist", fontWeight: bold, fontSize: size18),
                Gap(30),

                if (state.products.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 300),
                      child: EmptyStateWidget(),
                    ),
                  ),

                if (state.products.isEmpty)
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: state.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .75,
                        mainAxisSpacing: 30,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final p = state.products[index];
                        return ProductItem(
                          product: p,
                          isGrid: true,
                          onTap: () {
                            context.read<WishlistCubit>().toggle(
                              productId: p.id,
                            );
                          },
                        );
                      },
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
