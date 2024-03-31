import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/Auth/sign_in/screens/sign_in_screen.dart';

import '../../../../../common_widgets/custom_text_field.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/sizes.dart';
import '../../../../../core/constant/text_strings.dart';
import '../../../address_details/screens/address_details_screen.dart';
import '../../controller/signup_controller.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(signUpControllerImp());

    return GetBuilder<signUpControllerImp>(
      builder: (controller) => Form(
        key: controller.form,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              CustomTextField(
                labelText: 'Full name',
                prefixIcon: CupertinoIcons.person,
                controller: controller.name,
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields * 1.5,
              ),
              CustomTextField(
                labelText: 'Email',
                prefixIcon: CupertinoIcons.mail,
                controller: controller.email,
              ),
              const SizedBox(
                height: TSizes.spaceBtwInputFields * 1.5,
              ),
              CustomTextField(
                labelText: 'Password',
                prefixIcon: CupertinoIcons.lock,
                isSuffixIconActive: true,
                suffixIcon: controller.visibile == true.obs
                    ? Icon(CupertinoIcons.eye_slash)
                    : Icon(
                        CupertinoIcons.eye,
                        color: AppColor.green,
                      ),
                controller: controller.password,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections * 1.5,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.signUp(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(AppColor.green),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontFamily: 'DMSans',
                        color: AppColor.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'DMSans',
                        fontSize:  9.sp,
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.zero),
                        // Reduced padding
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(0, 0)),
                        // Reduced minimum size
                        tapTargetSize: MaterialTapTargetSize
                            .shrinkWrap, // Shrinks tap target
                      ),
                      onPressed: () {
                        Get.offAll(SignInScreen());
                      },
                      child:  Text(
                        "Log in",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColor.green,
                            decorationThickness: 0.2.h,
                            fontFamily: 'DMSans',
                            color: AppColor.green,
                            fontWeight: FontWeight.bold,
                            fontSize:  9.sp,),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
