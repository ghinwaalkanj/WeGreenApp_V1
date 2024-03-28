import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import '../../controller/FootPrintTest_controller.dart';

class FootPrintNavigation extends StatelessWidget {
  const FootPrintNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = FootPrintController.instance;
    return Positioned(
      left: 14.w,
      top: 23.h,
      child: Obx(
        ()=> Row(
          children: [
            Dot(color: AppColor.green,),
            SizedBox(width: 2.w,),
            controller.currentPageIndex.value+1>=2? Dot(color: AppColor.green,):Dot(color: AppColor.grey,),
            SizedBox(width: 2.w,),
            controller.currentPageIndex.value+1>=3? Dot(color: AppColor.green,):Dot(color: AppColor.grey,),
            SizedBox(width: 2.w,),
            controller.currentPageIndex.value+1>=4? Dot(color: AppColor.green,):Dot(color: AppColor.grey,),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    super.key, required this.color,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.5.h,
      width: 16.w,
      child: Container(
        height: 1.h,
        width: 15.w,
        decoration:  BoxDecoration(
            color: color
        ),
      ),
    );
  }
}
