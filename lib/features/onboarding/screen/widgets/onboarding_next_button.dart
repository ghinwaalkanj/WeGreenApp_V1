import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import '../../../../core/constant/sizes.dart';
import '../../../../core/device/device_utility.dart';
import '../../controller/onboarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 4.h,
      right: TSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16),
            shape:  CircleBorder(),
            backgroundColor:  AppColor.green ),
        child: const Icon(Iconsax.arrow_right_3,color:AppColor.lightGrey,),
      ),
    );
  }
}
