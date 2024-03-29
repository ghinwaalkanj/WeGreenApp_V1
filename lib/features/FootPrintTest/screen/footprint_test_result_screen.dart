import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/navigation_menu.dart';

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
          Transform.scale(scale: 2.5, child: Image.asset(AppImages.leaves)),
          Positioned(
            left: 11.w,
            right: 11.w,
            top: 11.h,
            child: Column(
              children: [
                Text(
                  "Carbon Footprint\n Test Result",
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
                result(),
                SizedBox(
                  height: 2.h,
                ),
                rate(),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "if everyone lived like you, we would need 1.5 planets.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 1.h,
                ),
                DetailResult(
                  image:
                      'assets/images/Screenshot__366_-removebg-preview 1.png',
                  title: 'Travel',
                  percentage: '13',
                ),
                AppDivder(thickness: 0.8.h, indent: 0.w, endIndent: 0.w,),
                DetailResult(
                  image:
                      'assets/images/Screenshot__365_-removebg-preview 1.png',
                  title: 'Stuff',
                  percentage: '31',
                ),
                AppDivder(thickness: 0.8.h, indent: 0.w, endIndent: 0.w,),
                DetailResult(
                  image:
                      'assets/images/Screenshot__367_-removebg-preview 1.png',
                  title: 'Home',
                  percentage: '33',
                ),
                AppDivder(thickness: 0.8.h, indent: 0.w, endIndent: 0.w,),
                DetailResult(
                  image:
                      'assets/images/Screenshot__368_-removebg-preview 1.png',
                  title: 'Food',
                  percentage: '23',
                ),
                AppDivder(thickness: 0.8.h, indent: 0.w, endIndent: 0.w,),
                SizedBox(
                  height: 3.h,
                ),
                MaterialButton(
                  height: 6.h,
                  minWidth: 44.w,
                  color: AppColor.green,
                  onPressed: () {
                    Get.offAll(NavigationMenu());
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30),
                  ),
                  child: Text(
                    "LET'S GO",
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppDivder extends StatelessWidget {
   AppDivder({
    super.key,  required this.thickness, required this.indent, required this.endIndent,
  });
  final double thickness;
  final double indent;
  final double endIndent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColor.green.withOpacity(0.2),
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }
}

class DetailResult extends StatelessWidget {
  const DetailResult({
    super.key,
    required this.image,
    required this.title,
    required this.percentage,
  });

  final String image;
  final String title;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Image(
            image: AssetImage(image),
            height: 8.h,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            title,
            style: TextStyle(
                color: AppColor.green,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp),
          ),
          SizedBox(
            width: 20.w,
          ),
          Text(
            "${percentage} %",
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(
            width: 2.h,
          ),
          Icon(
            Icons.arrow_forward_ios_sharp,
            size: 12.sp,
            color: AppColor.grey,
          ),
        ],
      ),
    );
  }
}

class result extends StatelessWidget {
  const result({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Adjust width according to your requirements
      height: 100, // Adjust height according to your requirements
      decoration: BoxDecoration(
        shape: BoxShape.circle, // This makes the container circular
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 5, // Spread radius
            blurRadius: 7, // Blur radius
            offset: Offset(0, 3), // Offset (horizontal, vertical)
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 2.5.h),
          child: Column(
            children: [
              Text(
                "8.4",
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Tones",
                style: TextStyle(fontSize: 10.sp),
              ),
            ],
          ),
        ), // Add any child widget you want
      ),
    );
  }
}

class rate extends StatelessWidget {
  const rate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.language,
          size: 25.sp,
          color: AppColor.green,
        ),
        Icon(
          Icons.language,
          size: 25.sp,
          color: AppColor.grey,
        ),
        Icon(
          Icons.language,
          size: 25.sp,
          color: AppColor.grey,
        ),
        Icon(
          Icons.language,
          size: 25.sp,
          color: AppColor.grey,
        ),
        Icon(
          Icons.language,
          size: 25.sp,
          color: AppColor.grey,
        ),
      ],
    );
  }
}
