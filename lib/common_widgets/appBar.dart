import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../core/constant/color.dart';
import '../core/constant/image_strings.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? image;
  final VoidCallback onPressed;
  final VoidCallback onTap;

  const CustomAppBar({
    super.key,
     this.image,
    required this.onPressed,
    required this.onTap, this.scale=1.3,
  });
final double scale;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: -62.h,
          child: Transform.scale(
            scale: 1.5,
            child: Image.asset(
              AppImages.appbar,
            ),
          ),
        ),
        Positioned(
          top: 7.h,
          left: 5.w,
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.menu,
              size: 28.sp,
              color: AppColor.ink,
            ),
          ),
        ),
        Positioned(
          top: 5.h,
          right: 5.w,
          child: GestureDetector(
            onTap: onTap,
            child: Image.asset(
              AppImages.notification,
            ),
          ),
        ),
        Positioned(
          top: 13.2.h,
          child: Transform.scale(
            scale: scale,
            child: image != null ? image : SizedBox(),          ),
        ),
      ],
    );
  }
}