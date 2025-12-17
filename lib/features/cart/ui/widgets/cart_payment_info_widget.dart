import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_text_widget.dart';
import '../../../../core/widgets/primary_button.dart';

class CartPaymentInfoWidget extends StatelessWidget {
  const CartPaymentInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        boxShadow: [BoxShadow(offset: Offset(0, -1), color: Colors.grey)],
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
              Spacer(),
              CustomText("120", fontSize: 14),
            ],
          ),
          Padding(
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
              Spacer(),
              CustomText("30", fontSize: 14),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(),
          ),
          Row(
            children: [
              CustomText(AppLocalizations.cart.subtotal, fontSize: 14),
              Spacer(),
              CustomText("120", fontSize: 14),
            ],
          ),
          Gap(10),

          PrimaryButton(
            title: AppLocalizations.cart.checkout,
            onTap: () {
              context.pushNamed(myAddressesView);
            },
          ),
          Gap(10),
        ],
      ),
    );
  }
}
