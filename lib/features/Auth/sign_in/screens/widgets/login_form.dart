import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/Auth/sign_up/screens/sign_up_screen.dart';

import '../../../../../common_widgets/custom_text_field.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/sizes.dart';
import '../../../../../core/constant/text_strings.dart';
import '../../../../../navigation_menu.dart';
import '../../controller/signin_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(SignInControllerImp());

    return GetBuilder<SignInControllerImp>(
        builder: (controller) => Form(
              key: controller.form,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: TSizes.spaceBtwSections),
                child: Column(
                  children: [
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
                    Transform.translate(
                      offset: Offset(26.w, -1.h),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          TTexts.forgetPassword,
                          style: TextStyle(
                              color: AppColor.darkGrey,
                              fontFamily: 'DMSans',
                              fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections / 2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 14,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColor.green),
                        ),
                        onPressed: () => controller.signIn(context),
                        child: Text(
                          TTexts.signIn,
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
                            "Don't have an account?",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'DMSans',
                              fontSize: 9.sp,
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
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
                            onPressed: () => Get.offAll(() => const SignUpScreen()),
                            child:  Text(
                              "Sign up",
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
            ));
  }
}
