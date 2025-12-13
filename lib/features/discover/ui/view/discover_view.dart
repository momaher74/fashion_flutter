import 'package:fashion_flutter/core/widgets/custom_text_widget.dart';
import 'package:fashion_flutter/core/widgets/shared_app_bar.dart';
import 'package:fashion_flutter/core/widgets/show_all_widget.dart';
import 'package:fashion_flutter/features/discover/ui/view/widgets/recent_search_widget.dart';
import 'package:fashion_flutter/features/discover/ui/view/widgets/results_listview.dart';
import 'package:fashion_flutter/features/discover/ui/view/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/services/constants.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Gap(60),
          SharedAppBar(title: "Discover"),
          SearchFieldWidget(),
          RecentSearchWidget(),
          ShowAllWidget(title: "Popular"),
          Expanded(child: ResultsListview()),
        ],
      ),
    );
  }
}
