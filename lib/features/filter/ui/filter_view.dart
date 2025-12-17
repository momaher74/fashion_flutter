import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/shared_back_button.dart';
import 'package:fashion_flutter/core/widgets/shared_gridview.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/filter/ui/widgets/filter_bottomsheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../core/services/constants.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(60),
              Row(
                children: [
                  Expanded(child: ShoppingAppBar(title: "Clothes", horizontal: 0)),
                  GestureDetector(
                    onTap: () {
                      showFilterBottomSheet(context);
                    },
                    child: Icon(PhosphorIcons.funnel(), size: 30),
                  ),
                ],
              ),
              const Gap(20),
              const Text(
                "Found \n152 Results",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Gap(20),
              SharedProductsGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
