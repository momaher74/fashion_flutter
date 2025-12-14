import 'package:fashion_flutter/features/home/ui/view/home_view.dart';
import 'package:fashion_flutter/features/layout/ui/view/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // match your brand
      body: Center(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Lottie.asset(
            'assets/animations/fashion.json',
            repeat: false,
            fit: BoxFit.cover,
            onLoaded: (composition) {
              Future.delayed(composition.duration.inSeconds > 3 ? Duration(seconds: 3) : composition.duration, () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const LayoutView(),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
