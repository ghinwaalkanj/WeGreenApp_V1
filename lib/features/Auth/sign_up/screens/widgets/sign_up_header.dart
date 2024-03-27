import 'package:flutter/material.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/image_strings.dart';
import '../../../../../core/constant/sizes.dart';
import '../../../../../core/constant/text_strings.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Create Your Account",
          style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: AppColor.ink,letterSpacing: 1,shadows: [
            Shadow(
              color:AppColor.darkGrey,
              offset: Offset(3, 3),
              blurRadius: 10,
            ),
          ],),
        ),
      ],
    );
  }
}
