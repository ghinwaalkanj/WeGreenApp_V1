import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/features/calender/screens/calender_screen.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/calender_data.dart';
import '../../../data/datasource/remote/home_data.dart';

abstract class CalenderController extends GetxController {}

class CalenderControllerImp extends CalenderController {
  CalenderData calenderData = CalenderData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  List upcoming = [];
  var dropdownValue = 'Online'.obs;
  var selectedDate = DateTime.now().obs;
  late String formattedDate;
  late String formattedTime;


  void changeDropdownValue(String newValue) {
    dropdownValue.value = newValue;
  }

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.overlayContext!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.green,
              onPrimary: Colors.white,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              buttonColor: AppColor.green,
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }

  void pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.overlayContext!,
      initialTime: TimeOfDay.fromDateTime(selectedDate.value),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColor.green, // Change color of selected time
              onPrimary: Colors.white, // Change text color of selected time
              // You can add more color configurations here
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              buttonColor: AppColor.green, // Change color of OK button
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      selectedDate.value = DateTime(
        selectedDate.value.year,
        selectedDate.value.month,
        selectedDate.value.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      // Update global formatted date and time variables
      formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate.value);
      formattedTime = DateFormat.jm().format(DateTime(
        selectedDate.value.year,
        selectedDate.value.month,
        selectedDate.value.day,
        pickedTime.hour,
        pickedTime.minute,
      ));

      print("Date: $formattedDate");
      print("Time: $formattedTime");
    }
  }


  getDates() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await calenderData.upcoming(
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

  addDate(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();
    if (form.currentState!.validate()) {
      var response = await calenderData.addDate(
        '${myServices.sharedPreferences.getInt("users_id")}',
        title.text,
        '$dropdownValue',
        formattedDate,
        formattedTime,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          statusRequest = StatusRequest.success;
          update();
          BuildContext context = Get.context!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Date add successful ",
                    textAlign: TextAlign.right,
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
          Get.offAll(() => const CalenderScreen());
        } else if (response['status'] == false) {
          statusRequest = StatusRequest.success;
          update();
          BuildContext context = Get.context!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Date add Failed",
                    textAlign: TextAlign.right,
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
          statusRequest = StatusRequest.none;
          update();
        }
      } else if (statusRequest != StatusRequest.success) {
        statusRequest = handlingData(response);
        if (StatusRequest.failure == statusRequest) {
          if (response['status'] == false) {
            statusRequest = StatusRequest.none;
            update();
          }
        }
      }
      update();
    } else {}
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
