import 'package:fashion_flutter/core/models/product_model.dart';
import 'package:fashion_flutter/core/services/constants.dart';
import 'package:fashion_flutter/core/widgets/show_all_widget.dart';
import 'package:fashion_flutter/features/home/ui/view/widgets/collecation_container.dart';
import 'package:flutter/material.dart';

class CollectionsListView extends StatelessWidget {
  const CollectionsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowAllWidget(title: "Collections"),

        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            final List<ProductModel> collections = [
              products[2],
              products[4],
            ];

            return Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: CollectionContainer(
                title: collections[index].name,
                subTitle: "Description",
                imageUrl: collections[index].imageUrl,
                marginPercentage: .01,
              ),
            );
          },
        ),
      ],
    );
  }
}
