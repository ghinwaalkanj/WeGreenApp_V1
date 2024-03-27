import 'package:flutter/material.dart';

import '../core/constant/color.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.isSuffixIconActive = false,
  });

  final TextEditingController? controller;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isSuffixIconActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 14,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          filled: true,
          fillColor: AppColor.white,
          prefixIcon: Icon(
            prefixIcon,
            color: AppColor.green,
          ),
          labelText: labelText,
          suffixIcon: isSuffixIconActive ? Icon(suffixIcon) : null,
        ),
      ),
    );
  }
}
