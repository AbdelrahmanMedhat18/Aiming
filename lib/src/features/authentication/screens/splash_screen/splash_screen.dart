import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newecommerce/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:newecommerce/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:newecommerce/src/constants/image_strings.dart';
import 'package:newecommerce/src/constants/sizes.dart';
import 'package:newecommerce/src/constants/text_strings.dart';
import 'package:newecommerce/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {
   const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
              TFadeinAnimation(
                durationInMs: 1600,
                animate: TAnimatePosition(
                  topAfter: 0,topBefore: -30,leftBefore: -30,leftAfter: 0,
                ),
                child: const Image(image: AssetImage(tSplashTopIcon),height: 100,width: 100,),
              ),
            TFadeinAnimation(
              durationInMs: 200,
              animate: TAnimatePosition(topBefore: 80,topAfter: 80,leftAfter: tDefaultSize,leftBefore: -80),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tAppName,style: Theme.of(context).textTheme.displaySmall,),
                          Text(tAppTagLine,style: Theme.of(context).textTheme.displayMedium,),
                        ],
                      ),
                    ),
            TFadeinAnimation(
              durationInMs: 2400,
              animate: TAnimatePosition(bottomBefore: 0,bottomAfter: 100),
                    child: const Image(
                      image: AssetImage("assets/images/image2.jpg"),height: 400,width: 400,
                    ),
                  ),
            TFadeinAnimation(
              durationInMs: 2400,
              animate: TAnimatePosition(bottomBefore: 0,bottomAfter: 60,rightBefore: tDefaultSize,rightAfter: tDefaultSize),
                    child: Container(
                      width: tSplashContainerSize,
                      height: tSplashContainerSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
