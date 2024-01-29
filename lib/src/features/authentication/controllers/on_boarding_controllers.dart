import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:newecommerce/src/constants/colors.dart';
import 'package:newecommerce/src/constants/text_strings.dart';

import '../../../constants/image_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_pages_widget.dart';

class OnBoardingController extends GetxController{
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages =[
    OnBoardingPage(
      model: OnBoardingModel(
        image: toOnboarding1,
        title: toOnboardingTitle1,
        subTitle: toOnboardingSubTitle1,
        counterText: toOnboardingCounter1,
        bgColor: toOnBoardingPage1Color,
      ),
    ),
    OnBoardingPage(
      model: OnBoardingModel(
        image: toOnboarding2,
        title: toOnboardingTitle2,
        subTitle: toOnboardingSubTitle2,
        counterText: toOnboardingCounter2,
        bgColor: toOnBoardingPage2Color,
      ),
    ),
    OnBoardingPage(
      model: OnBoardingModel(
        image: toOnboarding3,
        title: toOnboardingTitle3,
        subTitle: toOnboardingSubTitle3,
        counterText: toOnboardingCounter3,
        bgColor: toOnBoardingPage3Color,
      ),
    ),
  ];

  skip()=> controller.jumpToPage(page: 2);
  animateToNextSlide(){
    int nextPage = controller.currentPage +1;
    controller.animateToPage(page: nextPage);
  }
  onPageChangedCallback(int activePageIndex)=> currentPage.value = activePageIndex;

}