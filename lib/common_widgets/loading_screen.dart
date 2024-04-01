import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import '../../core/constant/image_strings.dart';
import 'package:lottie/lottie.dart';

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
              top: 46.h,
              child: Transform.scale(
                scale: 2,
                child: Column(
                  children: [
                    Lottie.asset(
                      AppImages.loading,
                      height: 6.h,
                    ),
                    SizedBox(height: 1.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Loading',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            color: AppColor.ink,
                            fontWeight: FontWeight.bold,
                            fontSize: 7.sp,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(1.w,0.4.h),
                          child: Lottie.asset(
                            AppImages.dots,
                            width: 3.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
