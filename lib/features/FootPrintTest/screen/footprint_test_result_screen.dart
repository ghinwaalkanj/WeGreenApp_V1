import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../common_widgets/bg.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/image_strings.dart';

class FootPrintTestResultScreen extends StatelessWidget {
  const FootPrintTestResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          bg(),
          Transform.scale(
            scale: 2.5,
            origin: Offset(0, 23.h),
            child: Image.asset(AppImages.leaves),
          ),
          Positioned(
            left: 19.w,
            right: 19.w,
            top: 11.h,
            child: Column(
              children: [
                Text(
                  "Carbon Footprint Test Result",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                    color: AppColor.ink,
                    shadows: [
                      Shadow(
                        color: AppColor.darkGrey,
                        offset: Offset(3, 3),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CircleAvatar(
                  radius: 35.sp,
                  backgroundColor: AppColor.lightGreen,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "8.4",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColor.ink,
                          shadows: [
                            Shadow(
                              color: AppColor.darkGrey,
                              offset: Offset(3, 3),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "Tones",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: AppColor.ink,
                          shadows: [
                            Shadow(
                              color: AppColor.darkGrey,
                              offset: Offset(3, 3),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.language,size: 25.sp,color: AppColor.green,),
                    Icon(Icons.language,size: 25.sp,color: AppColor.darkBeige,),
                    Icon(Icons.language,size: 25.sp,color: AppColor.darkGrey,),
                    Icon(Icons.language,size: 25.sp,color: AppColor.darkGrey,),
                    Icon(Icons.language,size: 25.sp,color: AppColor.darkGrey,),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
