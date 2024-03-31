import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/features/FootPrintTest/controller/FootPrintTest_controller.dart';


class FootPrintNextButton extends StatelessWidget {
  const FootPrintNextButton({
    super.key, required this.color, required this.bottom,required this.onTap
  });
  final Color color;
  final double bottom;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 14.w,
      bottom: bottom,
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Text(
              "next",
              style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'DMSans',
                  color: color),
            ),
          ),
          GestureDetector(
            onTap: onTap,
              child: Icon(
            Icons.arrow_forward,
            color:color,
          )),
        ],
      ),
    );
  }
}
