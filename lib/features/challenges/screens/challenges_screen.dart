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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select waste category',
                            style: TextStyle(
                              color: AppColor.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            height: 4.h,
                            padding: EdgeInsets.only(left: 2.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Obx(() => DropdownButton<String>(
                                  value: controller.dropdownValue.value,
                                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                                  underline: Container(),
                                  onChanged: (String? newValue) {
                                    controller.changeDropdownValue(newValue!);
                                  },
                                  items: <String>[
                                    'Paper',
                                    'Plastic',
                                    'Glass',
                                    'Food',
                                    'Metal',
                                    'Special',
                                    'E-Waste',
                                    'Drugs',
                                    'Non-Recyclable'
                                  ].map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                            color: AppColor.ink,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                )),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Select procedure type',
                            style: TextStyle(
                              color: AppColor.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProceduresTypes(
                                text: 'Recycle',
                                image: Image.asset(AppImages.recycle),
                                onPressed: () {
                                  controller.updateproc(1);
                                },
                                color: controller.proc == 1
                                    ? AppColor.green.withOpacity(0.50)
                                    : Colors.white,
                              ),
                              ProceduresTypes(
                                text: 'Reuse',
                                image: Image.asset(AppImages.reuse),
                                onPressed: () {
                                  controller.updateproc(2);
                                },
                                color: controller.proc == 2
                                    ? AppColor.green.withOpacity(0.50)
                                    : Colors.white,
                              ),
                              ProceduresTypes(
                                text: 'Reduce',
                                image: Image.asset(AppImages.reduce),
                                onPressed: () {
                                  controller.updateproc(3);
                                },
                                color: controller.proc == 3
                                    ? AppColor.green.withOpacity(0.50)
                                    : Colors.white,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Enter goal amount',
                            style: TextStyle(
                              color: AppColor.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 20.w,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter amount',
                                    border: UnderlineInputBorder(),
                                  ),
                                ),
                              ),
                              Text(
                                controller.proc == 1
                                    ? ' % recycling'
                                    : controller.proc == 2
                                        ? '% reusing'
                                        : '% reducing',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Deadline',
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              controller.pickDate();
                            },
                            child: Obx(() => Text(
                              DateFormat('dd MMM yyyy').format(controller.selectedDate.value),
                              style: TextStyle(color: AppColor.ink),
                            )),
                          ),
                        ],
                      ),
                          SizedBox(height: 3.h,),
                          Center(
                            child: MaterialButton(
                              height: 6.h,
                              minWidth: 44.w,
                              color: AppColor.green,
                              onPressed: () {
                                Get.to(NavigationMenu());
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(30), // Set border radius
                              ),
                              child: Text(
                                "add",
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
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
