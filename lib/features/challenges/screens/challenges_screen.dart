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
import 'package:we_green_v1/features/challenges/screens/widget/rewareds.dart';
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
                        height: 65.h,
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
                            : controller.cat == 3
                                ? Rewards()
                                : SizedBox()),
                  ),
                ],
              ),
            ),
    );
  }
}
//
