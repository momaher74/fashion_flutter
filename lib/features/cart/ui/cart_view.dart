import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:fashion_flutter/features/cart/ui/manager/cart_cubit.dart';
import 'package:fashion_flutter/features/cart/ui/widgets/cart_payment_info_widget.dart';
import 'package:fashion_flutter/features/cart/ui/widgets/cart_products_listview_widget.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..fetchCart(),
      child: Scaffold(
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Skeletonizer(
              enabled: state.isLoading,
              enableSwitchAnimation: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(60),
                  ShoppingAppBar(
                    title: AppLocalizations.cart.myCart,
                    horizontal: 10,
                    showBackButton: false,
                  ),
                  const Gap(20),

                  // Show error if any
                  if (state.error != null)
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        state.error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                  // Show empty state or cart items
                  if (state.cartModel == null || !state.hasItems)
                    const Expanded(
                      child: Center(child: Text('Your cart is empty')),
                    )
                  else ...[
                    const CartProductsListviewWidget(),
                    const CartPaymentInfoWidget(),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
