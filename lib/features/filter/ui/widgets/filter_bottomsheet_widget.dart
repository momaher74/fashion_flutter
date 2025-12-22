import 'package:fashion_flutter/core/widgets/custom_loading_widget.dart';
import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/features/filter/ui/manager/filter_cubit.dart';
import 'package:fashion_flutter/features/filter/ui/manager/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../data/models/filter_options.dart';
import 'color_filter_item_widget.dart';
import 'filter_item_widget.dart';

void showFilterBottomSheet(BuildContext context, FilterCubit cubit) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return BlocProvider.value(
        value: cubit,
        child: DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return BlocBuilder<FilterCubit, FilterState>(
              builder: (context, state) {
                if (state.isLoadOptions) {
                  return CustomLoadingWidget();
                }

                if (state.filterOptionsModel == null) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Center(child: Text("Unable to load filter options")),
                  );
                }

                final FilterOptionsData data = state.filterOptionsModel!.data;

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Drag handle
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
                      const Gap(10),

                      // Header with clear button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Filter Options",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),

                      // Scrollable content
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // --- Sort Options ---
                              const Text(
                                "Sort By",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const Gap(10),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: data.sortOptions.map((option) {
                                  final isSelected =
                                      state.selectedSortBy == option.value;
                                  return FilterOptionItem(
                                    text: option.label,
                                    isSelected: isSelected,
                                    onTap: () =>
                                        cubit.toggleSortBy(option.value),
                                  );
                                }).toList(),
                              ),
                              const Gap(20),

                              // --- Categories ---
                              if (data.categories.isNotEmpty) ...[
                                const Text(
                                  "Categories",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Gap(10),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: data.categories.map((category) {
                                    final isSelected = state.selectedCategoryIds
                                        .contains(category.id);
                                    return FilterOptionItem(
                                      text: category.name,
                                      isSelected: isSelected,
                                      onTap: () =>
                                          cubit.toggleCategory(category.id),
                                    );
                                  }).toList(),
                                ),
                                const Gap(20),
                              ],

                              // --- SubCategories ---
                              if (data.subCategories.isNotEmpty) ...[
                                const Text(
                                  "Sub Categories",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Gap(10),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: data.subCategories.map((
                                    subCategory,
                                  ) {
                                    final isSelected = state
                                        .selectedSubCategoryIds
                                        .contains(subCategory.id);
                                    return FilterOptionItem(
                                      text: subCategory.name,
                                      isSelected: isSelected,
                                      onTap: () => cubit.toggleSubCategory(
                                        subCategory.id,
                                      ),
                                    );
                                  }).toList(),
                                ),
                                const Gap(20),
                              ],

                              // --- Sizes ---
                              if (data.sizes.isNotEmpty) ...[
                                const Text(
                                  "Sizes",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Gap(10),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: data.sizes.map((size) {
                                    final isSelected = state.selectedSizeIds
                                        .contains(size.id);
                                    return FilterOptionItem(
                                      text: size.name,
                                      isSelected: isSelected,
                                      onTap: () => cubit.toggleSize(size.id),
                                    );
                                  }).toList(),
                                ),
                                const Gap(20),
                              ],

                              // --- Colors ---
                              if (data.colors.isNotEmpty) ...[
                                const Text(
                                  "Colors",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Gap(10),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: data.colors.map((c) {
                                    final isSelected = state.selectedColorIds
                                        .contains(c.id);
                                    return FilterOptionColorItem(
                                      color: Color(
                                        int.parse(
                                          c.hexCode.replaceAll("#", "0xff"),
                                        ),
                                      ),
                                      isSelected: isSelected,
                                      onTap: () => cubit.toggleColor(c.id),
                                    );
                                  }).toList(),
                                ),
                                const Gap(20),
                              ],

                              // --- Discounts ---
                              if (data.discounts.isNotEmpty) ...[
                                const Text(
                                  "Discounts",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const Gap(10),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: data.discounts.map((discount) {
                                    final isSelected = state.selectedOfferIds
                                        .contains(discount.id);
                                    return FilterOptionItem(
                                      text: discount.title,
                                      isSelected: isSelected,
                                      onTap: () =>
                                          cubit.toggleOffer(discount.id),
                                    );
                                  }).toList(),
                                ),
                                const Gap(20),
                              ],

                              const Gap(10),
                            ],
                          ),
                        ),
                      ),

                      // Apply button
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  cubit.applyFilters();
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(double.infinity, 60),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 15,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                                child: const Text(
                                  "Apply Filters",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              cubit.clearAllFilters();
                            },
                            child: Container(
                              height: 55,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: CustomText(
                                  "Clear All",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const Gap(10),
                        ],
                      ),
                      const Gap(10),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );
    },
  );
}
