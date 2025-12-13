import 'package:flutter/material.dart';

import '../services/constants.dart';

class SharedBackButton extends StatelessWidget {
  const SharedBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      width: 60,
      height: 60,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: CircleBorder(),
        child: Center(
          child: Icon(Icons.arrow_back_ios, size: size20),
        ),
      ),
    );
  }
}
