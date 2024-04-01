import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/home_data.dart';

abstract class ControlWasteController extends GetxController {}

class ControlWasteControllerImp extends ControlWasteController {
  HomeData homeData = HomeData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List upcoming = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
