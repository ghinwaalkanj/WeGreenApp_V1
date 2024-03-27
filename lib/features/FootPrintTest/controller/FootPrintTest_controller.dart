import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class FootPrintTestController extends GetxController {

}

class FootPrintTestControllerImp extends FootPrintTestController {


  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    if (currentPageIndex == 3) {

      //Get.offAll(const SignInScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }



  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
