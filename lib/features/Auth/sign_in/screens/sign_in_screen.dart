import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/features/Auth/sign_in/screens/widgets/login_form.dart';
import 'package:we_green_v1/features/Auth/sign_in/screens/widgets/login_header.dart';
import '../../../../common_widgets/form_divider.dart';
import '../../../../common_widgets/social_button.dart';
import '../../../../core/class/statusrequest.dart';
import '../../../../core/constant/image_strings.dart';
import '../../../../core/constant/loading_screen.dart';
import '../../../../core/constant/sizes.dart';
import '../controller/signin_controller.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(SignInControllerImp());

    return GetBuilder<SignInControllerImp>(
      builder: (controller) => controller.statusRequest == StatusRequest.loading
      ? LoadingScreen()
      :  Scaffold(
    resizeToAvoidBottomInset: false,
    body: Stack(
      children: [
        bg(),
        Transform.scale(
          scale: 2.5,
          origin: Offset(0,-7.h),
          child: Transform.rotate(
            angle: 2.5,
            child: Image(
              width: double.infinity,
              image: AssetImage(AppImages.leaves),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsetsDirectional.only(
            top: 22.h,
            start: TSizes.defaultSpace,
            end: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginHeader(),
              const LoginForm(),
              const FormDivider(dividerText: "OR LOG IN WITH"),
              const SizedBox(
                height: TSizes.spaceBtwSections / 2,
              ),
              SocialButton(onPressed: (){

              },)
            ],
          ),
        ),
      ],
    ),
        ),
    );
  }
}