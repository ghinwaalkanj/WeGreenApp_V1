import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'package:we_green_v1/features/Learn/screens/learn_screen.dart';
import '../../../common_widgets/Drawer.dart';
import '../../../common_widgets/EndDrawer.dart';
import '../../../common_widgets/appBar.dart';

class PostDetailsScreen extends StatelessWidget {
  final List posts;
  final int index;

  const PostDetailsScreen({
    required this.posts,
    required this.index,
  });

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
                fontFamily: 'DMSans',
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
                Get.offAll(const LearnScreen());
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
                    child: Column(
                      children: [
                        posts[index]['posts_image'] == 'empty'
                            ? SizedBox()
                            : Container(
                                height: 20.h,
                                width: 55.w,
                                child: Image.network(
                                  'https://wegreen.000webhostapp.com/upload/posts/${posts[index]['posts_image']}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                        Text(
                          '${posts[index]['posts_title']}',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            color: AppColor.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          '${posts[index]['posts_tagline']}',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          '${posts[index]['posts_addtags']}',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            color: Colors.black54,
                            fontSize: 11.sp,
                          ),
                        ),
                        SizedBox(
                          width: 75.w,
                          height: 40.h,
                          child: Text(
                            '${posts[index]['posts_content']}',
                            style: TextStyle(
                              fontFamily: 'DMSans',
                              color: Colors.black87,
                              fontSize: 10.sp,
                            ),
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
                          color: AppColor.ink,
                          size: 20.sp,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: AppColor.ink,
                          size: 20.sp,
                        ),
                        SizedBox(
                          height: 1.5.h,
                        ),
                        Icon(
                          Icons.share_outlined,
                          color: AppColor.ink,
                          size: 20.sp,
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
    );
  }
}
//
