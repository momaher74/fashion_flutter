import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/services/constants.dart';

class RecentSearchWidget extends StatelessWidget {
  const RecentSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                color: Colors.grey,
              ),

              Spacer(),
              Icon(Icons.delete_rounded, color: Colors.grey),
            ],
          ),
          Gap(15),
          GridView.builder(
            shrinkWrap: true,
            itemCount: recentSearch.length,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
                childAspectRatio: 3.5
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: .05),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(recentSearch[index], color: Colors.black , fontWeight: FontWeight.w600,fontSize: 12,),
                    Spacer(), 
                    Icon(Icons.close , color: Colors.grey,)
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
