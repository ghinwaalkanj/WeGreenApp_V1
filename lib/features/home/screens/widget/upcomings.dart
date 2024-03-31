import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/class/statusrequest.dart';
import '../../../../core/constant/color.dart';
import '../../controller/home_controller.dart';

class Upcomings extends StatelessWidget {
  const Upcomings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Positioned(
        top: 32.h,
        child: Container(
          height: 17.h,
          width: 88.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.sp),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26, offset: Offset(2, 2), blurRadius: 5)
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
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -4.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    height: 18.h,
                    child: ListView.separated(
                      itemCount: controller.upcoming.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              controller.upcoming[index]['upcomings_title'],
                              style: TextStyle(
                                color: Colors.black54,
                                fontFamily: 'DMSans',
                                fontWeight: FontWeight.bold,
                                fontSize: 11.sp,
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              controller.upcoming[index]['upcomings_date'],
                              style: TextStyle(
                                fontFamily: 'DMSans',
                                color: Colors.black45,
                                fontSize: 9.sp,
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 0.6.h,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
