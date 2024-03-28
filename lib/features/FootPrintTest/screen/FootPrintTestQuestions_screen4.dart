import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import '../../../core/constant/image_strings.dart';
import '../../../navigation_menu.dart';
import '../controller/FootPrintTest_controller.dart';

class FootPrintTestQuestionsScreen4 extends StatelessWidget {
  const FootPrintTestQuestionsScreen4({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FootPrintTestControllerImp());

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          Get.to(NavigationMenu());
        },
        child: Container(
          height: 100.h,
          child: Image.asset(AppImages.test4),
        ),
      ),
    );
  }
}
