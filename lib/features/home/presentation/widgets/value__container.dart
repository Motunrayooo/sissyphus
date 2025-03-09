import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';


import '../../../../core/common_widgets/app_vertical_divider.dart';
import '../../../../core/utils/app_colors.dart';

class ValueContainer extends StatelessWidget {
  const ValueContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        top: 20.h,
        bottom: 20.h,
        right: 8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('coin'.svg),
              16.wi,
              Text(
                'BTC/USDT',
                style: context.textTheme.bodyMedium?.copyWith(
                  fontSize: 18.sp,
                ),
              ),
              16.wi,
              SvgPicture.asset('down_arrow'.svg),
              16.wi,
              Text(
                '\$20,634',
                style: context.textTheme.bodyMedium
                    ?.copyWith(fontSize: 18.sp, color: AppColors.green),
              ),
            ],
          ),
          20.hi,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('clock'.svg),
                      4.wi,
                      Text(
                        '24h change',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.greyShade200,
                        ),
                      ),
                    ],
                  ),
                  8.hi,
                  Text(
                    '520.80 +1.25%',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.green,
                    ),
                  ),
                ],
              ),
              AppVerticalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('arrow_up'.svg),
                      4.wi,
                      Text(
                        '24h high',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.greyShade200,
                        ),
                      ),
                    ],
                  ),
                  8.hi,
                  Text(
                    '520.80 +1.25%',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
           AppVerticalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('arrow_down'.svg),
                      4.wi,
                      Text(
                        '24h low',
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.greyShade200,
                        ),
                      ),
                    ],
                  ),
                  8.hi,
                  Text(
                    '520.80 -1.25%',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}