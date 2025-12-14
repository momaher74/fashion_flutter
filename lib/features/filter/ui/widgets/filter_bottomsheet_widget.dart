import 'package:fashion_flutter/features/filter/ui/widgets/rate_filter_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/constants.dart';
import 'color_filter_item_widget.dart';
import 'filter_item_widget.dart';

void showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Center(
                    child: const Text(
                      "Filter Options",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Gap(20),

                  // --- Sort Options ---
                  const Text(
                    "Sort By",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: sortOptions.map((option) {
                      return FilterOptionItem(
                        text: option,
                        backgroundColor: Colors.transparent,
                      );
                    }).toList(),
                  ),
                  const Gap(20),

                  // --- Sizes ---
                  const Text(
                    "Sizes",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: sizes.map((size) {
                      return FilterOptionItem(text: size);
                    }).toList(),
                  ),
                  const Gap(20),

                  const Text(
                    "Discounts",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: discountOptions.map((size) {
                      return FilterOptionItem(text: size);
                    }).toList(),
                  ),
                  const Gap(20),

                  // --- Colors ---
                  const Text(
                    "Colors",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: colorHex.map((hex) {
                      return FilterOptionColorItem(
                        color: Color(int.parse(hex)),
                      );
                    }).toList(),
                  ),
                  const Gap(20),

                  // --- Ratings ---
                  const Text(
                    "Ratings",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: rating.map((rate) {
                      return RateFilterItem(
                        text: "$rate",
                        backgroundColor: Colors.amber.shade100,
                        textColor: Colors.black87,
                      );
                    }).toList(),
                  ),
                  const Gap(30),

                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),

                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(double.infinity, 60),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.black
                        ),
                        child: const Text(
                          "Apply Filters",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}



