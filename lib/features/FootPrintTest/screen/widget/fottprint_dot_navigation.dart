import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import '../../controller/FootPrintTest_controller.dart';

class FottPrintDotNavigation extends StatelessWidget {
  const FottPrintDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FootPrintTestControllerImp());
    return Positioned(
      left: 17.w,
      top: 23.h,
      child: SizedBox(
        height: 1.5.h,
        width: 116.w,
        child: ListView.separated(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 1.h,
              width: 15.w,
              decoration: const BoxDecoration(
                color: AppColor.green,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 2.5.w,
            );
          },
        ),
      ),
    );
  }
}
