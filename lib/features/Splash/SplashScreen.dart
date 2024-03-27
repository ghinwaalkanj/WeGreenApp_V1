import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/services/services.dart';
import '../../common_widgets/bg.dart';
import '../../core/constant/color.dart';
import '../../core/constant/image_strings.dart';

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
    Timer(const Duration(seconds: 100), () {
      // myServices.sharedPreferences.getString("token") ==  null
      //     ? Get.to(OnboardingScreen())
      //     : Get.offAll(MainScreen());
      //
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
         bg(color2: AppColor.beige,color1: AppColor.white,),
          Container(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: 2,
              child: Image.asset(
                AppImages.logo,
                height: 50.h,
              ),
            ),
          ),
          Positioned(
            bottom: 36.h,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 30.sp,
                  letterSpacing: 1.5,
                ),
                children: const [
                  TextSpan(
                    text: 'We',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.green,
                    ),
                  ),
                  TextSpan(
                    text: 'Green',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 28.h,
            child: Text(
              textAlign: TextAlign.center,
              'Lower Your Waste \n Protect Our Tomorrows',
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColor.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
