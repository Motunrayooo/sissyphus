import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../utils/app_colors.dart';

class AppDropdownField extends StatefulWidget {
  AppDropdownField({
    super.key,
    required this.items,
    this.onChanged,
    required this.value,
    this.hintText,
    this.contentPadding,
    this.hasBorder = true,
    this.textStyle,
  });

  final List<String> items;
  final void Function(String?)? onChanged;
  final String? value, hintText;
  final EdgeInsetsGeometry? contentPadding;
  bool hasBorder;
  final TextStyle? textStyle;

  @override
  State<AppDropdownField> createState() => _AppDropdownFieldState();
}

class _AppDropdownFieldState extends State<AppDropdownField> {
  String? selectedValue;

  @override
  void initState() {
    selectedValue = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: selectedValue,
      hint: Text(
        widget.hintText ?? '',
        style: context.textTheme.bodyMedium?.copyWith(
          fontSize: 12.sp,
        ),
        overflow: TextOverflow.ellipsis,
        softWrap: true,
      ),
      icon: SvgPicture.asset('down_arrow'.svg,color: AppColors.greyShade200,),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(
              vertical: -7.h,
              horizontal: 16.w,
            ),
        focusedBorder: OutlineInputBorder(
          borderSide: widget.hasBorder
              ? BorderSide(
                  color: AppColors.primaryShade300,
                  width: 2.w,
                )
              : BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: widget.hasBorder
              ? BorderSide(
                  color: AppColors.primaryShade300,
                  width: 2.w,
                )
              : BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10.r),
          ),
        ),
      ),
      items: widget.items
          .map(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: widget.textStyle ?? context.textTheme.bodySmall
                    ?.copyWith(color: AppColors.white),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          )
          .toList(),
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
    );
  }
}
