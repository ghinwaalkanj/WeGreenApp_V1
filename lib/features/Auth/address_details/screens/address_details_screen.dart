import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/features/Auth/address_details/screens/widgets/address_details_form.dart';
import 'package:we_green_v1/features/Auth/address_details/screens/widgets/address_details_header.dart';
import 'package:we_green_v1/features/Auth/sign_in/screens/widgets/login_form.dart';
import 'package:we_green_v1/features/Auth/sign_in/screens/widgets/login_header.dart';
import 'package:we_green_v1/features/Auth/sign_up/screens/widgets/sign_up_form.dart';
import 'package:we_green_v1/features/Auth/sign_up/screens/widgets/sign_up_header.dart';
import '../../../../common_widgets/form_divider.dart';
import '../../../../common_widgets/social_button.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/image_strings.dart';
import '../../../../core/constant/sizes.dart';
import '../../../../core/constant/text_strings.dart';

class AddressDetailsScreen extends StatelessWidget {
  const AddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            bg(),
            Image(
              width: double.infinity,
              image: AssetImage(AppImages.bg),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: TSizes.appBarHeight * 2,
                start: TSizes.defaultSpace,
                end: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AddressDetailsHeader(),
                  const AddressDetailsForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
