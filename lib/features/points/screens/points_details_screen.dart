import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/core/constant/Drawer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';
import '../../../core/constant/loading_screen.dart';
import '../controllers/points_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PointsDetailsScreen extends StatelessWidget {
  const PointsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PointsControllerImp());

    return GetBuilder<PointsControllerImp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
          ? LoadingScreen()
          : Scaffold(
              key: controller.scaffoldKey,
              drawer: const MyDrawer(),
              endDrawer: const NotificationDrawer(),
              body: Stack(
                alignment: Alignment.center,
                children: [
                  bg(),
                  CustomAppBar(
                      image: Transform.scale(
                        scale: 1,
                        origin: Offset(0, -5.h),
                        child: Image.asset(AppImages.points),
                      ),
                      onPressed: () {
                        controller.scaffoldKey.currentState?.openDrawer();
                      },
                      onTap: () {
                        controller.scaffoldKey.currentState?.openEndDrawer();
                      }),
                  Positioned(
                    top: 26.h,
                    child: Text(
                      'WeGreen Points',
                      style: TextStyle(
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
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_outlined),
                      color: Colors.black54,
                    ),
                  ),
                  Positioned(
                    top: 31.h,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                      height: 30.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: GoogleMap(
                        zoomControlsEnabled: false,
                        mapType: MapType.terrain,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(33.510414, 36.278336),
                          zoom: 15.4746,
                        ),
                        onMapCreated: (GoogleMapController controllermap) {
                          controller.controllerCompleter!
                              .complete(controllermap);
                        },
                        markers: controller.markers.toSet(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 63.h,
                    left: 7.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          (Icons.calendar_month),
                          color: AppColor.green,
                          size: 22.sp,
                        ),
                        Text(
                          'Every day open 08:00 - 23:00',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 68.h,
                    left: 7.w,
                    child: Container(
                      width: 85.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Talle Caf',
                            style: TextStyle(
                              color: AppColor.ink,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                          Text(
                            'cafe & restaurants',
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'Talle cafe is one of the very fastidious coffee shops about waste Talle cafe is one of the very fastidious coffee shops about waste ',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.h,
                    left: 7.w,
                    child: Container(
                      height: 15.h,
                      width: 90.w,
                      child: Image.asset(AppImages.footer),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
//
