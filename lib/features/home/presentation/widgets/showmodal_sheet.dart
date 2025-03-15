import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sissyphus/core/common_widgets/app_elevated_button.dart';
import 'package:sissyphus/core/common_widgets/app_textfield.dart';
import 'package:sissyphus/core/utils/extensions.dart';
import 'package:sissyphus/features/home/presentation/widgets/duration_box.dart';

import '../../../../core/utils/app_colors.dart';
import 'bottom_sheet_content.dart';

void modalBottomSheet(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: AppColors.primaryShade700,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
        ),
        side: const BorderSide(
          color: AppColors.borderColor,
          width: 1,
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            minChildSize: 0.4,
            maxChildSize: 1.0,
            builder: (context, scrollController) {
              return BottomSheetContent();
            });
      });
}


