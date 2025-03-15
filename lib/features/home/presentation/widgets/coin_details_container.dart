import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../../../../core/common_widgets/app_vertical_divider.dart';
import '../../../../core/utils/app_colors.dart';
import 'chart_page.dart';
import 'duration_box.dart';
import 'order_page.dart';

class CoinDetailsContainer extends StatefulWidget {
  const CoinDetailsContainer({super.key});

  @override
  State<CoinDetailsContainer> createState() => _CoinDetailsContainerState();
}

class _CoinDetailsContainerState extends State<CoinDetailsContainer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border.all(
          color: AppColors.borderColor,
        ),
      ),
      child: Column(
        children: [
          16.hi,
          Container(
            height: 57.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryShade900,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.borderColor,
                width: 0.9,
              ),
            ),
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              controller: _tabController,
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
                Tab(text: 'Charts'),
                Tab(text: 'Orderbook'),
                Tab(text: 'Recent trades'),
              ],
            ),
          ).padHorizontal(16),
          16.hi,
          SizedBox(
            height: .5.sh,
            child: TabBarView(
              controller: _tabController,
              children: const [
                ChartPage(),
                OrderBookPage(),
                Column(
                  children: [],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
