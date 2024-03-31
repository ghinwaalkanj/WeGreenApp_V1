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
import 'package:we_green_v1/features/Learn/screens/widget/post_type.dart';
import 'package:we_green_v1/navigation_menu.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';
import '../../../core/constant/loading_screen.dart';
import '../../add_waste/screens/widget/circle_category.dart';
import '../controller/profile_controller.dart';

class InProgressScreen extends StatelessWidget {
  const InProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());

    return GetBuilder<ProfileControllerImp>(
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
                      'InProgress Goals',
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
                    top: 32.h,
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
                          hintText: 'Search goals, challenge ...',
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
                    top: 34.h,
                    child: Container(
                      width: 85.w,
                      padding: EdgeInsets.only(top: 1.h),
                      height: 70.h,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                              height: 13.h,
                              width: 10.h,
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                                  controller.inprogress[index]['goals_waste']=='metal'?  Container(
                                    width: 17.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.ink.withOpacity(0.75),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Image(
                                          image: AssetImage( 'assets/images/image-removebg-preview (15) 1.png'),
                                          fit: BoxFit.fill,
                                        )),
                                  )
                                 :controller.inprogress[index]['goals_waste']=='Paper'? Container(
                                    width: 17.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.ink.withOpacity(0.75),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Image(
                                          image: AssetImage('assets/images/image-removebg-preview (11) 1.png'),
                                          fit: BoxFit.fill,
                                        )),
                                  )
                                      :controller.inprogress[index]['goals_waste']=='Plastic'? Container(
                                    width: 17.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.ink.withOpacity(0.75),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Image(
                                          image: AssetImage('assets/images/Icon_LandfillWaste-removebg-preview 1.png'),
                                          fit: BoxFit.fill,
                                        )),
                                  )
                                      :controller.inprogress[index]['goals_waste']=='Glass'? Container(
                                    width: 17.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.ink.withOpacity(0.75),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Image(
                                          image: AssetImage( 'assets/images/image-removebg-preview (12) 4.png'),
                                          fit: BoxFit.fill,
                                        )),
                                  )
                                      :controller.inprogress[index]['goals_waste']=='Food'?Container(
                                    width: 17.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.ink.withOpacity(0.75),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Image(
                                          image: AssetImage( 'assets/images/image-removebg-preview (14) 1.png'),
                                          fit: BoxFit.fill,
                                        )),
                                  )
                                      :controller.inprogress[index]['goals_waste']=='Special'?Container(
                                    width: 17.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.ink.withOpacity(0.75),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Image(
                                          image: AssetImage( 'assets/images/image-removebg-preview (16) 1.png'),
                                          fit: BoxFit.fill,
                                        )),
                                  )
                                      :controller.inprogress[index]['goals_waste']=='E-Waste'?Container(
                                    width: 17.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.ink.withOpacity(0.75),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Image(
                                          image: AssetImage( 'assets/images/image-removebg-preview (17) 1.png'),
                                          fit: BoxFit.fill,
                                        )),
                                  )
                                      :controller.inprogress[index]['goals_waste']=='Drugs'?Container(
                                    width: 17.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.ink.withOpacity(0.75),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Image(
                                          image: AssetImage( 'assets/images/image-removebg-preview (19) 1.png'),
                                          fit: BoxFit.fill,
                                        )),
                                  )
                                      :controller.inprogress[index]['goals_waste']=='Non-Recyclable'?Container(
                                    width: 17.w,
                                    height: 8.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.ink.withOpacity(0.75),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Image(
                                          image: AssetImage( 'assets/images/image-removebg-preview (20) 1.png'),
                                          fit: BoxFit.fill,
                                        )),
                                  )
                                      :const SizedBox(),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.inprogress[index]['goals_waste'],
                                          style: TextStyle(
                                            color: AppColor.green,
                                            fontFamily: 'DMSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Text(
                                          controller.inprogress[index]['goals_procedure']==1?'Recycle':controller.inprogress[index]['goals_procedure']==2?'Reuse':'Reduce',
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: 'DMSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9.sp,
                                          ),
                                        ),
                                        Text(
                                          '${controller.inprogress[index]['goals_amount']} Pieces',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontFamily: 'DMSans',
                                            fontSize: 8.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 11.w,
                                  ),
                                  MaterialButton(
                                    height: 4.h,
                                    minWidth: 23.w,
                                    color: AppColor.green,
                                    onPressed: () {
                                      controller.Achieve(controller.inprogress[index]['goals_id']);
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "achieve",
                                      style: TextStyle(
                                        color: AppColor.white,
                                        fontFamily: 'DMSans',
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
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
                        itemCount: controller.inprogress.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
