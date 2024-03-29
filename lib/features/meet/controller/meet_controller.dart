import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/home_data.dart';

abstract class MeetController extends GetxController {}

class MeetControllerImp extends MeetController {
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  RxInt cat = 1.obs;


  void updatecat(int num){
    cat.value = num;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
