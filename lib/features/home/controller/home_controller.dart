import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/home_data.dart';


abstract class HomeController extends GetxController {

}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List upcoming = [];


  getDates() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.upcoming(
      '${myServices.sharedPreferences.getInt("users_id")}',
    );
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
    getDates();
    super.onInit();
  }

  @override
  void dispose() {
    getDates();
    super.dispose();
  }
}
