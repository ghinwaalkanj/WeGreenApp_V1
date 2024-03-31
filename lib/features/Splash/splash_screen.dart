import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/navigation_menu.dart';
import '../../../core/services/services.dart';
import '../../core/constant/color.dart';
import '../../core/constant/image_strings.dart';
import '../onboarding/screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MyServices myServices = Get.find();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      myServices.sharedPreferences.getString("token") ==  null
          ? Get.to(OnBoardingScreen())
          : Get.offAll(NavigationMenu());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 100.h,
            width: 100.w,
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
          ),
          Positioned(
            bottom: 25.h,
            child: Image.asset(
              AppImages.splash,
              height: 50.h,
            ),
          ),
          Positioned(
            bottom: 31.h,
            child: Text(
              textAlign: TextAlign.center,
              'Lower Your Waste \n Protect Our Tomorrows',
              style: TextStyle(
                fontFamily: 'DMSans',
                fontSize: 12.sp,
                color: Colors.black45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
