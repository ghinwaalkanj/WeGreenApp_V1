import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'color.dart';
import 'image_strings.dart';

class CustomAppBar extends StatelessWidget {
  final String image;

  const CustomAppBar({
    super.key,
    required this.image,
  });


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: Offset(-35.w, -34.h),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              size: 30.sp,
              color: AppColor.ink,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(35.w, -34.h),
          child: Image.asset(
            AppImages.notification,
          ),
        ),
        Transform.scale(
          scale: 1.5,
          origin: Offset(0.w, 55.h),
          child: Image.asset(
            image,
          ),
        ),
        Transform.scale(
          scale: 1.5,
          origin: Offset(0, 95.h),
          child: Image.asset(
            AppImages.appbar,
          ),
        ),
      ],
    );
  }
}
