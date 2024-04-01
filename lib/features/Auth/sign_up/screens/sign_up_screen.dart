import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/features/Auth/sign_up/screens/widgets/sign_up_form.dart';
import 'package:we_green_v1/features/Auth/sign_up/screens/widgets/sign_up_header.dart';
import '../../../../common_widgets/form_divider.dart';
import '../../../../common_widgets/loading_screen.dart';
import '../../../../common_widgets/social_button.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../core/constant/image_strings.dart';
import '../../../../core/constant/sizes.dart';
import '../controller/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(signUpControllerImp());

    return SafeArea(
      child: GetBuilder<signUpControllerImp>(
        builder: (controller) => controller.statusRequest == StatusRequest.loading
            ? LoadingScreen()
            :   Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              bg(),
              Image(
                width: double.infinity,
                image: AssetImage(AppImages.bg),
              ),
              Padding(
                padding:  EdgeInsetsDirectional.only(
                  top: 12.h,
                  start: TSizes.defaultSpace,
                  end: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SignUpHeader(),
                    const SignUpForm(),
                    FormDivider(dividerText: "OR LOG IN WITH"),
                    const SizedBox(
                      height: TSizes.spaceBtwSections / 2,
                    ),
                    SocialButton(onPressed: (){},)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
