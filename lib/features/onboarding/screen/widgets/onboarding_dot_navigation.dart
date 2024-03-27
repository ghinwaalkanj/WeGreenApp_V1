import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:we_green_v1/core/constant/color.dart';
import '../../../../core/device/device_utility.dart';
import '../../controller/onboarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() ,
      left: 16,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 4,
        effect: ExpandingDotsEffect(
            activeDotColor:AppColor.green,
            dotHeight: 6
        ),
      ),
    );
  }
}
