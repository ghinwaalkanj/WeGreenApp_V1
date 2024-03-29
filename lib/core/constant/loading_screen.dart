import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import '../../../core/constant/image_strings.dart';
import '../../../navigation_menu.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

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
              top: 35.h,
              child: Transform.scale(
                scale: 2,
                child: Image.asset(
                  AppImages.logo,
                  height: 35.h,
                ),
              ),
            ),
            Positioned(
              bottom: 28.h,
              child: Text(
                textAlign: TextAlign.center,
                'Loading ...',
                style: TextStyle(
                  color: AppColor.ink,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
