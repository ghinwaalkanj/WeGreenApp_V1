import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/challenges/screens/widget/procedures_types.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/image_strings.dart';
import '../../../../navigation_menu.dart';
import '../../controller/challenges_controller.dart';

class AddGoal extends StatelessWidget {
  const AddGoal({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ChallengesControllerImp());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select waste category',
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          height: 4.h,
          padding: EdgeInsets.only(left: 2.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Obx(() => DropdownButton<String>(
            value: controller.dropdownValue.value,
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            underline: Container(),
            onChanged: (String? newValue) {
              controller.changeDropdownValue(newValue!);
            },
            items: <String>[
              'Paper',
              'Plastic',
              'Glass',
              'Food',
              'Metal',
              'Special',
              'E-Waste',
              'Drugs',
              'Non-Recyclable'
            ].map<DropdownMenuItem<String>>(
                  (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: AppColor.ink,
                      fontSize: 11.sp,
                    ),
                  ),
                );
              },
            ).toList(),
          )),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          'Select procedure type',
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProceduresTypes(
              text: 'Recycle',
              image: Image.asset(AppImages.recycle),
              onPressed: () {
                controller.updateproc(1);
              },
              color: controller.proc == 1
                  ? AppColor.green.withOpacity(0.50)
                  : Colors.white,
            ),
            ProceduresTypes(
              text: 'Reuse',
              image: Image.asset(AppImages.reuse),
              onPressed: () {
                controller.updateproc(2);
              },
              color: controller.proc == 2
                  ? AppColor.green.withOpacity(0.50)
                  : Colors.white,
            ),
            ProceduresTypes(
              text: 'Reduce',
              image: Image.asset(AppImages.reduce),
              onPressed: () {
                controller.updateproc(3);
              },
              color: controller.proc == 3
                  ? AppColor.green.withOpacity(0.50)
                  : Colors.white,
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          'Enter goal amount',
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 20.w,
              child: const TextField(
                style: TextStyle(
                    color: AppColor.ink
                ),
                decoration: InputDecoration(
                  hintText: '',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            Text(
              controller.proc == 1
                  ? ' % recycling'
                  : controller.proc == 2
                  ? '% reusing'
                  : '% reducing',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Deadline',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
            TextButton(
              onPressed: () {
                controller.pickDate();
              },
              child: Obx(() => Text(
                DateFormat('dd MMM yyyy').format(controller.selectedDate.value),
                style: TextStyle(color: AppColor.ink),
              )),
            ),
          ],
        ),
        SizedBox(height: 3.h,),
        Center(
          child: MaterialButton(
            height: 6.h,
            minWidth: 44.w,
            color: AppColor.green,
            onPressed: () {
              Get.to(NavigationMenu());
            },
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(30),
            ),
            child: Text(
              "add",
              style: TextStyle(
                  color: AppColor.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
