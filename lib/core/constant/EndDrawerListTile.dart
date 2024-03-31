import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class EndDrawerListTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const EndDrawerListTile({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 3.h,
            padding: EdgeInsets.only(left: 7.w,right: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.w600,
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(width: 25.w,),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                  size: 10.sp,
                )
              ],
            ),
          ),
        ),
        Divider(
          endIndent: 5.w,
          indent: 7.w,
        ),
      ],
    );
  }
}
