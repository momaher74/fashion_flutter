import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/features/discover/ui/manager/discover_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/services/constants.dart';

class RecentSearchWidget extends StatefulWidget {
  const RecentSearchWidget({super.key});

  @override
  State<RecentSearchWidget> createState() => _RecentSearchWidgetState();
}

class _RecentSearchWidgetState extends State<RecentSearchWidget> {
  @override
  void initState() {
    super.initState();
    context.read<DiscoverCubit>().getSearches();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      buildWhen: (old, current) => old.searches != current.searches,
      builder: (context, state) {
        if (state.searches.isEmpty) {
          return const Gap(20);
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    "Recent Searches",
                    fontWeight: bold,
                    fontSize: size16,
                    color: Colors.black,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.delete_rounded,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      context.read<DiscoverCubit>().clearAllSearches();
                    },
                  ),
                ],
              ),
              const Gap(8),
              Wrap(
                spacing: 8,      // horizontal spacing
                runSpacing: 8,   // vertical spacing
                children: List.generate(
                  state.searches.length,
                      (index) {
                    final search = state.searches[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // 👈 dynamic width
                        children: [
                          CustomText(
                            search,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            maxLines: 1,
                          ),
                          const Gap(6),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<DiscoverCubit>()
                                  .removeSearch(search);
                            },
                            child: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Gap(20),
            ],
          ),
        );
      },
    );
  }
}
