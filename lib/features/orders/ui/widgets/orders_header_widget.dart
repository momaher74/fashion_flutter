import 'package:fashion_flutter/core/services/app_localizations.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_text_widget.dart';

class OrdersHeaderWidget extends StatelessWidget {
  const OrdersHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomText(
            AppLocalizations.orders.pending,
            textAlign: TextAlign.center,
            fontSize: size14,
            fontWeight: bold,
          ),
        ),
        Expanded(
          child: CustomText(
            AppLocalizations.orders.delivered,
            textAlign: TextAlign.center,
            fontSize: size14,
            fontWeight: bold,
          ),
        ),
        Expanded(
          child: CustomText(
            AppLocalizations.orders.cancelled,
            textAlign: TextAlign.center,
            fontSize: size14,
            fontWeight: bold,
          ),
        ),
      ],
    );
  }
}
