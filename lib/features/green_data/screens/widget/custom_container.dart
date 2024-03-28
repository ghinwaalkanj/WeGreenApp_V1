import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/image_strings.dart';

class CustomContainer2 extends StatelessWidget {
  final String text;
  final Widget image;
  final VoidCallback onPressed;

  const CustomContainer2({
    super.key,
    required this.text,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        height: 17.h,
        width: 40.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.sp),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(2, 2), blurRadius: 5)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.scale(
              scale: 1.3,
              child:image,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: AppColor.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
