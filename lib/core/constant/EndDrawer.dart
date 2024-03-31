import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'EndDrawerListTile.dart';
import 'color.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        width: 70.w,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 2.h,
              ),
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.menu,
                    size: 28.sp,
                    color: AppColor.ink,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  '  MENU',
                  style: TextStyle(
                    color: AppColor.green,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              EndDrawerListTile(
                title: 'settings',
                onPressed: () {
                  Get.back();
                },
              ),
              EndDrawerListTile(
                title: 'Yor Activity',
                onPressed: () {
                  // Get.to(() => SwitchScreen(
                  //       indexScreen: 1,
                  //     ));
                },
              ),
              EndDrawerListTile(
                title: 'About',
                onPressed: () {
                  //   Get.to(() => SwitchScreen(
                  //         indexScreen: 0,
                  //       ));
                },
              ),
              EndDrawerListTile(
                title: 'Account',
                onPressed: () {
                  // Get.to(() => SwitchScreen(
                  //       indexScreen: 2,
                  //     ));
                },
              ),
              EndDrawerListTile(
                title: 'Saved',
                onPressed: () {
                  // Get.to(() => const CallUs());
                },
              ),
              EndDrawerListTile(
                title: 'Help',
                onPressed: () {},
              ),
              Transform.scale(
                  scale: 1.3,
                  child: Image.asset(
                    AppImages.logo,
                  )),
              Transform.translate(
                offset: Offset(0, -6.h),
                child: Image.asset(AppImages.textLogo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
