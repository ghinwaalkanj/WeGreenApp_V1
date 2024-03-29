import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/home_data.dart';
import '../../../data/datasource/remote/profile_data.dart';


abstract class ProfileController extends GetxController {

}
///
class ProfileControllerImp extends ProfileController {
  ProfileData profileData = ProfileData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  List upcoming = [];


  getOffers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await profileData.upcoming();
    if (StatusRequest.success == handlingData(response)) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        upcoming = [];
        upcoming = mapData['data'];
        statusRequest = StatusRequest.success;
        update();
        return true;
      } else {
        upcoming = [];
        statusRequest = StatusRequest.success;
        update();
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }



  @override
  void onInit() {
    getOffers();
    super.onInit();
  }

  @override
  void dispose() {
    getOffers();
    super.dispose();
  }
}
