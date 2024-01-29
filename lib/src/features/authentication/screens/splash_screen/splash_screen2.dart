import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:newecommerce/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen2 extends StatefulWidget {

  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplashScreen2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedSplashScreen(
            animationDuration: const Duration(
              seconds: 5,
            ),
            // backgroundColor: Colors.blueAccent,
            duration: 5000,
            splashIconSize: 300,
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.topToBottom,
            splash: Image.asset("assets/images/playstore.png"),
            nextScreen: const WelcomeScreen(),
          ),
          Container(
            margin: const EdgeInsets.only(top: 350),
            child: const Text(
              "Easy Shop",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
