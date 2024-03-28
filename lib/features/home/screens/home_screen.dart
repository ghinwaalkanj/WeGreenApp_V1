import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'package:we_green_v1/data/datasource/static/static.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const MyDrawer(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          bg(),
          CustomAppBar(
            image: AppImages.logo,
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          Positioned(
            top: 26.h,
            child: Text(
              'Welcome Ghinwa',
              style: TextStyle(
                color: AppColor.green,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
              ),
            ),
          ),
          Positioned(
            top: 32.h,
            child: Container(
              height: 17.h,
              width: 88.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.sp),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(2, 2),
                        blurRadius: 5)
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 5.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.lightGreenAccent.withOpacity(0.7),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15.sp)),
                      ),
                      child: Text(
                        'Upcomings',
                        style: TextStyle(
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Ecolife Conference',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Text(
                                  '2024/02/25',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 45.h,
            child: Container(
              height: 47.h,
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 3.5.w),
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 50 / 45,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 1.h,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(8.0),
                        padding: EdgeInsets.only(bottom: 3.h),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: Colors.white,
                        ),
                        width: 40.w,
                        child: Image.asset(DataLists.imagePaths[index]),
                      ),
                      Positioned(
                        bottom: 0.h,
                        child: Container(
                          alignment: Alignment.center,
                          height: 5.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            color: AppColor.ink,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(15.sp)),
                          ),
                          child: Text(
                            DataLists.texts[index],
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
