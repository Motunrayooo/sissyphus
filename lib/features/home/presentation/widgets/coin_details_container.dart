import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../../../../core/common_widgets/app_vertical_divider.dart';
import '../../../../core/utils/app_colors.dart';
import 'duration_box.dart';

class CoinDetailsContainer extends StatefulWidget {
  const CoinDetailsContainer({super.key});

  @override
  State<CoinDetailsContainer> createState() => _CoinDetailsContainerState();
}

class _CoinDetailsContainerState extends State<CoinDetailsContainer>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isOneHour = true;
  bool isTwoHour = false;
  bool isFourHour = false;
  bool isOneDay = false;
  bool isOneWeek = false;
  bool isOneMonth = false;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
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
              color: AppColors.primaryShade600,
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
                color: AppColors.primary.withOpacity(0.8), // Active tab color
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
            height: .8.sh,
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListView(
                        
                          scrollDirection: Axis.horizontal,

                          // padding: EdgeInsets.zero,
                          // primary: false,
                          // physics: ClampingScrollPhysics(),
                          children: [
                            DurationBox(
                              onTap: () {},
                              isActive: false,
                              label: 'Time',
                            ),
                            DurationBox(
                              onTap: () {
                                setState(() {
                                  isOneHour = true;
                                  isTwoHour = false;
                                  isFourHour = false;
                                  isOneDay = false;
                                  isOneWeek = false;
                                  isOneMonth = false;
                                });
                              },
                              isActive: isOneHour,
                              label: '1H',
                            ),
                            DurationBox(
                              onTap: () {
                                setState(() {
                                  isOneHour = false;
                                  isTwoHour = true;
                                  isFourHour = false;
                                  isOneDay = false;
                                  isOneWeek = false;
                                  isOneMonth = false;
                                });
                              },
                              isActive: isTwoHour,
                              label: '2H',
                            ),
                            DurationBox(
                              onTap: () {
                                setState(() {
                                  isOneHour = false;
                                  isTwoHour = false;
                                  isFourHour = true;
                                  isOneDay = false;
                                  isOneWeek = false;
                                  isOneMonth = false;
                                });
                              },
                              isActive: isFourHour,
                              label: '4H',
                            ),
                            DurationBox(
                              onTap: () {
                                setState(() {
                                  isOneHour = false;
                                  isTwoHour = false;
                                  isFourHour = false;
                                  isOneDay = true;
                                  isOneWeek = false;
                                  isOneMonth = false;
                                });
                              },
                              isActive: isOneDay,
                              label: '1D',
                            ),
                            DurationBox(
                              onTap: () {
                                setState(() {
                                  isOneHour = false;
                                  isTwoHour = false;
                                  isFourHour = false;
                                  isOneDay = false;
                                  isOneWeek = true;
                                  isOneMonth = false;
                                });
                              },
                              isActive: isOneWeek,
                              label: '1W',
                            ),
                            DurationBox(
                              onTap: () {
                                setState(() {
                                  isOneHour = false;
                                  isTwoHour = false;
                                  isFourHour = false;
                                  isOneDay = false;
                                  isOneWeek = false;
                                  isOneMonth = true;
                                });
                              },
                              isActive: isOneMonth,
                              label: '1M',
                            ),
                            DurationBox(
                              onTap: () {},
                              isActive: false,
                             child: SvgPicture.asset('down_arrow'.svg),
                            ),
                            AppVerticalDivider(),
                            DurationBox(
                              onTap: () {},
                              isActive: false,
                              child: SvgPicture.asset('chrt_icon'.svg),
                            ),
                            DurationBox(
                              onTap: () {},
                              isActive: false,
                              label: 'Fx Indicators',
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                Column(
                  children: [],
                ),
                Column(
                  children: [],
                ),
              ],
            ),
          ).padHorizontal(16),
        ],
      ),
    );
  }
}
