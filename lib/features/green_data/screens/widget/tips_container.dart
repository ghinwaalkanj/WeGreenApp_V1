import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/image_strings.dart';
import '../../../../data/datasource/static/static.dart';

class TipsContainer extends StatelessWidget {
  final String text;
  final Widget image;
  final VoidCallback onPressed;

  const TipsContainer({
    super.key,
    required this.text,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 25.h,
            width: 40.w,
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.only(top: 1.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
              color: AppColor.green.withOpacity(0.40),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 12.h,
                  width: 35.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                  child: image,
                ),
              ],
            ),
          ),
          Positioned(
            top:25.h,
            child: Container(
              width: 36.w,
              height: 10.h,
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'DMSans',
                  color: AppColor.black,
                  fontSize: 8.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );


  }
}
