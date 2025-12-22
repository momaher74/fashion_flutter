// category_side_menu_dashboard.dart
import 'package:fashion_flutter/core/services/locator.dart';
import 'package:fashion_flutter/core/widgets/custom_loading_widget.dart';
import 'package:fashion_flutter/core/widgets/custome_error_widget.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/categories/view/widgets/category_sidebar_widget.dart';
import 'package:fashion_flutter/features/categories/view/widgets/subcategory_listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'manager/category_cubit.dart';
import 'manager/category_state.dart';

class CategorySideMenuDashboard extends StatefulWidget {
  const CategorySideMenuDashboard({super.key});

  @override
  State<CategorySideMenuDashboard> createState() =>
      _CategorySideMenuDashboardState();
}

class _CategorySideMenuDashboardState extends State<CategorySideMenuDashboard>
    with SingleTickerProviderStateMixin {
  String? selectedCategoryId;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onCategorySelected(String categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CategoryCubit>(),
      child: Scaffold(
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state.isLoading) return const CustomLoadingWidget();
            if (state.error != null) {
              return CustomErrorWidget(message: state.error!);
            }

            final categories = state.categories;
            if (categories.isEmpty) {
              return const Center(child: Text("No categories available"));
            }

            selectedCategoryId ??= categories.first.id;
            final selectedCategory = categories.firstWhere(
              (cat) => cat.id == selectedCategoryId,
            );

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    ShoppingAppBar(title: "Categories", showBackButton: false),
                    Gap(20),
                    Expanded(
                      child: Row(
                        children: [
                          CategorySidebar(
                            categories: categories,
                            selectedCategoryId: selectedCategoryId,
                            onCategorySelected: _onCategorySelected,
                          ),
                          Expanded(
                            child: FadeTransition(
                              opacity: _animationController,
                              child: SubcategoryList(
                                subCategories: selectedCategory.subCategories,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
