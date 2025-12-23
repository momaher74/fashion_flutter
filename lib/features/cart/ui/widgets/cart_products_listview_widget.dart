import 'package:animate_do/animate_do.dart';
import 'package:fashion_flutter/core/widgets/custom_loading_widget.dart';
import 'package:fashion_flutter/features/cart/ui/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/widgets/cached_network_image.dart';
import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/services/constants.dart';

class CartProductsListviewWidget extends StatelessWidget {
  const CartProductsListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.cartModel == null || !state.hasItems) {
          return const SizedBox.shrink();
        }

        final items = state.cartModel!.data.items;

        return Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final product = item.product;

                  return Dismissible(
                    key: Key(item.id),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      context.read<CartCubit>().removeFromCart(itemId: item.id);
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: .2),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          CustomCachedImage(
                            imageUrl: product.images.isNotEmpty
                                ? product.images.last
                                : '',
                            width: 100,
                            height: 140,
                            fit: BoxFit.cover,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          const Gap(20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  product.name,
                                  fontWeight: bold,
                                  fontSize: 13,
                                ),
                                const Gap(10),
                                CustomText(
                                  "${product.finalPrice} ${product.currency}",
                                  fontWeight: bold,
                                  fontSize: 13,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomText(
                                        "Size: ${item.size}  |  Color: ${item.color}",
                                        color: Colors.grey,
                                        fontSize: 11,
                                      ),
                                    ),
                                    Swing(
                                      animate: true,
                                      delay: const Duration(milliseconds: 300),
                                      duration: const Duration(
                                        milliseconds: 800,
                                      ),
                                      child: Container(
                                        width: 55.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: item.quantity > 1
                                                  ? () {
                                                      context
                                                          .read<CartCubit>()
                                                          .updateCartItem(
                                                            itemId: item.id,
                                                            quantity:
                                                                item.quantity -
                                                                1,
                                                          );
                                                    }
                                                  : () {
                                                      context
                                                          .read<CartCubit>()
                                                          .removeFromCart(
                                                            itemId: item.id,
                                                          );
                                                    },
                                              child: Icon(
                                                item.quantity > 1
                                                    ? Icons.remove
                                                    : Icons.delete,
                                                color: item.quantity > 1
                                                    ? Colors.grey
                                                    : Colors.red,
                                                    size :item.quantity > 1 ? 20 : 20 ,
                                              ),
                                            ),
                                            CustomText("${item.quantity}"),
                                            GestureDetector(
                                              onTap: () {
                                                context
                                                    .read<CartCubit>()
                                                    .updateCartItem(
                                                      itemId: item.id,
                                                      quantity:
                                                          item.quantity + 1,
                                                    );
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Gap(5),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Gap(10);
                },
              ),

              if (state.isUpdating) const CustomLoadingWidget(size: 35),
            ],
          ),
        );
      },
    );
  }
}
