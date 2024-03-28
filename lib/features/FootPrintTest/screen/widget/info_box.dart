import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -9.h,
      child: Container(
        height: 18.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(55),
          border: Border.all(
            color:AppColor.darkGreen,
            width: 1, // Adjust the width as needed
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.only(top:3.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Icon(Icons.info,color: AppColor.green,size: 18.sp,),
            SizedBox(width: 2.w,),
            Text("Why is it important?",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600),),
          ],),
        ),
      ),
    );
  }
}
