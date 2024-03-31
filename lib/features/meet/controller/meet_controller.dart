import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/home_data.dart';
import '../../../data/datasource/remote/meet_data.dart';

abstract class MeetController extends GetxController {}

class MeetControllerImp extends MeetController {
  MeetData meetData = MeetData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt cat = 1.obs;
  List meet = [];


  void updatecat(int num){
    cat.value = num;
    update();
  }


  getMeets() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await meetData.meets();
    if (StatusRequest.success == handlingData(response)) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        meet = [];
        meet = mapData['data'];
        statusRequest = StatusRequest.success;
        update();
        return true;
      } else {
        meet = [];
        statusRequest = StatusRequest.success;
        update();
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }

  @override
  void onInit() {
    getMeets();
    super.onInit();
  }

  @override
  void dispose() {
    getMeets();
    super.dispose();
  }
}
