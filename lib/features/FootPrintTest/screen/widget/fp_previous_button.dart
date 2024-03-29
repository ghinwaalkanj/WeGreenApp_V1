import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';
import '../../controller/FootPrintTest_controller.dart';

class FootPrintPreviousButton extends StatelessWidget {
  const FootPrintPreviousButton({
    super.key, required this.color, required this.bottom, required this.onTap,
  });
final Color color;
  final double bottom;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 14.w,
      bottom: bottom,
      child: Row(
        children: [
          GestureDetector(
              onTap: onTap,
              child: Icon(Icons.arrow_back, color: color)),
          GestureDetector(
              onTap: onTap,
              child: Text(
                "previous",
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: color),
              )),
        ],
      ),
    );
  }
}
