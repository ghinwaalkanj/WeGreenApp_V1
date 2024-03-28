import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';
import '../../controller/FootPrintTest_controller.dart';

class FootPrintPreviousButton extends StatelessWidget {
  const FootPrintPreviousButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 14.w,
      bottom: 15.h,
      child: Row(
        children: [
          GestureDetector(
              onTap: () => FootPrintController.instance.previousPage(),
              child: Icon(Icons.arrow_back, color: AppColor.darkGreen)),
          GestureDetector(
              onTap: () => FootPrintController.instance.previousPage(),
              child: Text(
                "previous",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.darkGreen),
              )),
        ],
      ),
    );
  }
}
