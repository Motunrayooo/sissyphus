import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../utils/app_colors.dart';

class AppTextField extends StatefulWidget {
  AppTextField({
    super.key,
    required this.hintText,

    this.label,
    required this.controller,
    this.onChanged,
    this.prefixIcon,
    this.maxLines = 1,
    this.validator,
    this.autoValidateMode,
    this.obscureText = false,
    this.suffixValue = '0.0',
    this.suffixIcon,
    this.keyboardType,
  });

  final String hintText;

  final String? label;
  TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? prefixIcon, suffixIcon;
  int? maxLines;
  String? Function(String?)? validator;
  AutovalidateMode? autoValidateMode;
  bool obscureText;
  String? suffixValue;
  final TextInputType? keyboardType;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: widget.autoValidateMode,
      style: context.textTheme.bodySmall?.copyWith(color: AppColors.white),
      maxLines: widget.maxLines,
      obscuringCharacter: '*',
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      cursorColor: AppColors.white,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.symmetric(
            vertical: 13.h,
            horizontal: 16.w,
          ),
          hintText: widget.hintText,
          hintStyle: context.textTheme.bodySmall?.copyWith(
            color: AppColors.greyShade200,
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
               widget.label ?? '',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 12.sp,
                ),
              ),
              4.wi,
              SvgPicture.asset('info_icon'.svg),
            ],
          ),
          // suffixIcon: widget.suffixIcon,
          isDense: true,
          prefixIcon: widget.prefixIcon,
          suffixIcon: Padding(
            padding: EdgeInsets.only(
              top: 20.h,
              right: 16.w,
            ),
            child: widget.suffixIcon ??
                Text(
                  '${widget.suffixValue} USD',
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.greyShade200,
                  ),
                ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryShade300,
              width: 2.0.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryShade300,
              width: 2.0.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.redShade500,
              width: 2.0.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryShade300,
              width: 2.0.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          )),
      onChanged: widget.onChanged ??
          (text) {
            setState(() {
              widget.suffixValue = text.isEmpty ? '0.0' : '';
            });
          },
    );
  }
}
