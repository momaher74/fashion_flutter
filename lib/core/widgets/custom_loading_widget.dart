import 'package:fashion_flutter/core/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key,  this.size = 30});
   final double size ;
  @override
  Widget build(BuildContext context) {


    return Center(
      child: SpinKitWave(
        size: size ,
        duration: Duration(
          milliseconds: 700
        ),
        type: SpinKitWaveType.center,
        itemBuilder: (context, index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }
}
