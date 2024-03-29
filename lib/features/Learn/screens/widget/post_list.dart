import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/image_strings.dart';

class PostList extends StatelessWidget {
  final String title;
  final String tagline;
  final String addtag;
  final String content;
  final Widget image;
  final VoidCallback onPressed;

  const PostList({
    super.key,
    required this.title,
    required this.tagline,
    required this.addtag,
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
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 3.w),
                    height: 7.h,
                    child: image,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: AppColor.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp,
                        ),
                      ),
                      Text(
                        tagline,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 10.sp,
                        ),
                      ),
                      Text(
                       addtag,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.bookmark_border_sharp,
                            color: AppColor.ink,
                          ),
                          SizedBox(width: 3.w,),
                          Icon(
                            Icons.favorite_border,
                            color: AppColor.ink,
                          ),
                        ],
                      )
                    ],
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
