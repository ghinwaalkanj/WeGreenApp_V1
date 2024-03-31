import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/points_data.dart';
import '../screens/points_details_screen.dart';

abstract class PointsController extends GetxController {}

class PointsControllerImp extends PointsController {
  PointsData pointsData = PointsData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt cat = 1.obs;
  Completer<GoogleMapController>? controllerCompleter;
  CameraPosition? initialCameraPosition;
  List<Marker> markers = [];
  List catigory = [];
  List points = [];

  void updatecat(int num) {
    cat.value = num;
    getPoints();
    update();
  }

  Future<void> getCatigory() async {
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
        update();
      } else {
        catigory = [];
        statusRequest = StatusRequest.success;
        update();
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {
      // Handle server failure
    }
  }

  Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        ?.buffer
        .asUint8List();
  }

  Future<void> getPoints() async {
    final Uint8List? pointsmarker =
        await getBytesFromAsset('assets/images/point.png', 150);
    statusRequest = StatusRequest.loading;
    update();
    var response = await pointsData.points('${cat.value}');
    if (StatusRequest.success == handlingData(response)) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        statusRequest = StatusRequest.success;
        update();
        points = mapData['data'];
        markers.clear();
        for (int i = 0; i < catigory.length; i++) {
          var lat = points[i]['points_lat'];
          var long = points[i]['points_long'];
          if (lat != null && long != null) {
            markers.add(
              Marker(
                infoWindow: InfoWindow(
                  onTap: () {
                    Get.offAll(PointsDetailsScreen(
                      points: points,
                      index: i,
                    ));
                  },
                  title: points[i]['points_name'],
                  snippet:  points[i]['points_kind'],
                ),
                icon: BitmapDescriptor.fromBytes(pointsmarker!),
                markerId: MarkerId("restaurant_$i"),
                position: LatLng(lat, long),
              ),
            );
            initialCameraPosition = CameraPosition(
              target: LatLng(lat, long),
              zoom: 14.4746,
            );
          }
        }
        // initialCameraPosition = catigory.isNotEmpty
        //     ? CameraPosition(
        //   target: LatLng(
        //     catigory[0]['points_lat'] ?? 0.0,
        //     catigory[0]['points_long'] ?? 0.0,
        //   ),
        //   zoom: 14.4746,
        // )
        //     : null;
        update();
      } else {
        points = [];
        statusRequest = StatusRequest.success;
        update();
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {
      // Handle server failure
    }
  }

  @override
  void onInit() {
    getCatigory();
    getPoints();
    controllerCompleter = Completer<GoogleMapController>();
    super.onInit();
  }
}
