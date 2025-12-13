import 'package:fashion_flutter/core/services/constants.dart';
import 'package:flutter/material.dart';

class CollecationContainer extends StatelessWidget {
  const CollecationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background container
        Container(
          width: double.infinity,
          height: 190,
          color: Colors.blueGrey.withOpacity(0.1),
        ),

        // Circle positioned on the right, vertically centered
        Positioned(
          right: 15,
          top: 0,
          bottom: 0,
          child: Center(
            child: Container(
              width: 160,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xffE2E2E2),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),

        Positioned(
          right: 30,
          top: 0,
          bottom: 0,
          child: Center(
            child: Container(
              width: 130,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),



          Positioned(
          right: 45,
          top: 0,
          bottom: 0,
          child: Center(
            child: Container(
              width: 90,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(productImages[2]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
