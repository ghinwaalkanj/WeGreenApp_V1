import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'package:we_green_v1/features/green_data/screens/green_data_screen.dart';
import '../../../common_widgets/Drawer.dart';
import '../../../common_widgets/EndDrawer.dart';
import '../../../common_widgets/loading_screen.dart';
import '../../../core/class/statusrequest.dart';
import '../../../common_widgets/appBar.dart';
import '../controller/tips_controller.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TipsControllerImp());

    return GetBuilder<TipsControllerImp>(
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
                  CustomAppBar(
                      image: Transform.scale(
                        scale: 0.3,
                        origin: Offset(0, -11.h),
                        child: Image.asset(AppImages.tips),
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
                      'Tips',
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
                        Get.offAll(const GreenDataScreen());
                      },
                      icon: const Icon(Icons.arrow_back_outlined),
                      color: Colors.black54,
                    ),
                  ),
                  Positioned(
                    top: 33.h,
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
                          hintText: 'Search on tips',
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
                    top: 36.h,
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
                  Positioned(
                    top: 38.h,
                    child: Container(
                      width: 95.w,
                      margin: EdgeInsets.only(top: 3.h),
                      height: 60.h,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.dialog(Container(
                                height: 80.h,
                                width: 80.w,
                                padding: EdgeInsets.fromLTRB(5.w, 0.h, 5.w, 0),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5.w,
                                  vertical: 15.h,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.sp)),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      right: 1.w,
                                      top: 1.h,
                                      child: IconButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: AppColor.black,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 7.h,
                                      child: Container(
                                        width: 25.h,
                                        height: 20.h,
                                        padding: EdgeInsets.only(
                                          left: 3.w,
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.sp),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                'assets/images/img2.png',
                                              ),
                                              fit: BoxFit.fill
                                            )
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 29.h,
                                      child: Container(
                                        width: 77.w,
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          'Use Cloth Gift Bags And Stop Ripping The Paper Gifts!',
                                          style: TextStyle(
                                            fontFamily: 'DMSans',
                                            decoration: TextDecoration.none,
                                            color: AppColor.ink,
                                            fontSize: 11.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 36.h,
                                      child: SizedBox(
                                        width: 80.w,
                                        height: 40.h,
                                        child: Text(
                                          'Instead of using paper cups or bottled water, use coffee mugs or personal water bottles Instead of using paper cups or bottled water, use coffee mugs or personal water bottles Instead of using paper cups or bottled water, use coffee mugs or personal water bottles \n\n Instead of using paper cups or bottled water, use coffee mugs or personal water bottles Instead of using paper cups or bottled water, use coffee mugs or personal water bottles Instead of using paper cups or bottled  ',
                                          style: TextStyle(
                                            fontFamily: 'DMSans',
                                            color: Colors.black87,
                                            fontWeight: FontWeight.normal,
                                            decoration: TextDecoration.none,
                                            fontSize: 9.sp,
                                          ),
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
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 13.h,
                                    height: 13.h,
                                    padding: EdgeInsets.only(
                                      left: 3.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.sp),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/img2.png',
                                        ),
                                      )
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Flexible(
                                    child: SingleChildScrollView(
                                      physics: const NeverScrollableScrollPhysics(),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Instead of using paper cups or bottled water, use coffee mugs or personal water bottles',
                                            style: TextStyle(
                                              color: AppColor.ink,
                                              fontFamily: 'DMSans',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 9.sp,
                                            ),
                                          ),
                                          Text(
                                            'Instead of using paper cups or bottled water, use coffee mugs or personal water bottles',
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontFamily: 'DMSans',
                                              fontSize: 8.sp,
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
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: Colors.black38,
                            thickness: 0.1.h,
                            endIndent: 0.w,
                            indent: 0.w,
                          );
                        },
                        itemCount: 6,
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
