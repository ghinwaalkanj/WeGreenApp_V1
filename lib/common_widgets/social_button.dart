import 'package:flutter/material.dart';
import 'package:we_green_v1/core/constant/color.dart';
import 'package:we_green_v1/core/constant/image_strings.dart';

import '../core/constant/sizes.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Image(
            height: TSizes.iconLg,
            width: TSizes.iconLg,
            image: AssetImage(AppImages.twitter),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        IconButton(
          onPressed: () {},
          icon: const Image(
            height: TSizes.iconLg,
            width: TSizes.iconLg,
            image: AssetImage(AppImages.google),
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
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