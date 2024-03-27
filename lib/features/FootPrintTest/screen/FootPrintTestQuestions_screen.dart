import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/features/FootPrintTest/screen/widget/fottprint_dot_navigation.dart';
import '../../../core/constant/image_strings.dart';
import '../controller/FootPrintTest_controller.dart';

class FootPrintTestQuestionsScreen extends StatelessWidget {
  const FootPrintTestQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FootPrintTestControllerImp());

    return Scaffold(
      body: Container(
        height: 100.h,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.white,
              AppColor.beige,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.scale(
              scale: 2.5,
              origin: Offset(0, 23.h),
              child: Image.asset(AppImages.leaves),
            ),
            Positioned(
              top: 15.h,
              child: Text(
                'Carbon FootPrint Test',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  color: AppColor.ink,
                    shadows: [
                Shadow(
                color:AppColor.darkGrey,
                    offset: Offset(3, 3),
                blurRadius: 10,
              ),]
                ),
                textAlign: TextAlign.center,
              ),
            ),
            FottPrintDotNavigation(),
            Row(children: [
            ],),
          ],
        ),
      ),
    );
  }
}
