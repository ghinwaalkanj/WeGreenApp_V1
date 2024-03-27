import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../core/constant/color.dart';

class bg extends StatelessWidget {
  const bg({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: 100.h,
        width: 100.w,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.white,
              AppColor.darkBeige,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ) ,
    );
  }
}
