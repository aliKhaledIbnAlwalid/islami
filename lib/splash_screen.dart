import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:islami/main.dart';
import 'package:lottie/lottie.dart';

class AnimatedSplashScreenWidget extends StatelessWidget {
  const AnimatedSplashScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(child: Lottie.asset('assets/animation_123.json')),
      animationDuration: const Duration(
        milliseconds: 2000,
      ), // Instead of 2 seconds
      splashIconSize: 500,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: const Color.fromARGB(255, 74, 23, 4),
      nextScreen: MyHomePage(title: 'Islami'),
    );
  }
}
