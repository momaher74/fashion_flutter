import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../services/constants.dart';

class SharedBackButton extends StatelessWidget {
  const SharedBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pop();
      },
      child: SizedBox(
        width: 50,
        height: 50,
        child: Card(

          color: Colors.white,
          elevation: 5,
          shape: CircleBorder(),
          child: Center(child: Icon(Icons.arrow_back_ios, size: size16)),
        ),
      ),
    );
  }
}
