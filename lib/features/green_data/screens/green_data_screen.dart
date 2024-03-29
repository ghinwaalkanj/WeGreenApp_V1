import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/core/constant/Drawer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'package:we_green_v1/features/green_data/screens/widget/3r_status.dart';
import 'package:we_green_v1/features/green_data/screens/widget/custom_container.dart';
import 'package:we_green_v1/features/green_data/screens/widget/tips_container.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';
import '../../../core/constant/loading_screen.dart';
import '../../../data/datasource/static/static.dart';
import '../../../navigation_menu.dart';
import '../../FootPrintTest/screen/FootPrintTest_screen.dart';
import '../../add_waste/screens/add_waste_screens.dart';
import '../../control_waste/screens/controle_waste_screen.dart';
import '../controller/green_data_controller.dart';

class GreenDataScreen extends StatelessWidget {
  const GreenDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GreenDataControllerImp());

    return GetBuilder<GreenDataControllerImp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? LoadingScreen()
          : Scaffold(
              key: controller.scaffoldKey,
              drawer: const MyDrawer(),
              endDrawer: const NotificationDrawer(),
              body: Stack(
                alignment: Alignment.center,
                children: [
                  bg(),
                  CustomAppBar(
                      image: Image.asset(AppImages.gdata,),
                      onPressed: () {
                        controller.scaffoldKey.currentState?.openDrawer();
                      },
                      onTap: () {
                        controller.scaffoldKey.currentState?.openEndDrawer();
                      }),
                  Positioned(
                    top: 26.h,
                    child: Text(
                      'Green Data',
                      style: TextStyle(
                        color: AppColor.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25.h,
                    left: 5.w,
                    child: IconButton(
                      onPressed: () {
                        Get.off(NavigationMenu());
                      },
                      icon: Icon(Icons.arrow_back_outlined),
                      color: Colors.black54,
                    ),
                  ),
                  Positioned(
                    top: 31.h,
                    child: Row(
                      children: [
                        CustomContainer2(
                          text: "Add Your\nWaste Data",
                          onPressed: () {
                            Get.to(AddWasteScreen());
                          },
                          image: Icon(
                            Icons.add_circle_outline,
                            color: AppColor.green,
                            size: 6.h,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CustomContainer2(
                          text: "Measure Carbon\nFootprint",
                          onPressed: () {
                            Get.offAll(FootPrintTestScreen());
                          },
                          image: Image.asset(
                            AppImages.co2,
                            height: 7.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50.h,
                    left: 8.w,
                    child: Row(
                      children: [
                        Text(
                          '3R Status & Activities',
                          style: TextStyle(
                            color: AppColor.ink,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: AppColor.ink,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 58.h,
                    child: Container(
                      height: 5.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: AppColor.green.withOpacity(0.45)),
                    ),
                  ),
                  Positioned(
                    top: 48.h,
                    child: ThreeRStatus(text: '58%', procesure: 'Recycle',),
                  ),
                  Positioned(
                    top: 67.h,
                    left: 8.w,
                    child: Row(
                      children: [
                        Text(
                          'Tips',
                          style: TextStyle(
                            color: AppColor.ink,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: AppColor.ink,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 61.h,
                      child:  Container(
                          height: 47.h,
                          width: 100.w,
                          padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return TipsContainer(
                                  onPressed: () {},
                                  image: Image.asset(
                                    DataLists.imagePaths2[index],
                                    fit: BoxFit.fill,
                                  ),
                                  text: DataLists.texts2[index],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  width: 1.w,
                                );
                              },
                              itemCount: 3)),
                      ),
                ],
              ),
            ),
    );
  }
}
//
