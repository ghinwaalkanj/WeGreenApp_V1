import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/features/add_waste/screens/add_your_waste_1.dart';
import 'package:we_green_v1/features/add_waste/screens/add_your_waste_2.dart';
import 'package:we_green_v1/features/add_waste/screens/add_your_waste_3.dart';
import 'package:we_green_v1/features/add_waste/screens/widget/add_waste_dots_navigation.dart';
import 'package:we_green_v1/features/add_waste/screens/widget/add_waste_header.dart';
import 'package:we_green_v1/features/add_waste/screens/widget/box_container.dart';
import 'package:we_green_v1/features/control_waste/screens/controle_waste_screen.dart';
import '../../../common_widgets/bg.dart';
import '../../../core/constant/appBar.dart';
import '../../FootPrintTest/screen/widget/fp_next_button.dart';
import '../../FootPrintTest/screen/widget/fp_previous_button.dart';
import '../../home/controller/home_controller.dart';
import '../controller/add_waste_controller.dart';

class AddWasteScreen extends StatelessWidget {
  const AddWasteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeControllerImp());
    final controller1 = Get.put(AddWasteController());

    return Scaffold(
      body: Stack(
        children: [
          bg(),
          CustomAppBar(
              image: Icon(
                Icons.add_circle_outline_outlined,
                color: AppColor.green.withOpacity(0.6),
                size: 40.sp,
              ),
              onPressed: () {
                controller.scaffoldKey.currentState?.openDrawer();
              },
              onTap: () {
                controller.scaffoldKey.currentState?.openEndDrawer();
              }),
          Positioned(
            top: 25.h,
            left: 5.w,
            child: IconButton(
              onPressed: () {
                Get.offAll(const ControlWasteScreen());
              },
              icon: Icon(Icons.arrow_back_outlined),
              color: Colors.black54,
            ),
          ),
          AddWasteHeader(),
          BoxContainer(),
          PageView(
            controller: controller1.pageController,
            onPageChanged: controller1.updatePageIndicator,
            physics: NeverScrollableScrollPhysics(),
            children: [
              AddYourWaste1(),
              AddYourWaste2(),
              AddYourWaste3(),
            ],
          ),
          AddWasteDots(),
          FootPrintNextButton(
            color: AppColor.green,
            bottom: 2.h, onTap: () => AddWasteController.instance.nextPage(),
          ),
          FootPrintPreviousButton(
            color: AppColor.green,
            bottom: 2.h, onTap:() => AddWasteController.instance.previousPage(),
          ),
        ],
      ),
    );
  }
}
