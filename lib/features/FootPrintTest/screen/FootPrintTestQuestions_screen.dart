import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/common_widgets/bg.dart';
import 'package:we_green_v1/features/FootPrintTest/screen/widget/foot_test_page.dart';
import 'package:we_green_v1/features/FootPrintTest/screen/widget/fottprint_dot_navigation.dart';
import 'package:we_green_v1/features/FootPrintTest/screen/widget/fp_header.dart';
import 'package:we_green_v1/features/FootPrintTest/screen/widget/fp_next_button.dart';
import 'package:we_green_v1/features/FootPrintTest/screen/widget/fp_previous_button.dart';
import 'package:we_green_v1/features/FootPrintTest/screen/widget/info_box.dart';
import 'package:we_green_v1/features/FootPrintTest/screen/widget/question_row.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/image_strings.dart';
import '../controller/FootPrintTest_controller.dart';

class FootPrintTestQuestionsScreen extends StatelessWidget {
  const FootPrintTestQuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FootPrintController());

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          bg(),
          Transform.scale(
            scale: 2.5,
            origin: Offset(0, 23.h),
            child: Image.asset(AppImages.leaves),
          ),
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            physics: NeverScrollableScrollPhysics(),
            children: [
              FootTestPage(
                question:
                    'What kind of vehicle do you travel in most often as driver or passenger? (if any)',
                O1: 'Car',
                O2: 'Motorbike',
                O3: 'Neither',
                imgO1: 'assets/images/i20_Modelpc-removebg-preview 1.png',
                imgO2:
                    'assets/images/Kawasaki-Ninja-125-removebg-preview 1.png',
                imgO3: 'assets/images/img.png',
              ),
              FootTestPage(
                  question: 'Do you tend to buy items second-hand or new?',
                  O1: 'Second-hand',
                  O2: 'New',
                  O3: 'Mix of both'),
              FootTestPage(
                question: 'What type of housing do you live in?',
                O1: 'Apartment',
                O2: 'House',
                O3: 'Neither',
                imgO1: 'assets/images/image-removebg-preview (6) 1.png',
                imgO2: 'assets/images/image-removebg-preview (7) 1.png',
                imgO3: 'assets/images/image-removebg-preview (9) 1.png',
              ),
              FootTestPage(
                question: 'What type of diet do you follow?',
                O1: 'Omnivorous',
                O2: 'Vegetarian',
                O3: 'Vegan',
                imgO1: 'assets/images/image-removebg-preview (4) 1.png',
                imgO2: 'assets/images/Vegetarian-Diet-Illustration-removebg-preview 1.png',
                imgO3: 'assets/images/image-removebg-preview (5) 1.png',
              ),
            ],
          ),
          FootPrintHeader(),
          QuestionRow(),
          FootPrintNavigation(),
          FootPrintNextButton(color: AppColor.darkGreen, bottom: 15.h, onTap:()=>FootPrintController.instance.nextPage(),),
          FootPrintPreviousButton(color: AppColor.darkGreen, bottom: 15.h,onTap: () => FootPrintController.instance.previousPage(),),
          InfoBox(),
        ],
      ),
    );
  }
}
