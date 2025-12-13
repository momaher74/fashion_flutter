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
      spacing: 20,
      children: [
        ShowAllWidget(title: "Collections"),

        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final List<ProductModel> collections = products.sublist(1, 3);

            return CollecationContainer(
              title: collections[index].name, 
              subTitle: collections[index].description,
              imageUrl: collections[index].imageUrl,
            );    
          },
        ),
      ],
    );
  }
}
