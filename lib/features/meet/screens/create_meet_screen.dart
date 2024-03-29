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
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';

class CreateMeetScreen extends StatelessWidget {
  const CreateMeetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
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
                scaffoldKey.currentState?.openDrawer();
              },
              onTap: () {
                scaffoldKey.currentState?.openEndDrawer();
              }),
          Positioned(
            top: 26.h,
            child: Text(
              'Create Event Or Activity',
              style: TextStyle(
                color: AppColor.green,
                fontFamily: 'DMSans',
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
                Get.back();
              },
              icon: Icon(Icons.arrow_back_outlined),
              color: Colors.black54,
            ),
          ),
          Positioned(
            top: 32.h,
            child: Container(
              height: 65.h,
              width: 85.w,
              padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2, 2),
                        blurRadius: 5)
                  ]),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 0.h,
                    left: 1.w,
                    child: Text(
                      'Enter Event Details',
                      style: TextStyle(
                        color: AppColor.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 3.h,
                    child: Container(
                      height: 5.h,
                      width: 75.w,
                      padding: EdgeInsets.only(top: 1.h),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 15.0,
                          ),
                          hintText: 'title',
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
                              color: AppColor.green,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    child: Container(
                      height: 5.h,
                      width: 75.w,
                      padding: EdgeInsets.only(top: 1.h),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 15.0,
                          ),
                          hintText: 'tagline',
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
                              color: AppColor.green,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 13.h,
                    child: Container(
                      height: 5.h,
                      width: 75.w,
                      padding: EdgeInsets.only(top: 1.h),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 15.0,
                          ),
                          hintText: 'add tags',
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
                    top: 18.h,
                    child: Container(
                      height: 5.h,
                      width: 75.w,
                      padding: EdgeInsets.only(top: 1.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 5.h,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Location',
                                  suffixIcon: Icon(Icons.location_on_outlined),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 1.h,
                                    horizontal: 4.w
                                  ),
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
                                      color: AppColor.green,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0), // Adjust the gap between the text fields
                          Expanded(
                            child: Container(
                              height: 5.h,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Date',
                                  suffixIcon: Icon(Icons.calendar_today),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 1.h,
                                      horizontal: 4.w
                                  ),
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
                                      color: AppColor.green,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 24.h,
                    child: Container(
                      width: 75.w,
                      padding: EdgeInsets.only(top: 1.h),
                      child: TextField(
                        maxLines: 9,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 15.0,
                          ),
                          hintText: 'content ...',
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
                              color: AppColor.green,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 3.h,
                    left: 2.w,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              'edit layput',
                              style: TextStyle(
                                color: Colors.black87,
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
                        SizedBox(width: 4.w,),
                        Row(
                          children: [
                            MaterialButton(
                              height: 4.h,
                              minWidth: 23.w,
                              color: AppColor.green,
                              onPressed: () {
                               // Get.to(NavigationMenu());
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(30),
                              ),
                              child: Text(
                                "verify",
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 1.w,),
                            MaterialButton(
                              height: 4.h,
                              minWidth: 23.w,
                              color: Colors.black26,
                              onPressed: () {
                               // Get.to(NavigationMenu());
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(30),
                              ),
                              child: Text(
                                "draft",
                                style: TextStyle(
                                    color: AppColor.white,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 12.h,
                    child: Container(
                      width: 76.w,
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.black26,
                            thickness: 0.2.h,
                            endIndent: 1.w,
                            indent: 1.w,
                          ),
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.image_outlined,
                                  color: Colors.black54,
                                  size: 23.sp,
                                ),
                                Icon(
                                  Icons.video_call_outlined,
                                  color: Colors.black54,
                                  size: 23.sp,
                                ),
                                Icon(
                                  Icons.link,
                                  color: Colors.black54,
                                  size: 23.sp,
                                ),
                                Icon(
                                  Icons.list,
                                  color: Colors.black54,
                                  size: 23.sp,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//
