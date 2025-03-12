import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';

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
      builder: (context) {
        return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            minChildSize: 0.4,
            maxChildSize: 1.0,
            builder: (context, scrollController) {
          return DefaultTabController(
            length: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                16.hi,
                Container(
                  height: 57.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryShade600,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: AppColors.borderColor,
                      width: 0.9,
                    ),
                  ),
                  child: TabBar(
                    labelPadding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 2.h,
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    labelStyle: context.textTheme.bodyMedium
                        ?.copyWith(fontSize: 14.sp, color: Colors.white),
                    unselectedLabelColor: AppColors.white,
                    indicator: BoxDecoration(
                      color: AppColors.primaryShade500.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    tabs: const [
                      Tab(text: 'Buy'),
                      Tab(text: 'Sell'),
                    ],
                  ),
                ).padHorizontal(16),
                16.hi,
                const Expanded(
                  child: TabBarView(
                    // controller: _tabController,
                    children: [
                      Column(
                        children: [Text('Hello')],
                      ),
                      Column(
                        children: [Text('Melo')],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
      });
}
