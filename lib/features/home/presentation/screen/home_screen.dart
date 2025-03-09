import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/coin_details_container.dart';
import '../widgets/value__container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        shadowColor: AppColors.white,
        title: Row(
          children: [
            SvgPicture.asset(
              'sissyphus_logo'.svg,
              fit: BoxFit.scaleDown,
            ),
            9.29.wi,
            SvgPicture.asset(
              'logo_name'.svg,
            ),
          ],
        ).padOnly(left: 16.w),
        actions: [
          Image.asset(
            'profile'.png,
            height: 40.h,
            width: 40.w,
            fit: BoxFit.fitHeight,
          ),
          16.wi,
          SvgPicture.asset(
            'globe'.svg,
          ),
          16.wi,
          SvgPicture.asset(
            'menu'.svg,
          ).padOnly(right: 16.w),
        ],
      ),
      backgroundColor: AppColors.primaryShade600,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueContainer(),
            8.hi,
            CoinDetailsContainer(),
          ],
        ),
      ),
    );
  }
}
