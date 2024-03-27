import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class FootPrintTestController extends GetxController {

}

class FootPrintTestControllerImp extends FootPrintTestController {


  PageController pageController = PageController();
  int currentPage = 0;


  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
