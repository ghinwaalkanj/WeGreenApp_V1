import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../core/constant/color.dart';

class bg extends StatelessWidget {
  const bg({super.key, required this.color1, required this.color2});
  final Color color1;
  final Color color2;

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
              color1,
              color2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ) ,
    );
  }
}
