import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'package:we_green_v1/features/control_waste/screens/controle_waste_screen.dart';
import 'package:we_green_v1/features/green_data/screens/widget/3r_status.dart';
import 'package:we_green_v1/features/green_data/screens/widget/custom_container.dart';
import 'package:we_green_v1/features/green_data/screens/widget/tips_container.dart';
import '../../../common_widgets/Drawer.dart';
import '../../../common_widgets/EndDrawer.dart';
import '../../../common_widgets/loading_screen.dart';
import '../../../core/class/statusrequest.dart';
import '../../../common_widgets/appBar.dart';
import '../../../data/datasource/static/static.dart';
import '../../FootPrintTest/screen/FootPrintTest_screen.dart';
import '../../add_waste/screens/add_waste_screens.dart';
import '../../tips/screens/tips_screen.dart';
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
                  const bg(),
                  CustomAppBar(
                      image: Image.asset(
                        AppImages.gdata,
                      ),
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
                        fontFamily: 'DMSans',
                        color: AppColor.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
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
                  Positioned(
                    top: 31.h,
                    child: Row(
                      children: [
                        CustomContainer2(
                          text: "Add Your\nWaste Data",
                          onPressed: () {
                            Get.offAll(const AddWasteScreen());
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
                            Get.offAll(const FootPrintTestScreen());
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
                            fontFamily: 'DMSans',
                            color: AppColor.ink,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
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
                    top: 58.h,
                    child: Container(
                      height: 5.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: AppColor.green.withOpacity(0.45)),
                    ),
                  ),
                  Positioned(
                    top: 49.h,
                    child: const ThreeRStatus(),
                  ),
                  Positioned(
                    top: 67.h,
                    left: 8.w,
                    child: SizedBox(
                      width: 84.w,
                      child: GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Tips',
                                  style: TextStyle(
                                    fontFamily: 'DMSans',
                                    color: AppColor.ink,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_right_outlined,
                                  color: AppColor.ink,
                                ),
                              ],
                            ),
                            Text(
                              'view all',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'DMSans',
                                color: Colors.black54,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 61.h,
                    child: Container(
                        height: 47.h,
                        width: 100.w,
                        padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return TipsContainer(
                                onPressed: () {
                                  Get.offAll(const TipsScreen());
                                },
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
