import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../common_widgets/navigation_menu.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/goal_data.dart';
import '../../../data/datasource/remote/statistics_data.dart';


abstract class ProfileController extends GetxController {

}

class ProfileControllerImp extends ProfileController {
  GoalData goalData = GoalData(Get.find());
  StatisticsData statisticsData = StatisticsData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List inprogress = [];
  List achieved = [];
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

  InProgress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await goalData.InProgress(
      '${myServices.sharedPreferences.getInt("users_id")}',
    );
    if (StatusRequest.success == handlingData(response)) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        inprogress = [];
        inprogress = mapData['data'];
        statusRequest = StatusRequest.success;
        update();
        return true;
      } else {
        inprogress = [];
        statusRequest = StatusRequest.success;
        update();
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }

  Achieved() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await goalData.Achieved(
      '${myServices.sharedPreferences.getInt("users_id")}',
    );
    if (StatusRequest.success == handlingData(response)) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        achieved = [];
        achieved = mapData['data'];
        statusRequest = StatusRequest.success;
        update();
        return true;
      } else {
        achieved = [];
        statusRequest = StatusRequest.success;
        update();
      }
    } else if (statusRequest == StatusRequest.offlinefailure) {
      return Get.snackbar("فشل", "you are not online please check on it");
    } else if (statusRequest == StatusRequest.serverfailure) {}
  }

  Achieve(int goalsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await goalData.Achieve(
      '${goalsid}',
    );
    if (StatusRequest.success == handlingData(response)) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        BuildContext context = Get.context!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  " Goal Achieved successful ",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DMSans',
                  ),
                ),
              ],
            ),
            duration: Duration(seconds: 2),
          ),
        );
        Get.offAll(() => const NavigationMenu());
        statusRequest = StatusRequest.success;
        update();
        return true;
      } else {
        BuildContext context = Get.context!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  " Goal Achieved Failed",
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'ElMessiri',
                  ),
                ),
              ],
            ),
            duration: Duration(seconds: 2),
          ),
        );
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
    InProgress();
    Achieved();
    super.onInit();
  }

  @override
  void dispose() {
    getStatistics();
    InProgress();
    Achieved();
    super.dispose();
  }
}
