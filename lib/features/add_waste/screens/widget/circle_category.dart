import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';

class CircleCategory extends StatelessWidget {
  const CircleCategory({
    super.key,
    required this.image,
    this.text,
    this.opacity = 0.75,
  });

  final String image;
  final String? text;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 17.w,
          height: 8.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.ink.withOpacity(opacity),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Center(
              child: Image(
            image: AssetImage(image),
            fit: BoxFit.fill,
          )),
        ),
        SizedBox(height: 0.5.h,),
        if (text != null)
          Text(
            text!,
            style: TextStyle(
              color: AppColor.ink,
              fontWeight: FontWeight.w600,
              fontSize: 8.sp,
              fontFamily: 'DMSans',
            ),
          ),
      ],
    );
  }
}
