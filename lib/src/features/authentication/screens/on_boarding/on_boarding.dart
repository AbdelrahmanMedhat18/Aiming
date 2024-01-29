import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:newecommerce/src/features/authentication/controllers/on_boarding_controllers.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final obcontroller = OnBoardingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: obcontroller.pages,
            liquidController: obcontroller.controller,
            onPageChangeCallback: obcontroller.onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60,
              child: OutlinedButton(
                onPressed: ()=>obcontroller.animateToNextSlide(),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, side: const BorderSide(color: Colors.black26),
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ), child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Color(0xff272727), shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
              ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child:TextButton(
              onPressed: ()=> obcontroller.skip(),
              child: const Text("Skip" , style: TextStyle(color: Colors.black),),
            ),
          ),
          Obx(
            ()=> Positioned(
              bottom: 10,
              child: AnimatedSmoothIndicator(
                effect: const WormEffect(
                  activeDotColor: Color(0xff272727),
                  dotHeight: 5,
                ),
                activeIndex: obcontroller.currentPage.value,
                count: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }


}
