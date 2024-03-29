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

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({super.key});

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
                child: Image.asset(AppImages.learn),
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
              'Post Detail',
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
                    child: Container(
                      height: 20.h,
                      width: 55.w,
                      child: Image.asset(
                        'assets/images/img2.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 21.h,
                    child: Column(
                      children: [
                        Text(
                          'SORT IT OUT MATERIALS',
                          style: TextStyle(
                            color: AppColor.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                        Text(
                          'A Guide For Sorting Your Waste',
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          'by WeGreen',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 11.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 5.h,
                    right: 0.w,
                    child: Column(
                      children: [
                        Icon(
                          Icons.bookmark_border_sharp,
                          color: Colors.black54,
                          size: 20.sp,
                        ),
                        SizedBox(height: 1.h,),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.black54,
                          size: 20.sp,
                        ),
                        SizedBox(height: 1.h,),
                        Icon(
                          Icons.share_outlined,
                          color: Colors.black54,
                          size: 20.sp,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 32.h,
                    child: Container(
                      width: 75.w,
                      height: 40.h,
                      child: Text(
                        'Waste   sorting   is   the  process  by   which waste    is       separated       into      different elements.      Waste       sorting     can  occur manually    at  the  household and collected throgh   curbside   collection   schemes,  orautomaticly      separated       in      materialsrecovery  facilities or mechanical  biologicaltreatment  systems.  hand sorting  was  the first method used  in  the  history  of waste sorting',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 11.sp,
                        ),
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
