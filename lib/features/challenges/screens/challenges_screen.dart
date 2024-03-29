import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/core/constant/Drawer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'package:we_green_v1/features/challenges/screens/widget/add_goals.dart';
import 'package:we_green_v1/features/challenges/screens/widget/challenge_type.dart';
import 'package:we_green_v1/features/challenges/screens/widget/procedures_types.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';
import '../../../core/constant/loading_screen.dart';
import '../../../navigation_menu.dart';
import '../controller/challenges_controller.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChallengesControllerImp());

    return GetBuilder<ChallengesControllerImp>(
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
                      image: Transform.scale(
                        scale: 1.3,
                        origin: Offset(0, -5.h),
                        child: Image.asset(AppImages.challenges),
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
                      'Challenges',
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
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_outlined),
                      color: Colors.black54,
                    ),
                  ),
                  Positioned(
                    top: 31.h,
                    child: Container(
                      width: 82.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ChallengeType(
                            text: 'Add Goals',
                            icon: controller.cat == 1
                                ? Icons.add_circle
                                : Icons.add_circle_outline,
                            onPressed: () {
                              controller.updatecat(1);
                            },
                            color: controller.cat == 1
                                ? AppColor.ink
                                : Colors.grey,
                          ),
                          ChallengeType(
                            text: 'Quizzes',
                            icon: controller.cat == 2
                                ? Icons.psychology
                                : Icons.psychology_outlined,
                            onPressed: () {
                              controller.updatecat(2);
                            },
                            color: controller.cat == 2
                                ? AppColor.ink
                                : Colors.grey,
                          ),
                          ChallengeType(
                            text: 'Rewards',
                            icon: controller.cat == 3
                                ? Icons.star
                                : Icons.star_outline,
                            onPressed: () {
                              controller.updatecat(3);
                            },
                            color: controller.cat == 3
                                ? AppColor.ink
                                : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 38.h,
                    child: Container(
                      color: Colors.black26,
                      height: 0.2.w,
                      width: 85.w,
                    ),
                  ),
                  Positioned(
                    top: 41.h,
                    child: Container(
                      height: 120.w,
                      width: 85.w,
                      padding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(2, 2),
                                blurRadius: 5)
                          ]),
                      child: controller.cat == 1
                          ? AddGoal()
                          : Column(
                              children: [
                                Container(
                                  height: 6.h,
                                  padding: EdgeInsets.only(top: 1.h),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 1.h,
                                        horizontal: 15.0,
                                      ),
                                      hintText: 'Search reward',
                                      suffixIcon: Icon(Icons.search),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(11.sp),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(11.sp),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(11.sp),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 3.h),
                                  height: 14.h,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 9.h,
                                          width: 10.h,
                                          margin: EdgeInsets.only(bottom: 2.h),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.sp),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(2, 2),
                                                    blurRadius: 5)
                                              ]),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 5.h,
                                                child: Image.asset(
                                                    AppImages.recycle),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text(
                                                'recycle',
                                                style: TextStyle(
                                                  color: AppColor.ink,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: 3.w,
                                      );
                                    },
                                    itemCount: 5,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 1.h),
                                  height: 34.h,
                                  child: ListView.separated(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          height: 9.h,
                                          width: 10.h,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.w),
                                          decoration: BoxDecoration(
                                              color: Color(0xffD9F9A5),
                                              borderRadius:
                                                  BorderRadius.circular(10.sp),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black26,
                                                  offset: Offset(2, 2),
                                                  blurRadius: 5,
                                                )
                                              ]),
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(left: 3.w),
                                                height: 7.h,
                                                child: Image.asset(
                                                    AppImages.discount),
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              VerticalDivider(
                                                color: AppColor.green,
                                                width: 0.6.w,
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '25% Discount',
                                                    style: TextStyle(
                                                      color: AppColor.ink,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 12.sp,
                                                    ),
                                                  ),
                                                  Text(
                                                    'in Elsa 2nd Hand Store',
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 10.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height: 2.h,
                                      );
                                    },
                                    itemCount: 5,
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
//
