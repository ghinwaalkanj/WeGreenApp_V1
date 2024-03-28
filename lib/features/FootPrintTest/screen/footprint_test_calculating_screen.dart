import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/FootPrintTest/screen/footprint_test_result_screen.dart';

import '../../../common_widgets/bg.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/image_strings.dart';

class FootPrintTestCalculating extends StatefulWidget {
  const FootPrintTestCalculating({super.key});

  @override
  State<FootPrintTestCalculating> createState() => _FootPrintTestCalculatingState();
}

class _FootPrintTestCalculatingState extends State<FootPrintTestCalculating> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.to(FootPrintTestResultScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          bg(),
          Transform.scale(
            scale: 2.5,
            origin: Offset(0, 23.h),
            child: Image.asset(AppImages.leaves),
          ),
          Image(
            height: 15.h,
            width: 15.h,
            image: AssetImage(
              AppImages.appLogo,
            ),
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 32.h,
            left: 17.w,
            right: 17.w,
            child: Text(
              textAlign: TextAlign.center,
              "Calculating Your Carbon Footprint ....",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                  color: AppColor.ink,
                shadows: [
                  Shadow(
                    color:AppColor.darkGrey,
                    offset: Offset(3, 3),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
