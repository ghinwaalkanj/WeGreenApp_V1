import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import '../../../core/constant/image_strings.dart';
import '../../../navigation_menu.dart';
import 'FootPrintTestQuestions_screen.dart';

class FootPrintTestScreen extends StatelessWidget {
  const FootPrintTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              top: 17.h,
              child: Image.asset(
                AppImages.howbig,
                height: 12.h,
              ),
            ),
            Positioned(
              top: 35.h,
              child: Image.asset(
                AppImages.co2,
                height: 26.h,
              ),
            ),
            Positioned(
              top: 60.h,
              child: Image.asset(
                AppImages.co2text,
                height: 15.h,
              ),
            ),
            Positioned(
              top: 80.h,
              child: GestureDetector(

                onTap: (){
                  Get.to(const NavigationMenu());

                },
                child: Container(
                  alignment: Alignment.center,
                  height: 7.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                      color: AppColor.green,
                      borderRadius: BorderRadius.circular(25.sp)),
                  child: Text(
                    'START',
                    style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 89.h,
              child: GestureDetector(
                onTap: () {
                  Get.to(const NavigationMenu());
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 7.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(25.sp),
                      border: Border.all(color: Colors.black54, width: 0.3.w)),
                  child: Text(
                    'LATER',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
