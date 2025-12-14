import 'package:fashion_flutter/core/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductAllImagesListView extends StatelessWidget {
  const ProductAllImagesListView({super.key, required this.images});
  final List<String> images ;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: SizedBox(


        width: double.infinity,
        height: 80,
        child: ListView.builder(
            itemCount:images.length ,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index ){
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10 ,vertical: 7),

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12) ,

                      border: Border.all(
                          color: Colors.grey
                      )

                  ),
                  child: CustomCachedImage(imageUrl: images[index] , borderRadius: BorderRadius.circular(12),  ));
            }),
      ),
    );
  }
}
