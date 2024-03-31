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
import 'package:we_green_v1/navigation_menu.dart';
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
                  const bg(),
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
                        Get.offAll(NavigationMenu());
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
                          Get.offAll(CreatePostScreen());
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
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'DMSans',
                                  fontSize: 9.sp,
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
                    child: SizedBox(
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
                            height: 4.h,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 0.3.w,
                              indent: 0.5.h,
                              endIndent: 0.5.h,
                            ),
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
                    top: 38.5.h,
                    child: Container(
                      color: Colors.black26,
                      height: 0.2.w,
                      width: 85.w,
                    ),
                  ),
                  Positioned(
                    top: 40.h,
                    child: SizedBox(
                      height: 4.5.h,
                      width: 85.w,
                      // padding: EdgeInsets.only(top: 1.h),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 0.h,
                            horizontal: 15.0,
                          ),
                          hintText: 'Search article, news or tips',
                          hintStyle: TextStyle(
                            fontFamily: 'DMSans',
                            fontSize: 11.sp,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            size: 15.sp,
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
                    top: 43.5.h,
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
                              fontFamily: 'DMSans',
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.cat==1?Positioned(
                    top: 46.h,
                    child: Container(
                      width: 85.w,
                      padding: EdgeInsets.only(top: 1.h),
                      height: 50.h,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to( PostDetailsScreen(posts: controller.posts, index: index,));
                            },
                            child: Container(
                              height: 13.h,
                              width: 10.h,
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  controller.posts[index]['posts_image']=='empty'?SizedBox():Container(
                                    width: 25.w,
                                    padding: EdgeInsets.only(
                                      left: 3.w,
                                    ),
                                    height: 7.h,
                                    child: Image.network(
                                      'https://wegreen.000webhostapp.com/upload/posts/${controller.posts[index]['posts_image']}',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.posts[index]['posts_title'],
                                          style: TextStyle(
                                            color: AppColor.green,
                                            fontFamily: 'DMSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Text(
                                          controller.posts[index]['posts_tagline'],
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'DMSans',
                                            fontSize: 8.sp,
                                          ),
                                        ),
                                        Text(
                                          controller.posts[index]['posts_addtags'],
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'DMSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.bookmark_border_sharp,
                                              color: AppColor.ink,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Icon(
                                              Icons.favorite_border,
                                              color: AppColor.ink,
                                              size: 15.sp,
                                            ),
                                          ],
                                        )
                                      ],
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
                        itemCount: controller.posts.length,
                      ),
                    ),
                  ):Positioned(
                    top: 46.h,
                    child: Container(
                      width: 85.w,
                      padding: EdgeInsets.only(top: 1.h),
                      height: 50.h,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to( PostDetailsScreen(posts: controller.myposts, index: index,));
                            },
                            child: Container(
                              height: 13.h,
                              width: 10.h,
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  controller.myposts[index]['posts_image']=='empty'?SizedBox():Container(
                                    width: 25.w,
                                    padding: EdgeInsets.only(
                                      left: 3.w,
                                    ),
                                    height: 7.h,
                                    child: Image.network(
                                      'https://wegreen.000webhostapp.com/upload/posts/${controller.myposts[index]['posts_image']}',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.myposts[index]['posts_title'],
                                          style: TextStyle(
                                            color: AppColor.green,
                                            fontFamily: 'DMSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Text(
                                          controller.myposts[index]['posts_tagline'],
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'DMSans',
                                            fontSize: 8.sp,
                                          ),
                                        ),
                                        Text(
                                          controller.myposts[index]['posts_addtags'],
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'DMSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.5.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.bookmark_border_sharp,
                                              color: AppColor.ink,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Icon(
                                              Icons.favorite_border,
                                              color: AppColor.ink,
                                              size: 15.sp,
                                            ),
                                          ],
                                        )
                                      ],
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
                        itemCount: controller.myposts.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
