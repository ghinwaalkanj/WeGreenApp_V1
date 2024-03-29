import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/home_data.dart';
import '../../../data/datasource/remote/points_data.dart';

abstract class PointsController extends GetxController {}

class PointsControllerImp extends PointsController {
  PointsData pointsData = PointsData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt cat = 1.obs;
  Completer<GoogleMapController>? controllerCompleter;
  CameraPosition? KGooglePlex = CameraPosition(
    target: LatLng(33.510414, 36.278336),
    zoom: 14.4746,
  );
  List<Marker> markers = [];

  List catigory = [];


  getCatigory() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await pointsData.catigory();
    if (StatusRequest.success == handlingData(response)) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        statusRequest = StatusRequest.success;
        update();
        catigory = [];
        catigory = mapData['data'];
        return true;
      } else {
        catigory = [];
        statusRequest = StatusRequest.success;
        update();
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }


  void updatecat(int num){
    cat.value = num;
    update();
  }


  @override
  void onInit() {
    getCatigory();
    controllerCompleter = Completer<GoogleMapController>();
    super.onInit();
  }

}
