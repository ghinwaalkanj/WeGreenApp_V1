import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/image_strings.dart';

class ProceduresTypes extends StatelessWidget {
  final String text;
  final Image image;
  final Color color;
  final VoidCallback onPressed;

  const ProceduresTypes({
    super.key,
    required this.text,
    required this.image,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 9.h,
        width: 10.h,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.sp),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(2, 2), blurRadius: 5)
            ]),
        child: Column(
          children: [
            Container(
              height: 5.h,
              child: image,
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Text(
              text,
              style: TextStyle(
                color: AppColor.ink,
                fontWeight: FontWeight.w500,
                fontSize: 11.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
