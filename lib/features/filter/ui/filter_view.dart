import 'package:fashion_flutter/core/widgets/shared_gridview.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/filter/ui/widgets/filter_bottomsheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
              ShoppingAppBar(title: "Filter", showBackButton: false),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: const Text(
                      "Found \n152 Results",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Gap(10),
                  IconButton(
                    onPressed: () {
                      showFilterBottomSheet(context);
                    },
                    icon: Icon(
                      Icons.filter_list,
                      size: 28,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              SharedProductsGridView(ratio: .65),
            ],
          ),
        ),
      ),
    );
  }
}
