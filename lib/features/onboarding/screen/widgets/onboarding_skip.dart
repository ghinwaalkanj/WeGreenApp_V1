import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/features/Auth/sign_in/screens/sign_in_screen.dart';
import '../../../../core/constant/sizes.dart';
import '../../../../core/device/device_utility.dart';
import '../../controller/onboarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: TSizes.defaultSpace,
      top: TDeviceUtils.getAppBarHeight(),
      child: TextButton(
        onPressed: () => Get.to(SignInScreen()),
        child: const Text("skip",style: TextStyle(color: AppColor.grey),),
      ),
    );
  }
}
