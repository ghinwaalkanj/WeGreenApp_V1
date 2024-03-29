import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/Auth/sign_in/screens/sign_in_screen.dart';
import 'package:we_green_v1/navigation_menu.dart';

import '../../../../core/class/statusrequest.dart';
import '../../../../core/services/handingdatacontroller.dart';
import '../../../../core/services/services.dart';
import '../../../../data/datasource/remote/signin_data.dart';
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
          BuildContext context = Get.context!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "تم انشاء الحساب بنجاح ",
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
                    " لقد حدث خطأ أعد المحاولة لاحقا ",
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
