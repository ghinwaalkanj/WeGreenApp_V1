import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';
import 'package:we_green_v1/features/onboarding/screen/widgets/onboarding_dot_navigation.dart';
import 'package:we_green_v1/features/onboarding/screen/widgets/onboarding_next_button.dart';
import 'package:we_green_v1/features/onboarding/screen/widgets/onboarding_page.dart';
import 'package:we_green_v1/features/onboarding/screen/widgets/onboarding_skip.dart';
import '../../../common_widgets/bg.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/text_strings.dart';
import '../controller/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          bg(),
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            physics: NeverScrollableScrollPhysics(),
            children: const [
              OnBoardingPage(
                image: AppImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
                bg: AppImages.bgOnBoardingImage1,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
                bg: AppImages.bgOnBoardingImage2,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
                bg: AppImages.bgOnBoardingImage3,
              ),
              OnBoardingPage(
                image: AppImages.onBoardingImage4,
                title: TTexts.onBoardingTitle4,
                subtitle: TTexts.onBoardingSubTitle4,
                bg: AppImages.bgOnBoardingImage4,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
          //
        ],
      ),
    );
  }
}
