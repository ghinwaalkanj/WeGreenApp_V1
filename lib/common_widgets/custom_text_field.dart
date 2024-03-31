import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../core/constant/color.dart';
import '../features/Auth/sign_in/controller/signin_controller.dart';
import '../features/Auth/sign_up/controller/signup_controller.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.isSuffixIconActive = false,
  });

  final TextEditingController? controller;
  final String labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool isSuffixIconActive;

  @override
  Widget build(BuildContext context) {
    final signincontroller = Get.put(SignInControllerImp());
    final signupcontroller = Get.put(signUpControllerImp());

    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height / 14,
      child: TextFormField(
        style: TextStyle(
          fontFamily: 'DMSans',
          color: AppColor.black,
          fontSize: 12.sp,
        ),
        obscureText:isSuffixIconActive?signincontroller.visibile.value||signupcontroller.visibile.value:false,
        controller: controller,
        keyboardType: isSuffixIconActive?TextInputType.visiblePassword:TextInputType.name,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black38,
              width: 0.3.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.green,
              width: 0.3.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          filled: true,
          fillColor: AppColor.white,
          prefixIcon: Icon(
            prefixIcon,
            color: AppColor.green,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
              fontFamily: 'DMSans', fontSize: 11.sp, color: Colors.black54),
          suffixIcon: isSuffixIconActive ? IconButton(
            onPressed: () {
              signincontroller.updatevisibility();
              signupcontroller.updatevisibility();
            }, icon: suffixIcon!,) : null,
        ),
      ),
    );
  }
}
