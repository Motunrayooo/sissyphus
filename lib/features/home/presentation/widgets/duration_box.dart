import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';

class DurationBox extends StatelessWidget {
  const DurationBox({
    this.isActive = false,
    required this.onTap,
    this.label,
    this.child,
    this.bgColor,
    this.borderRadius,
    super.key,
  });

  final bool isActive;
  final void Function()? onTap;
  final String? label;
  final Widget? child;
  final Color? bgColor;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? bgColor ?? AppColors.primaryShade400 : Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 30.r),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 6.h,
          horizontal: 12,
        ),
        child: Center(
          child: child ??
              Text(
                label ?? '',
                style: context.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: isActive ? AppColors.white : AppColors.greyShade200,
                ),
              ),
        ),
      ),
    );
  }
}
