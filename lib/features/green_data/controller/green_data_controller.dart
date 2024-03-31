import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/home_data.dart';
import '../../../data/datasource/remote/statistics_data.dart';

abstract class GreenDataController extends GetxController {}

class GreenDataControllerImp extends GreenDataController {
  StatisticsData statisticsData = StatisticsData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List statistics = [];

  getStatistics() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await statisticsData.Statistics(
      '${myServices.sharedPreferences.getInt("users_id")}',
    );
    if (StatusRequest.success == handlingData(response)) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        statistics = [];
        statistics = mapData['data'];
        statusRequest = StatusRequest.success;
        update();
        return true;
      } else {
        statistics = [];
        statusRequest = StatusRequest.success;
        update();
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }

  @override
  void onInit() {
    getStatistics();
    super.onInit();
  }

  @override
  void dispose() {
    getStatistics();
    super.dispose();
  }
}
