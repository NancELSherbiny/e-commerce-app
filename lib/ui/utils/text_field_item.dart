import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TextFieldItem extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcon;
  bool isObscure;
  var keyboardType;
  String? Function(String?)? validator;
  TextEditingController controller;
  TextFieldItem(
      {
        required this.fieldName,
        required this.hintText,
        this.suffixIcon,
        this.isObscure = false,
        required this.controller,
        this.keyboardType = TextInputType.text,
        required this.validator

      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 25.sp, color: Colors.white),
          textAlign: TextAlign.start,
        ),
        Padding(padding: EdgeInsets.only(top: 24.h,bottom: 20.h),
          child: TextFormField(
            obscureText: isObscure,
            decoration: InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),

              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,

          ),
        ),

      ],
    );
  }
}