import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/FootPrintTest/screen/footprint_test_result_screen.dart';
import 'package:we_green_v1/features/add_waste/screens/widget/circle_category.dart';

import '../../../core/constant/color.dart';

class AddYourWaste2 extends StatelessWidget {
  const AddYourWaste2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 39.h, right: 14.w, left: 14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleCategory(
                image: "assets/images/image-removebg-preview (11) 1.png",
                opacity: 0.4,
              ),
              SizedBox(
                width: 3.w,
              ),
              Text(
                "Paper",
                style: TextStyle(
                    color: AppColor.ink,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp),
              ),
              SizedBox(
                width: 7.w,
              ),
              Container(
                height: 3.5.h,
                width: 32.w,
                decoration: BoxDecoration(
                  color: AppColor.lightGrey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Sorting Guide",
                        style: TextStyle(color: AppColor.green),
                      ),
                      Icon(
                        Icons.info_outline_rounded,
                        color: AppColor.green,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Text(
            "Identify your waste",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),
          ),
          SizedBox(
            height: 1.h,
          ),
          AddWasteField(
            labelText: 'Enter name of waste',
            width: 60.w,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AddWasteField(
                labelText: 'Enter the amount',
                width: 30.w,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "pieces",
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
              )
            ],
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Text(
            "Select procedure type",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProcedureContainer(image: "assets/images/image-removebg-preview (23) 1.png", text: 'Recycle',),
              ProcedureContainer(image: "assets/images/image-removebg-preview (24) 2.png", text: 'Reuse',),
              ProcedureContainer(image: "assets/images/image-removebg-preview (22) 1.png", text: 'Reduce',),
            ],
          ),
        ],
      ),
    );
  }
}
///
class ProcedureContainer extends StatelessWidget {
  const ProcedureContainer({
    super.key,  this.image, required this.text, this.percentage,
  });
  final String? image;
  final String text;
  final String? percentage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.2.h,
      width: 20.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColor.green.withOpacity(0.5), // Change the color here
          width: 1.5, // Adjust the width as needed
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 0.8),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(image!=null)  Image(image:AssetImage(image!),),
            if(image==null)  Padding(
              padding:  EdgeInsets.symmetric(horizontal:1.w),
              child: FittedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.arrow_upward,color: AppColor.ink,),
                    if(percentage!=null)Text("$percentage%",style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w600,color: AppColor.grey),)
                  ],
                ),
              ),
            ),
            Text(text,style: TextStyle(color: AppColor.ink,fontWeight: FontWeight.w600,fontSize: 10.sp),)
          ],
        ),
      ),

    );
  }
}

class AddWasteField extends StatelessWidget {
  const AddWasteField({
    super.key,
    required this.labelText,
    required this.width,
  });

  final String labelText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: AppColor.grey, fontSize: 9.sp),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColor.green), // Set border color when focused
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
