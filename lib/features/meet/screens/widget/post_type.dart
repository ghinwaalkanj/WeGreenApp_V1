import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/image_strings.dart';

class PostType extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const PostType({
    super.key,
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:  Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
