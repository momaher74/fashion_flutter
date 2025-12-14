import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_flutter/core/widgets/shared_back_button.dart';
import 'package:fashion_flutter/core/widgets/shared_favourite_button.dart';
import 'package:flutter/material.dart';

class ProductDetailsImageWidget extends StatelessWidget {
  const ProductDetailsImageWidget({super.key, required this.imageUrl, required this.isFavourite});
  final String imageUrl ;
  final bool isFavourite ;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 234,
                height: 234,
                decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: .4) ,
                    shape: BoxShape.circle
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: CachedNetworkImage(imageUrl: imageUrl, width:300 ,height: 500,),
              ),
            ],
          ),

          Positioned(
            top: 10,
            right: 0,
            left: 0,
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 15),
                child: Row(
                  children: [
                    SharedBackButton() ,
                    Spacer() ,
                    SharedFavouriteButton(isFavourite: isFavourite ,padding: 15,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ) ;
  }
}
