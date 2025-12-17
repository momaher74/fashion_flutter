import 'package:fashion_flutter/core/router/routes_names.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/primary_button.dart';
import 'package:fashion_flutter/core/widgets/shared_app_bar.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/orders/ui/widgets/rate_header_widget.dart';
import 'package:fashion_flutter/features/orders/ui/widgets/review_comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'widgets/rate_bar_secation_widget.dart';

class RateOrderView extends StatelessWidget {
  const RateOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: verticalSpace,
            children: [
              headerGap(),
              ShoppingAppBar(title: "Rate Order"),
              Gap(10),
              RateHeaderWidget(),
              Gap(20),
              RateBarSectionWidget(),
              ReviewCommentWidget(),
              Gap(40),
              PrimaryButton(
                title: "Submit Review",
                onTap: () {
                  context.pushReplacementNamed(layoutView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
