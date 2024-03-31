import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/points/screens/points_screen.dart';

import '../../../core/constant/color.dart';

class AddYourWaste3 extends StatelessWidget {
  const AddYourWaste3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 39.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(-3.w, 0),
            child: SizedBox(
              width: 98.w,
              child: const Image(
                image: AssetImage(
                    "assets/images/Screenshot__388_-removebg-preview 1.png"),
              ),
            ),
          ),
          Text(
            "Congratulations!",
            style: TextStyle(
                fontFamily: 'DMSans',
                fontWeight: FontWeight.w600,
                color: AppColor.ink,
                fontSize: 17.sp),
          ),
          SizedBox(
            height: 1.h,
          ),
          const Image(
            image: AssetImage(
                "assets/images/Screenshot__389_-removebg-preview 1.png"),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Image(
            image: AssetImage("assets/images/marker 2.png"),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          SizedBox(
            height: 4.h,
            width: 38.w,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    Colors.grey.withOpacity(0.1)),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                ),
                elevation: MaterialStateProperty.all<double>(4),
              ),
              onPressed: () {
                Get.offAll(const PointsScreen());
              },
              child: Text(
                "Collection Points",
                style: TextStyle(
                  fontFamily: 'DMSans',
                  color: Colors.black,
                  fontSize: 7.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
