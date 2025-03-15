import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../utils/app_colors.dart';

class AppDropdownField extends StatefulWidget {
  const AppDropdownField({
    super.key,
    required this.items,
    this.onChanged,
    required this.value,
  });

  final List<String> items;
  final void Function(String?)? onChanged;
  final String? value;

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
        'Select',
        style: context.textTheme.bodyMedium?.copyWith(
          fontSize: 12.sp,
        ),
        overflow: TextOverflow.ellipsis,
        softWrap: true,
      ),
      icon: SvgPicture.asset('down_arrow'.svg),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: -7.h,
            horizontal: 16.w,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryShade300,
              width: 2.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryShade300,
              width: 2.w,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.r),
            ),
          )),
      items: widget.items
          .map(
            (String value) => DropdownMenuItem<String>(
              value: value,
              child: SizedBox(
                width: 290.w,
                child: Text(
                  value,
                  style: context.textTheme.bodySmall
                      ?.copyWith(color: AppColors.white),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
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
