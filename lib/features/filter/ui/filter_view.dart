import 'package:fashion_flutter/core/widgets/custom_loading_widget.dart';
import 'package:fashion_flutter/core/widgets/shared_gridview.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/filter/ui/manager/filter_cubit.dart';
import 'package:fashion_flutter/features/filter/ui/manager/filter_state.dart';
import 'package:fashion_flutter/features/filter/ui/widgets/filter_bottomsheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../core/models/filter_argument_model.dart';
import '../../../core/services/locator.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key, required this.filterArgumentModel});
  final FilterArgumentModel filterArgumentModel;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  late final FilterCubit cubit;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    cubit = getIt<FilterCubit>();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Initialize with arguments and fetch data
    cubit.initializeWithArguments(widget.filterArgumentModel);
    cubit.fetchOptions();
    cubit.fetchProducts();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      cubit.fetchProducts(loadMore: true);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BlocBuilder<FilterCubit, FilterState>(
            builder: (context, state) {
              return SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(70),
                    ShoppingAppBar(title: "Filter", showBackButton: true ,horizontal: 0,),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Found \n${state.totalResults} Results",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Gap(10),
                        IconButton(
                          onPressed: () {
                            showFilterBottomSheet(context, cubit);
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

                    // Show loading on first load
                    if (state.isLoadProducts)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: CustomLoadingWidget(),
                        ),
                      )
                    else if (state.productsErrorMessage != null)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text(
                            state.productsErrorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    else if (state.allProducts.isEmpty)
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text(
                            "No products found",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                    else
                      Column(
                        children: [
                          SharedProductsGridView(
                            gridProducts: state.allProducts,
                            ratio: .65, onTap: () {  },
                          ),

                          // Loading more indicator
                          if (state.isLoadingMore)
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(child: CustomLoadingWidget()),
                            ),

                          // No more products indicator
                          if (!state.hasMoreProducts &&
                              state.allProducts.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(
                                child: Text(
                                  "No more products",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                        ],
                      ),

                    const Gap(20),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
