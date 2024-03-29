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
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_outlined),
                      color: Colors.black54,
                    ),
                  ),
                  Positioned(
                      top: 26.h,
                      right: 5.w,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(CreateMeetScreen());
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
                                  color: AppColor.white,
                                  fontSize: 11.sp,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      )),
                  Positioned(
                    top: 34.h,
                    child: Container(
                      width: 82.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PostType(
                            text: 'General',
                            onPressed: () {
                              controller.updatecat(1);
                            },
                            color: controller.cat == 1
                                ? AppColor.ink
                                : Colors.grey,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          PostType(
                            text: 'Your Posts',
                            onPressed: () {
                              controller.updatecat(2);
                            },
                            color: controller.cat == 2
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
                    top: 40.h,
                    child: Container(
                      height: 6.h,
                      width: 85.w,
                      padding: EdgeInsets.only(top: 1.h),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 15.0,
                          ),
                          hintText: 'Search events, workshop ...',
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.sp),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.sp),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.sp),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 45.h,
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
                                  fontFamily: 'Cairo',
                                  fontSize: 11.sp,
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black54,
                                size: 11.sp,
                              )
                            ],
                          ),
                          Text(
                            'sort by',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black54,
                              fontFamily: 'Cairo',
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 46.h,
                    child: MeetList(
                      title: 'ZERO WASTE CONFERENC',
                      tagline: 'by ecolifetube',
                      content:
                          'Waste   sorting   is   the  process  by   which',
                      image: Image.asset('assets/images/img2.png'),
                      onPressed: () {
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
                                      Icon(
                                        Icons.bookmark_border_sharp,
                                        color: AppColor.ink,
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Icon(
                                        Icons.favorite_border,
                                        color: AppColor.ink,
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: AppColor.black,
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                top: 6.h,
                                child: Text(
                                  'WASTE MANAGEMENT WORKSHOP',
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
                                top: 9.h,
                                child: Text(
                                  'by WeGreen',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.black54,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 13.h,
                                child: Container(
                                  width: 75.w,
                                  height: 40.h,
                                  child: Text(
                                    'Waste   sorting   is   the  process  by   which waste    is       separated       into      different elements.      Waste       sorting     can  occur manually    at  the  household and collected throgh   curbside   collection   schemes',
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black87,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 28.h,
                                child: Container(
                                    height: 17.h,
                                    child: Image.asset(
                                      AppImages.ltp,
                                    )),
                              ),
                              Positioned(
                                top: 29.h,
                                left: 15.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Online',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: AppColor.ink,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      '10 December 2021',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: AppColor.ink,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      'Free',
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: AppColor.ink,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
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
                                    //Get.to(NavigationMenu());
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Text(
                                    "join",
                                    style: TextStyle(
                                        color: AppColor.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                      },
                      date: '21 February 2024',
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
