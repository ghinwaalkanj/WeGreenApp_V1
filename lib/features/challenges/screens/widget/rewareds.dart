import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/challenges/screens/widget/procedures_types.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/image_strings.dart';
import '../../../../navigation_menu.dart';
import '../../controller/challenges_controller.dart';

class Rewards extends StatelessWidget {
  const Rewards({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChallengesControllerImp());

    return Column(
      children: [
        Container(
          height: 6.h,
          padding: EdgeInsets.only(top: 1.h),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 15.0,
              ),
              hintText: 'Search reward',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(11.sp),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(11.sp),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(11.sp),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 3.h),
          height: 14.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 9.h,
                  width: 10.h,
                  margin: EdgeInsets.only(bottom: 2.h),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.circular(10.sp),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(2, 2),
                            blurRadius: 5)
                      ]),
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        child: Image.asset(
                            AppImages.recycle),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        'recycle',
                        style: TextStyle(
                          color: AppColor.ink,
                          fontWeight: FontWeight.w500,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) {
              return SizedBox(
                width: 3.w,
              );
            },
            itemCount: 5,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 1.h),
          height: 34.h,
          child: ListView.separated(
            itemBuilder:
                (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: 9.h,
                  width: 10.h,
                  margin: EdgeInsets.symmetric(
                      horizontal: 1.w),
                  decoration: BoxDecoration(
                      color: Color(0xffD9F9A5),
                      borderRadius:
                      BorderRadius.circular(10.sp),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 5,
                        )
                      ]),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 3.w),
                        height: 7.h,
                        child: Image.asset(
                            AppImages.discount),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      VerticalDivider(
                        color: AppColor.green,
                        width: 0.6.w,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '25% Discount',
                            style: TextStyle(
                              color: AppColor.ink,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            'in Elsa 2nd Hand Store',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder:
                (BuildContext context, int index) {
              return SizedBox(
                height: 2.h,
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
