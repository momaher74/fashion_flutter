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
    context.read<DiscoverCubit>().getSearches();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      buildWhen: (old, current) => old.searches != current.searches,
      builder: (context, state) {
        if (state.searches.isEmpty) {
          return Gap(20);
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CustomText(
                    "Recent Searches",
                    fontWeight: bold,
                    fontSize: size16,
                    color: Colors.black,
                  ),

                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.delete_rounded, color: Colors.red),
                    onPressed: () {
                      context.read<DiscoverCubit>().clearAllSearches();
                    },
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: state.searches.length,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(bottom:20 ),
                
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  childAspectRatio:5 ,
                  
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: CustomText(
                            state.searches[index],
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            maxLines: 1,

                            fontSize: 12,
                          ),
                        ),

                        GestureDetector(
                          onTap: () {
                            context.read<DiscoverCubit>().removeSearch(
                              state.searches[index],
                            );
                          },
                          child: Icon(Icons.close, color: Colors.white, size: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
