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
import 'package:we_green_v1/features/Learn/controller/learn_controller.dart';
import 'package:we_green_v1/features/Learn/screens/post_details_screen.dart';
import 'package:we_green_v1/features/Learn/screens/widget/post_list.dart';
import 'package:we_green_v1/features/Learn/screens/widget/post_type.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';
import '../../../core/constant/loading_screen.dart';
import 'create_post_screen.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LearnControllerImp());

    return GetBuilder<LearnControllerImp>(
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
                        child: Image.asset(AppImages.learn),
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
                      'Learn',
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
                      top: 26.h,
                      right: 5.w,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(CreatePostScreen());
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
                                'Create \nA post',
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 11.sp,
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
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
                          hintText: 'Search article, news or tips',
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
                    child: PostList(
                      title: 'WHATS IS ZERO WASTES ?',
                      tagline: 'Deep Learning Resource',
                      addtag: 'By WeGreen',
                      content:
                          'Waste   sorting   is   the  process  by   which',
                      image: Image.asset('assets/images/img1.png'),
                      onPressed: () {
                        Get.to(PostDetailsScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
