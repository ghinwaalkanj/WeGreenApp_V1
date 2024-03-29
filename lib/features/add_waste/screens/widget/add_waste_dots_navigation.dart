import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import '../../controller/add_waste_controller.dart';

class AddWasteDots extends StatelessWidget {
  const AddWasteDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = AddWasteController.instance;
    return Obx(
      () => Positioned(
        top: 35.h,
        left: 41.w,
        right: 41.w,
        child: Row(
          children: [
            Dot(
              color: AppColor.green,
            ),
            SizedBox(
              width: 3.w,
            ),
            controller.currentPageIndex.value + 1 >= 2
                ? Dot(
                    color: AppColor.green,
                  )
                : Dot(
                    color: AppColor.grey,
                  ),
            SizedBox(
              width: 3.w,
            ),
            controller.currentPageIndex.value + 1 >= 3
                ? Dot(
                    color: AppColor.green,
                  )
                : Dot(
                    color: AppColor.grey,
                  ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2.7.h,
      width: 2.7.w,
      child: Container(
        height: 1.h,
        width: 100.w,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
