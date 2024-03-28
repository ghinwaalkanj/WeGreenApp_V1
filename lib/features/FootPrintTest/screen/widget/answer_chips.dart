import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';

class AnswerChips extends StatelessWidget {
  const AnswerChips({
    super.key,
    required this.answer,
     this.image,
    this.isSmall = false,
  });

  final String answer;
  final String? image;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 92.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(
          color: AppColor.darkGreen,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(answer,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
          if(image!=null)  Image(
              image: AssetImage(image!),
            width: 31.w,
            ),
          ],
        ),
      ),
    );
  }
}
