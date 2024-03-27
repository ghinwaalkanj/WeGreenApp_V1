import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class FootPrintTestController extends GetxController {

}

class FootPrintTestControllerImp extends FootPrintTestController {


  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;


  void nextPage() {
    if (currentPageIndex == 3) {
      //Get.offAll(const SignInScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  void previousPage() {
    if (currentPageIndex == 3) {
      //Get.offAll(const SignInScreen());
    } else {
      int page = currentPageIndex.value - 1;
      pageController.jumpToPage(page);
    }
  }

}
