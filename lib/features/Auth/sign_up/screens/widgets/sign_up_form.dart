import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:we_green_v1/features/Auth/sign_in/screens/sign_in_screen.dart';

import '../../../../../common_widgets/custom_text_field.dart';
import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/sizes.dart';
import '../../../../../core/constant/text_strings.dart';
import '../../../address_details/screens/address_details_screen.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            CustomTextField(
              labelText: 'Full name',
              prefixIcon: Icons.person_2_outlined,
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields * 1.5,
            ),
            CustomTextField(
              labelText: 'Email',
              prefixIcon: Icons.email_outlined,
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields * 1.5,
            ),
            CustomTextField(
              labelText: 'Password',
              prefixIcon: Icons.lock_outline_rounded,
              isSuffixIconActive: true,
              suffixIcon: Icons.visibility_outlined,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections*1.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(AddressDetailsScreen());
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColor.green),
                ),
                // onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 18,
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
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.zero),
                      // Reduced padding
                      minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)),
                      // Reduced minimum size
                      tapTargetSize: MaterialTapTargetSize
                          .shrinkWrap, // Shrinks tap target
                    ),
                    onPressed: () {
                      Get.to(SignInScreen());
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                          color: AppColor.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
