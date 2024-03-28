import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';
import '../../controller/FootPrintTest_controller.dart';

class QuestionRow extends StatelessWidget {
  const QuestionRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FootPrintController.instance;
    return Positioned(
      left: 15.w,
      top: 25.7.h,
      child: Row(
        children: [
          Obx(
            () => Text(
              controller.currentPageIndex.value + 1 == 1
                  ? "Travel"
                  : controller.currentPageIndex.value + 1 == 2
                      ? "Stuff"
                      : controller.currentPageIndex.value + 1 == 3
                          ? "Home"
                          : "Food",
              style: TextStyle(fontSize: 16, color: AppColor.green),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Obx(
            () => Text(
              "Question ${controller.currentPageIndex.value + 1} of 4",
              style: TextStyle(fontSize: 16, color: AppColor.darkGrey),
            ),
          ),
        ],
      ),
    );
  }
}
