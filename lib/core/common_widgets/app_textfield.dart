import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    this.onChanged,
    this.prefixIcon,
    this.maxLines = 1,
    this.validator,
    this.autoValidateMode,
    this.obscureText = false,
    this.suffixIcon,
  });

  final String hintText, label;
  TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? prefixIcon, suffixIcon;
  int? maxLines;
  String? Function(String?)? validator;
  AutovalidateMode? autoValidateMode;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: AppColors.white,
          ),
        ),
        10.hi,
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          autovalidateMode: autoValidateMode,
          style: context.textTheme.bodySmall?.copyWith(color: AppColors.black),
          maxLines: maxLines,
          obscuringCharacter: '*',
          obscureText: obscureText,
          cursorColor: AppColors.white,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 13.h,
                horizontal: 16.w,
              ),
              hintText: hintText,
              hintStyle: context.textTheme.bodySmall
                  ?.copyWith(color: AppColors.greyShade200,),
              suffixIcon: suffixIcon,
              isDense: true,
              prefixIcon: prefixIcon,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryShade300,
                  width: 1.0.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryShade300,
                  width: 1.0.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.redShade500,
                  width: 1.0.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryShade300,
                  width: 1.0.w,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.r),
                ),
              )),
        ),
      ],
    );
  }
}