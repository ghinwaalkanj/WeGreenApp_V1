import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:we_green_v1/features/add_waste/screens/widget/circle_category.dart';

import '../../../core/constant/color.dart';

class AddYourWaste1 extends StatelessWidget {
  const AddYourWaste1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 39.h, right: 10.w, left: 10.w),
      child: Column(
        children: [
          Text(
            "Select your waste category",
            style: TextStyle(
              fontFamily: 'DMSans',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            height: 4.h,
            width: 30.h,
            child: TextFormField(
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.green),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  filled: true,
                  fillColor: AppColor.white,
                  hintText: "Search material",
                  hintStyle: TextStyle(
                    fontFamily: 'DMSans',
                    fontSize: 9.sp,
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: AppColor.lightGrey,
                  )),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleCategory(
                image: 'assets/images/image-removebg-preview (11) 1.png',
                text: 'Paper',
              ),
              CircleCategory(
                image:
                    'assets/images/Icon_LandfillWaste-removebg-preview 1.png',
                text: 'plastic',
              ),
              CircleCategory(
                image: 'assets/images/image-removebg-preview (12) 4.png',
                text: 'glass',
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleCategory(
                image: 'assets/images/image-removebg-preview (14) 1.png',
                text: 'organic food',
              ),
              CircleCategory(
                image: 'assets/images/image-removebg-preview (15) 1.png',
                text: 'metal',
              ),
              CircleCategory(
                image: 'assets/images/image-removebg-preview (16) 1.png',
                text: 'special',
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 3.5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleCategory(
                  image: 'assets/images/image-removebg-preview (17) 1.png',
                  text: 'e-waste',
                ),
                CircleCategory(
                  image: 'assets/images/image-removebg-preview (19) 1.png',
                  text: 'expired drugs',
                ),
                CircleCategory(
                  image: 'assets/images/image-removebg-preview (20) 1.png',
                  text: 'non-recycable',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
