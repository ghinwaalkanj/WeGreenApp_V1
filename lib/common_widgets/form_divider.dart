import 'package:flutter/material.dart';
import 'package:we_green_v1/core/constant/color.dart';


class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dividerText,
  });
  final String dividerText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: Colors.black,
            thickness: 1,
            indent: 80,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style:TextStyle(fontWeight: FontWeight.bold,fontSize: 10),
        ),
        Flexible(
          child: Divider(
            color: Colors.black,
            thickness: 1,
            indent: 5,
            endIndent: 80,
          ),
        ),
      ],
    );
  }
}
