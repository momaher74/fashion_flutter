import 'package:flutter/material.dart';

import '../services/constants.dart';

class SharedFavouriteButton extends StatelessWidget {
  const SharedFavouriteButton({super.key, required this.isFavourite,  this.padding =6});
 final bool isFavourite ;
 final double padding ;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: CircleBorder(),

      child: Center(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Icon(
            isFavourite
                ? Icons.favorite
                : Icons.favorite_border,
            size: size20,
            color: isFavourite ? Colors.red : Colors.grey,
          ),
        ),
      ),
    );
  }
}
