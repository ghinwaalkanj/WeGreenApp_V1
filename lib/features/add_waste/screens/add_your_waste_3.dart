import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
          Image(
            image: AssetImage(
                "assets/images/Screenshot__388_-removebg-preview 1.png"),
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            "Congratulations!",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColor.ink,
                fontSize: 18.sp),
          ),
          SizedBox(
            height: 2.h,
          ),
          Image(
            image: AssetImage(
                "assets/images/Screenshot__389_-removebg-preview 1.png"),
          ),
          SizedBox(
            height: 2.h,
          ),
          Image(
            image: AssetImage("assets/images/marker 2.png"),
          ),
          SizedBox(
            height: 2.h,
          ),

          SizedBox(
            height: 4.h,
            width: 38.w,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(AppColor.lightGrey.withOpacity(0.5)),
                shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                elevation: MaterialStateProperty.all<double>(10),

              ),
              onPressed: () {},
              child:  Text(
                "Collection Points",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
