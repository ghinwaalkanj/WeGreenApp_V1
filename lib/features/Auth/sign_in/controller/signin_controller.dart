import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/navigation_menu.dart';

import '../../../../core/class/statusrequest.dart';
import '../../../../core/services/handingdatacontroller.dart';
import '../../../../core/services/services.dart';
import '../../../../data/datasource/remote/signin_data.dart';

abstract class SignInController extends GetxController {
  signIn(BuildContext context);
}


class SignInControllerImp extends SignInController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  SignInData signInData = SignInData(Get.find());
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  signIn(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();
    if (form.currentState!.validate()) {
      var response = await signInData.signin(
        email.text,
        password.text,
      );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == true) {
          statusRequest = StatusRequest.success;
          update();
          myServices.sharedPreferences
              .setString("token", response['data']['users_password']);
          myServices.sharedPreferences
              .setInt("users_id", response['data']['users_id']);
          myServices.sharedPreferences
              .setString("users_name", response['data']['users_name']);

          Get.offAll(() => NavigationMenu());
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
                    " البريد الالكتروني أو كلمة المرور خاطئة ! ",
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
