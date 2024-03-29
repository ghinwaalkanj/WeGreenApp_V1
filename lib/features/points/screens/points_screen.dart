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
import 'package:we_green_v1/features/points/screens/points_details_screen.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/EndDrawer.dart';
import '../../../core/constant/appBar.dart';
import '../../../core/constant/loading_screen.dart';
import '../controllers/points_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

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
                    child: GestureDetector(
                      onTap: (){
                        Get.to(PointsDetailsScreen());
                      },
                      child: Text(
                        'WeGreen Points',
                        style: TextStyle(
                          color: AppColor.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                        ),
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
                    top: 30.h,
                    child: Container(
                      height: 6.h,
                      width: 84.w,
                      padding: EdgeInsets.only(top: 1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Filter',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'Cairo',
                                  fontSize: 11.sp,
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black54,
                                size: 11.sp,
                              )
                            ],
                          ),
                          Text(
                            'sort by',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black54,
                              fontFamily: 'Cairo',
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 35.h,
                    child: Container(
                      height: 6.h,
                      width: 85.w,
                      padding: EdgeInsets.only(top: 1.h),
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 15.0,
                          ),
                          hintText: 'Search WeGreen places ...',
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.sp),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.sp),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.sp),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 41.h,
                    left: 7.w,
                    child: Container(
                      padding: EdgeInsets.only(top: 3.h),
                      height: 14.h,
                      width: 85.w,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 9.h,
                              width: 10.h,
                              margin: EdgeInsets.only(bottom: 2.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.sp),
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
                                    child: Image.network('https://wegreen.000webhostapp.com/upload/posts/${controller.catigory[index]['categories_image']}'),
                                  ),
                                  SizedBox(
                                    height: 0.5.h,
                                  ),
                                  Text(
                                    '${controller.catigory[index]['categories_title']}',
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
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 3.w,
                          );
                        },
                        itemCount: controller.catigory.length,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5.h,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                      height: 37.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: GoogleMap(
                        zoomControlsEnabled: false,
                        mapType: MapType.terrain,
                        initialCameraPosition: CameraPosition(
                          target:LatLng(33.510414, 36.278336),
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
                ],
              ),
            ),
    );
  }
}
//
