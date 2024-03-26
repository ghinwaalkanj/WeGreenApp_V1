import 'package:flutter/material.dart';
import 'package:we_green_v1/core/constant/color.dart';
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
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text("skip",style: TextStyle(color: AppColor.grey),),
      ),
    );
  }
}
