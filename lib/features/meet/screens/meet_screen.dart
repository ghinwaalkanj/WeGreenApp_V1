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
import 'package:we_green_v1/features/Learn/screens/widget/post_type.dart';
import 'package:we_green_v1/features/meet/screens/widget/meet_list.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';
import '../../../core/constant/loading_screen.dart';
import '../../../navigation_menu.dart';
import '../controller/meet_controller.dart';
import 'create_meet_screen.dart';

class MeetScreen extends StatelessWidget {
  const MeetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MeetControllerImp());

    return GetBuilder<MeetControllerImp>(
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
                        scale: 1,
                        origin: Offset(0, -7.h),
                        child: Image.asset(AppImages.meet),
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
                      'Meet',
                      style: TextStyle(
                        color: AppColor.green,
                        fontFamily: 'DMSans',
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
                        Get.offAll(const NavigationMenu());
                      },
                      icon: const Icon(Icons.arrow_back_outlined),
                      color: Colors.black54,
                    ),
                  ),
                  Positioned(
                      top: 26.h,
                      right: 5.w,
                      child: GestureDetector(
                        onTap: () {
                          Get.offAll(const CreateMeetScreen());
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 3.w),
                          alignment: Alignment.center,
                          height: 5.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                              color: AppColor.green,
                              borderRadius: BorderRadius.circular(10.sp)),
                          child: Row(
                            children: [
                              Text(
                                'Create \nAn Event',
                                style: TextStyle(
                                  fontFamily: 'DMSans',
                                  color: AppColor.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8.sp,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 17.sp,
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                    top: 35.h,
                    child: Container(
                      height: 4.5.h,
                      width: 85.w,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0.h,
                            horizontal: 15.0,
                          ),
                          hintText: 'Search events, workshop ...',
                          hintStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 11.sp,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            size: 16.sp,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.sp),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.sp),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.sp),
                            borderSide: const BorderSide(
                              color: AppColor.green,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 39.h,
                    child: Container(
                      height: 6.h,
                      width: 84.w,
                      padding: EdgeInsets.only(top: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Filter',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'DMSans',
                                  fontSize: 10.sp,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black54,
                                size: 9.sp,
                              )
                            ],
                          ),
                          Text(
                            'sort by',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black54,
                              fontFamily: 'DMSans',
                              fontSize: 9.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    child: Container(
                      width: 87.w,
                      padding: EdgeInsets.only(top: 1.h),
                      height: 60.h,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.dialog(Container(
                                height: 80.h,
                                width: 80.w,
                                padding: EdgeInsets.fromLTRB(5.w, 3.h, 5.w, 0),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 7.w,
                                  vertical: 15.h,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.sp)),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.bookmark_border_sharp,
                                              color: AppColor.ink,
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            const Icon(
                                              Icons.favorite_border,
                                              color: AppColor.ink,
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Icon(
                                            Icons.close,
                                            color: AppColor.black,
                                          ),
                                        )
                                      ],
                                    ),
                                    Positioned(
                                      top: 6.h,
                                      child: Text(
                                        '${controller.meet[index]['meet_title']}',
                                        style: TextStyle(
                                          color: AppColor.green,
                                          decoration: TextDecoration.none,
                                          fontFamily: 'DMSans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 10.h,
                                      child: Text(
                                        '${controller.meet[index]['meet_tagline']}',
                                        style: TextStyle(
                                          fontFamily: 'DMSans',
                                          decoration: TextDecoration.none,
                                          color: Colors.black54,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 13.h,
                                      child: Container(
                                        width: 75.w,
                                        height: 40.h,
                                        child: Text(
                                          '${controller.meet[index]['meet_content']}',
                                          style: TextStyle(
                                            fontFamily: 'DMSans',
                                            decoration: TextDecoration.none,
                                            color: Colors.black87,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 33.h,
                                      child: Container(
                                          height: 17.h,
                                          child: Image.asset(
                                            AppImages.ltp,
                                          )),
                                    ),
                                    Positioned(
                                      top: 34.h,
                                      left: 10.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Online',
                                            style: TextStyle(
                                              fontFamily: 'DMSans',
                                              decoration: TextDecoration.none,
                                              color: AppColor.ink,
                                              fontSize: 9.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Text(
                                            '${controller.meet[index]['meet_date']}',
                                            style: TextStyle(
                                              fontFamily: 'DMSans',
                                              decoration: TextDecoration.none,
                                              color: AppColor.ink,
                                              fontSize: 9.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Text(
                                            'Free',
                                            style: TextStyle(
                                              fontFamily: 'DMSans',
                                              decoration: TextDecoration.none,
                                              color: AppColor.ink,
                                              fontSize: 9.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      top: 34.h,
                                      right: 0.w,
                                      child: Container(
                                        height: 10.h,
                                        width: 30.w,
                                        child: Image.network(
                                          'https://wegreen.000webhostapp.com/upload/posts/${controller.meet[index]['meet_image']}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 4.h,
                                      right: 2.w,
                                      child: MaterialButton(
                                        height: 5.h,
                                        minWidth: 30.w,
                                        color: AppColor.green,
                                        onPressed: () {
                                          Get.back();
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          "join",
                                          style: TextStyle(
                                              color: AppColor.white,
                                              fontFamily: 'DMSans',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                            },
                            child: Container(
                              height: 13.h,
                              width: 10.h,
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.sp),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(1, 1),
                                      blurRadius: 5,
                                    )
                                  ]),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 3.w,
                                    top: 1.h,
                                    child: Container(
                                      width: 78.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  '${controller.meet[index]['meet_title']}',
                                                  style: TextStyle(
                                                    color: AppColor.green,
                                                    fontFamily: 'DMSans',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.bookmark_border_sharp,
                                                  color: AppColor.ink,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            '${controller.meet[index]['meet_tagline']}',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.black54,
                                                    size: 17.sp,
                                                  ),
                                                  Text(
                                                    'online',
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 9.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.access_time_rounded,
                                                    color: Colors.black54,
                                                    size: 17.sp,
                                                  ),
                                                  Text(
                                                    '${controller.meet[index]['meet_date']}',
                                                    style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      color: Colors.black87,
                                                      fontSize: 9.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.money,
                                                    color: Colors.black54,
                                                    size: 17.sp,
                                                  ),
                                                  Text(
                                                    'Free',
                                                    style: TextStyle(
                                                      fontFamily: 'DMSans',
                                                      color: Colors.black87,
                                                      fontSize: 9.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 2.h,
                          );
                        },
                        itemCount: controller.meet.length,
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
