import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../constants/image_strings.dart';
import 'fade_in_animation_controller.dart';
import 'fade_in_animation_model.dart';

class TFadeinAnimation extends StatelessWidget {
   TFadeinAnimation({
    super.key,
     required this.durationInMs,
     this.animate,
     required this.child,
  });

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final TAnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> AnimatedPositioned(
        duration: Duration(milliseconds: durationInMs),
        top: controller.animate.value ? animate!.topAfter:animate!.topBefore,
        left: controller.animate.value ? animate!.leftAfter:animate!.leftBefore,
        bottom: controller.animate.value ? animate!.bottomAfter:animate!.bottomBefore,
        right: controller.animate.value ? animate!.rightAfter:animate!.rightBefore,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: durationInMs),
          opacity: controller.animate.value?1:0,
          child: child,
        ),
      ),
    );
  }
}
