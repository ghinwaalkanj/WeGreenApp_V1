import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constant/color.dart';

class MeetList extends StatelessWidget {
  final String title;
  final String tagline;
  final String date;
  final String content;
  final Widget image;
  final VoidCallback onPressed;

  const MeetList({
    super.key,
    required this.title,
    required this.tagline,
    required this.date,
    required this.content,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      padding: EdgeInsets.only(top: 1.h),
      height: 50.h,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 13.h,
              width: 10.h,
              margin: EdgeInsets.symmetric(horizontal: 1.w),
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
              child: Stack(
                children: [
                  Positioned(
                    left: 3.w,
                    top: 1.h,
                    child: Container(
                      width: 75.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  color: AppColor.green,
                                  fontFamily: 'DMSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                ),
                              ),
                              Icon(
                                Icons.bookmark_border_sharp,
                                color: AppColor.ink,
                              ),
                            ],
                          ),
                          Text(
                            tagline,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 10.sp,
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    'online',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_rounded,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    '21 December 2024',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.money,
                                    color: Colors.black54,
                                  ),
                                  Text(
                                    'Free',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
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
          return SizedBox(
            height: 2.h,
          );
        },
        itemCount: 5,
      ),
    );
  }
}
