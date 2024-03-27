import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/sizes.dart';
import '../../../../../core/constant/text_strings.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/14,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),),),
                  filled: true,
                  fillColor: AppColor.white,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColor.green,

                  ),
                  labelText: TTexts.email,
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields*1.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/14,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),),),
                  filled: true,
                  fillColor: AppColor.white,
                  prefixIcon: Icon(
                    Icons.lock_outline_rounded,
                    color: AppColor.green,
                  ),
                  labelText: TTexts.password,
                  suffixIcon: Icon(Iconsax.eye_slash),

                ),
              ),
            ),
            Transform.translate(
              offset: Offset(MediaQuery.of(context).size.width/3.3,-7),
              child: TextButton(
                onPressed: () {},
                child: const Text(TTexts.forgetPassword, style: TextStyle(
                    color: AppColor.darkGrey, fontWeight: FontWeight.bold,fontSize:12),),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections/2,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/14,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(AppColor.green),),
                // onPressed: () => Get.to(() => const NavigationMenu()),
                child: const Text(TTexts.signIn,style: TextStyle(color: AppColor.white,fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Don't have an account?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10),),
                  SizedBox(width: 2,),
                  TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero), // Reduced padding
                      minimumSize: MaterialStateProperty.all<Size>(Size(0, 0)), // Reduced minimum size
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrinks tap target
                    ),
                    onPressed: () {},
                    child: const Text("Sign up", style: TextStyle(
                        color: AppColor.green, fontWeight: FontWeight.bold,fontSize:10),),
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
