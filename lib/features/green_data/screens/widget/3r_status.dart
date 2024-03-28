import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/image_strings.dart';
import '../../../../data/datasource/static/static.dart';

class ThreeRStatus extends StatelessWidget {
  final String text;
  final String procesure;

  const ThreeRStatus({
    super.key,
    required this.text,
    required this.procesure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.h,
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 50 / 48,
          crossAxisSpacing: 2.w,
          mainAxisSpacing: 1.h,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.sp),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(2, 2),
                      blurRadius: 5)
                ]),
            width: 40.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_upward_rounded,
                      color: AppColor.ink,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  procesure,
                  style: TextStyle(
                    color: AppColor.ink.withOpacity(0.70),
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );


  }
}
