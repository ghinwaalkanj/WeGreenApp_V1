import 'package:flutter/material.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/sizes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle, required this.bg,
  });

  final String image;
  final String bg;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        Image(
          image: AssetImage(AppImages.appLogo),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Image(
          image: AssetImage(AppImages.textLogo),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        Stack(
          children: [
            Image(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.38,
              image: AssetImage(bg),
            ),
            Image(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.38,
              image: AssetImage(image),
            ),
          ],
        ),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: AppColor.ink),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 8),
          child: Text(
            subtitle,
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
