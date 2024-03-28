import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/image_strings.dart';
import '../../../../../core/constant/sizes.dart';
import '../../../../../core/constant/text_strings.dart';

class AddressDetailsHeader extends StatelessWidget {
  const AddressDetailsHeader({
    super.key,
  });
///
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          TTexts.adTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 33, color: AppColor.ink,letterSpacing: 1,shadows: [
            Shadow(
              color:AppColor.darkGrey,
              offset: Offset(3, 3),
              blurRadius: 10,
            ),
          ],),
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(
          TTexts.adSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
