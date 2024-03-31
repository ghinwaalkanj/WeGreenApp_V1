import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:sizer/sizer.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/services/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import '../../../data/datasource/remote/goal_data.dart';
import '../../../data/datasource/remote/home_data.dart';
import '../../../navigation_menu.dart';

abstract class ChallengesController extends GetxController {}

class ChallengesControllerImp extends ChallengesController {
  GoalData goalData = GoalData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController amount = TextEditingController();


  RxInt cat = 1.obs;
  RxInt proc = 1.obs;
  var dropdownValue = 'Paper'.obs;

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

  void updatecat(int num) {
    cat.value = num;
    update();
  }

  void updateproc(int num) {
    proc.value = num;
    update();
  }

  addGoal() async {
    statusRequest = StatusRequest.loading;
    update();
    if (form.currentState!.validate()) {
      var response = await goalData.addGoal(
        '${myServices.sharedPreferences.getInt("users_id")}',
        '$dropdownValue',
        amount.text,
        '${proc.value}',
        '1',
        '${selectedDate.value}',
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
                    "Add Goal successful ",
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
                    "Add Goal Failed",
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
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
