import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_widgets/bg.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/Drawer.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/image_strings.dart';
import '../../../core/constant/loading_screen.dart';
import '../../add_waste/screens/add_your_waste_2.dart';
import '../../challenges/screens/challenges_screen.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());

    return GetBuilder<ProfileControllerImp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? const LoadingScreen()
          : Scaffold(
              key: controller.scaffoldKey,
              drawer: const MyDrawer(),
              endDrawer: const NotificationDrawer(),
              body: Stack(
                alignment: Alignment.center,
                children: [
                  const bg(),
                  CustomAppBar(onPressed: () {
                    controller.scaffoldKey.currentState?.openDrawer();
                  }, onTap: () {
                    controller.scaffoldKey.currentState?.openEndDrawer();
                  }),
                  Positioned(
                    top: 31.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ProfileSection(
                              image:
                                  'assets/images/Screenshot__376_-removebg-preview 1.png',
                              text: "Status",
                            ),
                            ProfileSection(
                              image: 'assets/images/list 1.png',
                              text: "Plans",
                            ),
                            ProfileSection(
                              image: 'assets/images/time-forward 1.png',
                              text: "Activity",
                            ),
                            ProfileSection(
                              image: 'assets/images/star 1.png',
                              text: "Rewards",
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Container(
                            height: 0.2.h,
                            width: 80.w,
                            color: AppColor.lightGrey,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ProfileTitle(
                          title: 'Monthly 3R Status',
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 2.h, left: 5.w, right: 5.w),
                          child: Row(
                            children: [
                              ProcedureContainer(
                                text: 'Recycle',
                                percentage: "58",
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              ProcedureContainer(
                                text: 'Reuse',
                                percentage: "15",
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              ProcedureContainer(
                                text: 'Reduce',
                                percentage: "24",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        ProfileTitle(title: "Weekly Carbon Footprint"),
                        Padding(
                          padding: EdgeInsets.only(left: 2.5.w),
                          child: Image(
                            image: AssetImage(
                                "assets/images/image-removebg-preview (32).png"),
                            width: 90.w,
                          ),
                        ),
                        ProfileTitle(title: "Goals"),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 3.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Get.to(ChallengesScreen());
                                    },
                                    child: GoalsInfoContainer(
                                      widget: Icon(
                                        Icons.add,
                                        color: AppColor.white,
                                        size: 12.sp,
                                      ),
                                      title: 'Add Goal',
                                      color: AppColor.green,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.h,
                                  ),
                                  GoalsInfoContainer(
                                    widget: Text(
                                      "5",
                                      style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: 9.sp),
                                    ),
                                    title: 'In Process',
                                    color: Color(0xffD14268),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Row(
                                children: [
                                  GoalsInfoContainer(
                                    widget: Text(
                                      "15",
                                      style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: 9.sp),
                                    ),
                                    title: "Achieved",
                                    color: Color(0xffA053CF),
                                  ),
                                  SizedBox(
                                    width: 3.h,
                                  ),
                                  GoalsInfoContainer(
                                    widget: Text(
                                      "4",
                                      style: TextStyle(
                                          color: AppColor.white,
                                          fontSize: 9.sp),
                                    ),
                                    title: 'Not Achieved',
                                    color: Color(0xff3CC0D7),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 13.h,
                    child: Column(
                      children: [
                        Container(
                          height: 13.h,
                          width: 30.w,
                          child: Center(
                            child: Image(
                              image: AssetImage("assets/images/profile.png"),
                            ),
                          ),
                        ),
                        Text(
                          'Ghinwa Alking',
                          style: TextStyle(
                            color: AppColor.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class GoalsInfoContainer extends StatelessWidget {
  const GoalsInfoContainer({
    super.key,
    this.widget,
    required this.title,
    required this.color,
  });

  final Widget? widget;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 1.w),
      height: 4.2.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.green.withOpacity(0.5),
          // Change the color here
          width: 1.5, // Adjust the width as needed
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 0.8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 9.5.sp),
          ),
          CircleAvatar(
            backgroundColor: color,
            radius: 8.sp,
            child: Center(
              child: widget,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTitle extends StatelessWidget {
  const ProfileTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                color: AppColor.green,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 3.w,
          ),
          Icon(
            Icons.arrow_forward_ios_sharp,
            color: AppColor.green,
            size: 10.sp,
          )
        ],
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.ink),
          ),
        ],
      ),
    );
  }
}
