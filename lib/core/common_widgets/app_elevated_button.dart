import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../utils/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  AppElevatedButton({
    required this.label,
    required this.onTap,
    this.bgColor = AppColors.greenShade500,
    super.key,
  });

  final String label;
  final void Function()? onTap;
  Color bgColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: context.textTheme.titleSmall?.copyWith(
              fontSize: 17.sp,
            ),
          ),
        ),
      ),
    );
  }
}