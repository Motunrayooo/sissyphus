import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class AppVerticalDivider extends StatelessWidget {
  const AppVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: 50.h,
      child:  VerticalDivider(
        thickness: 1,
        color: AppColors.greyShade50.withOpacity(0.1),
      ),
    );
  }
}
