import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../core/services/handingdatacontroller.dart';
import '../../../../core/services/services.dart';
import '../../../../data/datasource/remote/signup_data.dart';
import '../../address_details/screens/address_details_screen.dart';

abstract class signUpController extends GetxController {
  signUp(BuildContext context);
}


class signUpControllerImp extends signUpController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signupdata = SignUpData(Get.find());
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();
  RxBool visibile = true.obs;

  void updatevisibility(){
    visibile.value=!visibile.value;
    update();
  }

  @override
  signUp(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();
    if (form.currentState!.validate()) {
      update();
      var response = await signupdata.signup(
        name.text,
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
          BuildContext context = Get.context!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Your account has been successfully created",
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
          Get.offAll(() => AddressDetailsScreen());
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
                   "An error occurred, please try again later",
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
