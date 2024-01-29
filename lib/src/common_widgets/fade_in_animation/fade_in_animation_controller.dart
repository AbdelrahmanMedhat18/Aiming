import 'package:get/get.dart';

import '../../features/authentication/screens/welcome/welcome_screen.dart';

class FadeInAnimationController extends GetxController{

  static FadeInAnimationController get find => Get.find();
  RxBool animate = false.obs;
  Future startAnimation() async{
    await Future.delayed(Duration(seconds: 10),);
    animate.value = true;
    await Future.delayed(Duration(seconds: 10),);
    // Get.offAll(WelcomeScreen());
  }
}