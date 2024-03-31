import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/add_waste/screens/widget/circle_category.dart';
import '../../../core/constant/color.dart';
import '../controller/add_waste_controller.dart';

class AddYourWaste2 extends StatelessWidget {
  const AddYourWaste2({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddWasteController());

    return GetBuilder<AddWasteController>(
      builder: (controller) => Padding(
        padding: EdgeInsets.only(top: 39.h, right: 14.w, left: 14.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Row(
                  children: [
                    CircleCategory(
                      image: "assets/images/image-removebg-preview (11) 1.png",
                      opacity: 0.4,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      "Paper",
                      style: TextStyle(
                          color: AppColor.ink,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 11.sp),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Container(
                      height: 3.5.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        color: AppColor.lightGrey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Sorting Guide",
                                style: TextStyle(
                                  color: AppColor.green,
                                  fontFamily: 'DMSans',
                                  fontSize: 10.sp,
                                ),
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                color: AppColor.green,
                                size: 15.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Identify your waste",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  fontFamily: 'DMSans',
                ),
              ),
              SizedBox(
                height: 1.h,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AddWasteField(
                    labelText: 'Enter the amount',
                    width: 30.w,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "pieces",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Text(
                "Select procedure type",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  fontFamily: 'DMSans',
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProcedureContainer(
                    image: "assets/images/image-removebg-preview (23) 1.png",
                    text: 'Recycle',
                    onPressed: () {
                      controller.updatecat(1);
                      print('asdfg');
                    },
                    color:
                        controller.cat == 1 ? AppColor.green.withOpacity(0.30) : AppColor.white,
                  ),
                  ProcedureContainer(
                    image: "assets/images/image-removebg-preview (24) 2.png",
                    text: 'Reuse',
                    onPressed: () {
                      controller.updatecat(2);
                    },
                    color: controller.cat==2? AppColor.green.withOpacity(0.30):AppColor.white,
                  ),
                  ProcedureContainer(
                    image: "assets/images/image-removebg-preview (22) 1.png",
                    text: 'Reduce',
                    onPressed: () {
                      controller.updatecat(3);
                    },
                    color: controller.cat==3? AppColor.green.withOpacity(0.30):AppColor.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ProcedureContainer extends StatelessWidget {
  const ProcedureContainer({
    super.key,
    this.image,
    required this.text,
    this.percentage,
    required this.onPressed, required this.color,
  });

  final String? image;
  final String text;
  final String? percentage;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 8.2.h,
        width: 20.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColor.green.withOpacity(0.30),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 0.8),
            ),
          ],
        ),
        child: Center(
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (image != null)
                  Image(
                    image: AssetImage(image!),
                  ),
                if (image == null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: FittedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            color: AppColor.ink,
                          ),
                          if (percentage != null)
                            Text(
                              "$percentage%",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.grey),
                            )
                        ],
                      ),
                    ),
                  ),
                Text(
                  text,
                  style: TextStyle(
                      color: AppColor.ink,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'DMSans',
                      fontSize: 9.sp),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddWasteField extends StatelessWidget {
  const AddWasteField({
    super.key,
    required this.labelText,
    required this.width,
  });

  final String labelText;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: AppColor.grey, fontSize: 9.sp),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: AppColor.green), // Set border color when focused
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
