import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';

import '../core/constant/sizes.dart';

class SocialButton extends StatelessWidget {

  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Image(
            height: TSizes.iconLg,
            width: TSizes.iconLg,
            image: AssetImage(AppImages.twitter),
          ),
        ),
         SizedBox(
          width: 2.w,
        ),
        IconButton(
          onPressed: () {},
          icon: const Image(
            height: TSizes.iconLg,
            width: TSizes.iconLg,
            image: AssetImage(AppImages.google),
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        IconButton(
          onPressed: () {},
          icon: const Image(
            height: TSizes.iconLg,
            width: TSizes.iconLg,
            image: AssetImage(AppImages.facebook),
          ),
        ),
      ],
    );
  }
}
