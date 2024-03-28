import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/FootPrintTest/screen/widget/answer_chips.dart';

import '../../../../core/constant/color.dart';

class FootTestPage extends StatelessWidget {
  const FootTestPage({
    super.key,
    required this.question,
    required this.O1,
    required this.O2,
    required this.O3,
     this.imgO1,
     this.imgO2,
     this.imgO3,
  });

  final String question;
  final String O1;
  final String O2;
  final String O3;
  final String? imgO1;
  final String ?imgO2;
  final String ?imgO3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32.h, left: 8.h, right: 8.h),
      child: Column(
        children: [
          Text(
            question,
            style: TextStyle(
              color: AppColor.darkGreen,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          AnswerChips(
            answer: O1,
            image: imgO1,
          ),
          SizedBox(
            height: 2.h,
          ),
          AnswerChips(
            answer: O2,
            image: imgO2,
          ),
          SizedBox(
            height: 2.h,
          ),
          AnswerChips(
            answer: O3,
            image: imgO3,
          ),
        ],
      ),
    );
  }
}
