import 'package:fashion_flutter/core/widgets/custom_loading_widget.dart';
import 'package:fashion_flutter/core/widgets/shared_app_bar.dart';
import 'package:fashion_flutter/core/widgets/shopping_app_bar.dart';
import 'package:fashion_flutter/features/discover/ui/manager/discover_cubit.dart';
import 'package:fashion_flutter/features/discover/ui/view/widgets/recent_search_widget.dart';
import 'package:fashion_flutter/features/discover/ui/view/widgets/results_listview.dart';
import 'package:fashion_flutter/features/discover/ui/view/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DiscoverView extends StatefulWidget {
  const DiscoverView({super.key});

  @override
  State<DiscoverView> createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  int page = 1;
  final int limit = 10;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Add scroll listener for pagination
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !context.read<DiscoverCubit>().state.isLoading) {
        // Load next page
        page++;
        context.read<DiscoverCubit>().search(
          q: {"search": "", "page": page, "limit": limit},
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiscoverCubit>(
      create: (context) => DiscoverCubit(),
      child: Scaffold(
        body: BlocListener<DiscoverCubit, DiscoverState>(
          listener: (context, state) {
            // Optional: you can show a toast or snack bar for errors
            if (state.error != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.error!)));
            }
          },
          child: BlocBuilder<DiscoverCubit, DiscoverState>(
            builder: (context, state) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(60),
                        const ShoppingAppBar(title: "Discover" ,showBackButton: false,),
                        Gap(20) ,
                        SearchFieldWidget(
                          onSearch: (String value) {
                            page = 1; // reset page on new search
                            context.read<DiscoverCubit>().search(
                              q: {
                                "search": value,
                                "page": page,
                                "limit": limit,
                              },
                            );
                          },
                        ),
                        const RecentSearchWidget(),
                        ResultsListview(),
                        if (state.isLoading)
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(child: CircularProgressIndicator()),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
