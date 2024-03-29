import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/home_data.dart';
import '../../../data/datasource/remote/learn_data.dart';

abstract class LearnController extends GetxController {}

class LearnControllerImp extends LearnController {
  LearnData learnData = LearnData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxInt cat = 1.obs;


  List posts = [];

  void updatecat(int num){
    cat.value = num;
    update();
  }

  getOffers() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await learnData.posts();
    if (StatusRequest.success == handlingData(response)) {
      Map mapData = {};
      mapData.addAll(response);
      if (mapData["status"] == true) {
        posts = [];
        posts = mapData['data'];
        statusRequest = StatusRequest.success;
        update();
        return true;
      } else {
        posts = [];
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
