import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'EndDrawerListTile.dart';
import 'color.dart';

class NotificationDrawer extends StatelessWidget {
  const NotificationDrawer({super.key});

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
                leading: Transform.scale(
                  scale: 1.5,
                  origin: Offset(-95.w,0),
                  child: Image.asset(AppImages.notification),
                ),
              ),
              ListTile(
                title: Text(
                  'NOTIFICATIONS',
                  style: TextStyle(
                    color: AppColor.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
