import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';

class AddWasteHeader extends StatelessWidget {
  const AddWasteHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 26.h,
        left: 19.w,
        right: 19.w,
        child: Text(
          "Add Your Waste Data",
          style: TextStyle(color: AppColor.green, fontSize: 17.sp),
        ));
  }
}
