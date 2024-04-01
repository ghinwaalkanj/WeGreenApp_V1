import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'package:we_green_v1/data/datasource/static/static.dart';
import 'package:we_green_v1/features/home/screens/widget/upcomings.dart';
import '../../../common_widgets/Drawer.dart';
import '../../../common_widgets/EndDrawer.dart';
import '../../../common_widgets/loading_screen.dart';
import '../../../core/class/statusrequest.dart';
import '../../../common_widgets/appBar.dart';
import '../../../core/services/services.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    MyServices myServices = Get.find();

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? const LoadingScreen()
          : Scaffold(
              key: controller.scaffoldKey,
              drawer: const MyDrawer(),
              endDrawer: const NotificationDrawer(),
              body: Stack(
                alignment: Alignment.center,
                children: [
                  bg(),
                  CustomAppBar(
                      image: Image.asset(AppImages.logo),
                      onPressed: () {
                        controller.scaffoldKey.currentState?.openDrawer();
                      },
                      onTap: () {
                        controller.scaffoldKey.currentState?.openEndDrawer();
                      }),
                  Positioned(
                    top: 26.h,
                    child: Text(
                      'Welcome ${myServices.sharedPreferences.getString("users_name")}',
                      style: TextStyle(
                        color: AppColor.green,
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  const Upcomings(),
                  Positioned(
                    top: 45.h,
                    child: Container(
                      height: 47.h,
                      width: 100.w,
                      padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 50 / 45,
                          crossAxisSpacing: 3.w,
                          mainAxisSpacing: 1.h,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Get.offAll(DataLists.routs[index]);
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(8.0),
                                  padding: EdgeInsets.only(bottom: 3.h),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(15.sp),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(2, 2),
                                          blurRadius: 5,
                                        )
                                      ]),
                                  width: 40.w,
                                  child: Image.asset(
                                    DataLists.imagePaths[index],
                                  ),
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9.sp,
                                        fontFamily: 'DMSans',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
