import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';

class BubbleButton extends StatelessWidget {
  BubbleButton({
    super.key,
    required this.img,
    this.isActive = false,
    required this.onTap,
  });

  final String img;
  bool isActive;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 8.w,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryShade500 : Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(4.r),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(img.svg),
        ),
      ),
    );
  }
}