import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:we_green_v1/features/Auth/sign_in/screens/sign_in_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    if (currentPageIndex == 3) {
      // final storage=GetStorage();
      // storage.write('isFirstTime', false);
      
      Get.offAll(const SignInScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentPageIndex.value = 3;
    pageController.jumpTo(3);
  }
}
