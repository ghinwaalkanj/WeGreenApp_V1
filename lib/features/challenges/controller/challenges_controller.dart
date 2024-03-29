import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/home_data.dart';

abstract class ChallengesController extends GetxController {}

class ChallengesControllerImp extends ChallengesController {
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt cat = 1.obs;
  RxInt proc = 1.obs;
  var dropdownValue = 'Paper'.obs; // Set default value as 'Paper'

  var selectedDate = DateTime.now().obs;

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.overlayContext!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }

  void changeDropdownValue(String newValue) {
    dropdownValue.value = newValue;
  }

  void updatecat(int num){
    cat.value = num;
    update();
  }

  void updateproc(int num){
    proc.value = num;
    update();
  }

  List upcoming = [];

  getOffers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeData.upcoming();
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
