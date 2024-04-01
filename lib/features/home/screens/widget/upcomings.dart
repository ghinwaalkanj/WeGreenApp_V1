import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/class/statusrequest.dart';
import '../../../../core/constant/color.dart';
import '../../../calender/screens/calender_screen.dart';
import '../../controller/home_controller.dart';

class Upcomings extends StatelessWidget {
  const Upcomings({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Positioned(
        top: 32.h,
        child: GestureDetector(
          onTap: () {
            Get.offAll(const CalenderScreen());
          },
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
                    blurRadius: 5,
                  )
                ]),
            child: Stack(
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
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.fromLTRB(2.w, 1.h, 2.w, 0),
                  height: 15.h,
                  child: ListView.separated(
                    itemCount: controller.upcoming.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            controller.upcoming[index]['date_title'],
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
                            DateFormat('d MMM yyyy').format(DateTime.parse(
                                controller.upcoming[index]['date_date'])),
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              color: Colors.black45,
                              fontSize: 9.sp,
                            ),
                          ),
                          Text(
                            controller.upcoming[index]['date_time'],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
