import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constant/color.dart';
import '../../../../../core/constant/image_strings.dart';
import '../../../../../core/constant/sizes.dart';
import '../../../../../core/constant/text_strings.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          TTexts.loginTitle,
          style: TextStyle(
            fontFamily: 'DMSans',
              fontWeight: FontWeight.bold, fontSize: 25.sp, color: AppColor.ink,letterSpacing: 1,shadows: [
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