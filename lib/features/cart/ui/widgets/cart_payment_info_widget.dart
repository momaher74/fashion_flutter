import 'package:animate_do/animate_do.dart';
import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:fashion_flutter/features/cart/ui/manager/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/primary_button.dart';

class CartPaymentInfoWidget extends StatelessWidget {
  const CartPaymentInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.cartModel == null) {
          return const SizedBox.shrink();
        }

        final total = state.total;
        final currency = state.currency;
        final shipping = 30; // You can make this dynamic if needed

        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            boxShadow: const [
              BoxShadow(offset: Offset(0, -1), color: Colors.grey),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                    AppLocalizations.cart.productPrice,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  const Spacer(),
                  CustomText("$total $currency", fontSize: 14),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(),
              ),
              Row(
                children: [
                  CustomText(
                    AppLocalizations.cart.shipping,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  const Spacer(),
                  CustomText("$shipping $currency", fontSize: 14),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(),
              ),
              Row(
                children: [
                  CustomText(AppLocalizations.cart.subtotal, fontSize: 14),
                  const Spacer(),
                  CustomText("${total + shipping} $currency", fontSize: 14),
                ],
              ),
              const Gap(10),
              FadeInUpBig(
                duration: const Duration(milliseconds: 800),
                child: state.hasItems
                    ? PrimaryButton(
                        title: AppLocalizations.cart.checkout,
                        onTap: () {
                          context.pushNamed(myAddressesView);
                        },
                      )
                    : Opacity(
                        opacity: 0.5,
                        child: PrimaryButton(
                          title: AppLocalizations.cart.checkout,
                          onTap: () {},
                        ),
                      ),
              ),
              const Gap(10),
            ],
          ),
        );
      },
    );
  }
}
