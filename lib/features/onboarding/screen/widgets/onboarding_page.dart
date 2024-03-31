import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/sizes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.bg,
  });

  final String image;
  final String bg;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height:7.h,
          ),
           Image(
            image: AssetImage(AppImages.splash),
            height: 17.h,
          ),
          SizedBox(
            height:5.h,
          ),
          Stack(
            children: [
              Image(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.38,
                image: AssetImage(bg),
              ),
              Image(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.38,
                image: AssetImage(image),
              ),
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19.sp,
              fontFamily: 'DMSans',
              color: AppColor.ink,
            ),
            textAlign: TextAlign.center,
          ),
           SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 10.w),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'DMSans',
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
              //
            ),
          )
        ],
      ),
    );
  }
}
