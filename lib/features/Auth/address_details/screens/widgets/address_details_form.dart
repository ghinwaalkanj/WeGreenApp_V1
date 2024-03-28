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
import '../../../../../navigation_menu.dart';
import '../../../../FootPrintTest/screen/FootPrintTest_screen.dart';

class AddressDetailsForm extends StatelessWidget {
  const AddressDetailsForm({
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
              labelText: 'Street Address',
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields * 1.5,
            ),
            CustomTextField(
              labelText: 'City / Town',
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields * 1.5,
            ),

            CustomTextField(
              labelText: 'Country',
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields * 1.5,
            ),
            CustomTextField(
              labelText: 'Mobile',
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections*2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => const FootPrintTestScreen()),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(AppColor.green),
                ),
                // onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(
                  "Save",
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const NavigationMenu()),
                style: ButtonStyle(
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      color: AppColor.green,
                      width: 1,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                // onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
