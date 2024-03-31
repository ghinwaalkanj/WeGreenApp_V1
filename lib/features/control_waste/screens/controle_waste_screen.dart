import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/core/constant/Drawer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'package:we_green_v1/features/control_waste/screens/widget/custom_container.dart';
import 'package:we_green_v1/navigation_menu.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';
import '../../../core/constant/loading_screen.dart';
import '../../challenges/screens/challenges_screen.dart';
import '../../green_data/screens/green_data_screen.dart';
import '../controller/control_waste_controller.dart';

class ControlWasteScreen extends StatelessWidget {
  const ControlWasteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ControlWasteControllerImp());

    return GetBuilder<ControlWasteControllerImp>(
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
                      image: Image.asset(AppImages.cwaste),
                      onPressed: () {
                        controller.scaffoldKey.currentState?.openDrawer();
                      },
                      onTap: () {
                        controller.scaffoldKey.currentState?.openEndDrawer();
                      }),
                  Positioned(
                    top: 26.h,
                    child: Text(
                      'Control Your Waste',
                      style: TextStyle(
                        fontFamily: 'DMSans',
                        color: AppColor.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25.h,
                    left: 5.w,
                    child: IconButton(
                      onPressed: () {
                        Get.offAll(const NavigationMenu());
                      },
                      icon: Icon(Icons.arrow_back_outlined),
                      color: Colors.black54,
                    ),
                  ),
                  Positioned(
                    top: 31.h,
                    child: CustomContainer(
                      text: "Green Data",
                      onPressed: () {
                        Get.offAll(const GreenDataScreen());
                      },
                      image: AppImages.gdata,
                    ),
                  ),
                  Positioned(
                    top: 45.h,
                    child: CustomContainer(
                      text: "Challenges",
                      onPressed: () {
                        Get.offAll(const ChallengesScreen());
                      },
                      image: AppImages.challenges,
                    ),
                  ),
                  Positioned(
                    top: 60.h,
                    child: Container(
                      height: 38.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.sp),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(2, 2),
                                blurRadius: 5)
                          ]),
                      child: TableCalendar(
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: DateTime.now(),
                        rowHeight: 4.4.h,
                        headerStyle: HeaderStyle(
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'DMSans',
                            fontSize: 13.sp,
                            color: AppColor.ink,
                          ),
                        ),
                        calendarStyle: const CalendarStyle(
                          todayDecoration: BoxDecoration(
                              shape: BoxShape.rectangle, color: AppColor.ink),
                        ),
                        daysOfWeekStyle: const DaysOfWeekStyle(
                          weekendStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          weekdayStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
