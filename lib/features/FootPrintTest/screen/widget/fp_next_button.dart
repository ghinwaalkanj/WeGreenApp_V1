import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/features/FootPrintTest/controller/FootPrintTest_controller.dart';


class FootPrintNextButton extends StatelessWidget {
  const FootPrintNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 14.w,
      bottom: 15.h,
      child: Row(
        children: [
          GestureDetector(
            onTap: ()=>FootPrintController.instance.nextPage(),
            child: Text(
              "next",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.darkGreen),
            ),
          ),
          GestureDetector(
            onTap: ()=>FootPrintController.instance.nextPage(),
              child: Icon(
            Icons.arrow_forward,
            color: AppColor.darkGreen,
          )),
        ],
      ),
    );
  }
}
