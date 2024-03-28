import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';

class FootPrintHeader extends StatelessWidget {
  const FootPrintHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 12.w,
      top: 13.h,
      child: Text(
        'Carbon FootPrint Test',
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
        textAlign: TextAlign.center,
      ),
    );

  }
}
