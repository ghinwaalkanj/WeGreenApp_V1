import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'package:we_green_v1/features/Learn/screens/learn_screen.dart';
import '../../../common_widgets/Drawer.dart';
import '../../../common_widgets/EndDrawer.dart';
import '../../../common_widgets/loading_screen.dart';
import '../../../core/class/statusrequest.dart';
import '../../../common_widgets/appBar.dart';
import '../controller/learn_controller.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LearnControllerImp());

    return GetBuilder<LearnControllerImp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? const LoadingScreen()
          : Scaffold(
              key: controller.scaffoldKey,
              drawer: const MyDrawer(),
              endDrawer: const NotificationDrawer(),
              body: Form(
                key: controller.form,
                child: Stack(
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
                        'Create A Post',
                        style: TextStyle(
                          color: AppColor.green,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25.h,
                      left: 5.w,
                      child: IconButton(
                        onPressed: () {
                          Get.offAll(LearnScreen());
                        },
                        icon: const Icon(Icons.arrow_back_outlined),
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
                                'Enter Post Details',
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 4.h,
                              child: SizedBox(
                                height: 5.h,
                                width: 75.w,
                                child: TextField(
                                  style: const TextStyle(
                                    fontFamily: 'DMSans',
                                  ),
                                  controller: controller.title,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                    ),
                                    hintText: 'title',
                                    hintStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 11.sp,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
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
                              top: 10.h,
                              child: SizedBox(
                                height: 5.h,
                                width: 75.w,
                                child: TextField(
                                  style: const TextStyle(
                                    fontFamily: 'DMSans',
                                  ),
                                  controller: controller.tagline,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                    ),
                                    hintText: 'tagline',
                                    hintStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 11.sp,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
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
                              top: 16.h,
                              child: SizedBox(
                                height: 5.h,
                                width: 75.w,
                                child: TextField(
                                  style: const TextStyle(
                                    fontFamily: 'DMSans',
                                  ),
                                  controller: controller.addtags,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 5.w,
                                    ),
                                    hintText: 'add tags',
                                    hintStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 11.sp,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
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
                              top: 22.h,
                              child: SizedBox(
                                width: 75.w,
                                child: TextField(
                                  style: const TextStyle(
                                    fontFamily: 'DMSans',
                                  ),
                                  controller: controller.content,
                                  maxLines: 8,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 1.h,
                                      horizontal: 15.0,
                                    ),
                                    hintText: 'content ...',
                                    hintStyle: TextStyle(
                                      fontFamily: 'DMSans',
                                      fontSize: 11.sp,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(11.sp),
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
                              bottom: 2.h,
                              left: 2.w,
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'edit layput',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'DMSans',
                                          fontSize: 8.sp,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.black54,
                                        size: 9.sp,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Row(
                                    children: [
                                      MaterialButton(
                                        height: 4.h,
                                        minWidth: 23.w,
                                        color: AppColor.green,
                                        onPressed: () {
                                          controller.addPost(context);
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          "post",
                                          style: TextStyle(
                                            color: AppColor.white,
                                            fontFamily: 'DMSans',
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      MaterialButton(
                                        height: 4.h,
                                        minWidth: 23.w,
                                        color: Colors.grey,
                                        onPressed: () {
                                          Get.offAll(LearnScreen());
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Text(
                                          "draft",
                                          style: TextStyle(
                                            color: AppColor.white,
                                            fontFamily: 'DMSans',
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            icon: Icon(
                                              Icons.image_outlined,
                                              size: 23.sp,
                                            ),
                                            color: Colors.black54,
                                            onPressed: () {
                                              controller.pickImage(
                                                  ImageSource.gallery);
                                            },
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
              )),
    );
  }
}
