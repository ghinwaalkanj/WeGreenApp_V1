import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/profile/screens/inprogress_screen.dart';
import '../../../common_widgets/bg.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/Drawer.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/loading_screen.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/static/static.dart';
import '../../challenges/screens/challenges_screen.dart';
import '../controller/profile_controller.dart';
import 'achieved_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());
    MyServices myServices = Get.find();

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
                    left: 5.w,
                    child: Container(
                      height: 100.h,
                      child: Stack(
                        children: [
                          const Row(
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
                          Positioned(
                            top: 11.h,
                            left: 5.w,
                            child: Container(
                              height: 0.2.h,
                              width: 80.w,
                              color: AppColor.lightGrey,
                            ),
                          ),
                          Positioned(
                            top: 14.h,
                            left: -2.w,
                            child: const ProfileTitle(
                              title: 'Monthly 3R Status',
                            ),
                          ),
                          Positioned(
                            top: 22.h,
                            left: 5.w,
                            child: Container(
                              height: 4.h,
                              width: 80.w,
                              decoration: BoxDecoration(
                                  color: AppColor.green.withOpacity(0.35)),
                            ),
                          ),
                          Positioned(
                            top: 13.h,
                            left: -3.w,
                            child: controller.statistics.isEmpty
                                ? Container(
                                    height: 47.h,
                                    width: 100.w,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 3,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 50 / 48,
                                        crossAxisSpacing: 2.w,
                                        mainAxisSpacing: 1.h,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          margin: EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.sp),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(2, 2),
                                                    blurRadius: 5)
                                              ]),
                                          width: 40.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.arrow_upward_rounded,
                                                    color: AppColor.ink,
                                                  ),
                                                  Text(
                                                    '0',
                                                    style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 13.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text(
                                                DataLists.statistics[index],
                                                style: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  color: AppColor.ink
                                                      .withOpacity(0.70),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : Container(
                                    height: 47.h,
                                    width: 100.w,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: GridView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: 3,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 55 / 48,
                                        crossAxisSpacing: 2.w,
                                        mainAxisSpacing: 1.h,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          margin: EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15.sp),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black26,
                                                    offset: Offset(2, 2),
                                                    blurRadius: 5)
                                              ]),
                                          width: 40.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.arrow_upward_rounded,
                                                    color: AppColor.ink,
                                                  ),
                                                  Text(
                                                    '${(double.parse('${controller.statistics[index]['percentage']}')).toInt()}',
                                                    style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 13.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              Text(
                                                DataLists.statistics[index],
                                                style: TextStyle(
                                                  fontFamily: 'DMSans',
                                                  color: AppColor.ink
                                                      .withOpacity(0.70),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                          ),
                          Positioned(
                            top: 30.h,
                            left: -2.w,
                            child:
                                ProfileTitle(title: "Weekly Carbon Footprint"),
                          ),
                          Positioned(
                            top: 34.h,
                            left: 1.w,
                            child: Image(
                              image: const AssetImage(
                                  "assets/images/constatics.png"),
                              width: 88.w,
                            ),
                          ),
                          Positioned(
                            top: 46.h,
                            left: -3.w,
                            child: ProfileTitle(title: "Goals"),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Positioned(
                            top: 50.h,
                            left: 1.w,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    GoalsInfoContainer(
                                      widget: Icon(
                                        Icons.add,
                                        color: AppColor.white,
                                        size: 12.sp,
                                      ),
                                      title: 'Add Goal',
                                      color: AppColor.green,
                                      onPressed: () {
                                        Get.offAll(const ChallengesScreen());
                                      },
                                    ),
                                    SizedBox(
                                      width: 3.h,
                                    ),
                                    GoalsInfoContainer(
                                      onPressed: () {
                                        Get.offAll(const InProgressScreen());
                                      },
                                      widget: Text(
                                        "${controller.inprogress.length}",
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
                                      onPressed: () {
                                        Get.offAll(const AchievedScreen());
                                      },
                                      widget: Text(
                                        "${controller.achieved.length}",
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
                                      onPressed: () {

                                      },
                                      widget: Text(
                                        "0",
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
                  ),
                  Positioned(
                    top: 13.h,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 13.h,
                          width: 30.w,
                          child: const Center(
                            child: Image(
                              image: AssetImage("assets/images/profile.png"),
                            ),
                          ),
                        ),
                        Text(
                          '${myServices.sharedPreferences.getString("users_name")}',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            color: AppColor.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.sp,
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
    required this.onPressed,
  });

  final Widget? widget;
  final String title;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 9.sp,
                fontFamily: 'DMSans',
              ),
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
                fontSize: 14.sp,
                fontFamily: 'DMSans',
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
