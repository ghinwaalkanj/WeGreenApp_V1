import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common_widgets/bg.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/Drawer.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/image_strings.dart';
import '../../../core/constant/loading_screen.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileControllerImp());

    return GetBuilder<ProfileControllerImp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? const LoadingScreen()
          : Scaffold(
              key: controller.scaffoldKey,
              drawer: const MyDrawer(),
              endDrawer: const NotificationDrawer(),
              body: Stack(
                alignment: Alignment.center,
                children: [
                  const bg(),
                  CustomAppBar(
                      image: AppImages.profile,
                      onPressed: () {
                        controller.scaffoldKey.currentState?.openDrawer();
                      },
                      onTap: () {
                        controller.scaffoldKey.currentState?.openEndDrawer();
                      }),
                  Positioned(
                    top: 31.h,
                    child: Text(
                      'Ghinwa Alking',
                      style: TextStyle(
                        color: AppColor.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35.h,
                    child: Container(
                      height: 5.h,
                      child: ListView.builder(
                        itemCount: 4,
                          itemBuilder: (BuildContext context,int index){

                      }),
                    )
                  ),
                ],
              ),
            ),
    );
  }
}
