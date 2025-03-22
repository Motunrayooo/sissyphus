import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';
import 'package:sissyphus/features/home/presentation/widgets/showmodal_sheet.dart';

import '../../../../core/common_widgets/app_elevated_button.dart';
import '../../../../core/common_widgets/custom_menu_pop_up.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/candle_stick_chart.dart';
import '../widgets/coin_details_container.dart';
import '../widgets/value__container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
          GestureDetector(
            onTap: (){
              context.push(MaterialPageRoute(builder: (context){
                return CandleStickChart();
              }));
            },
            child: SvgPicture.asset(
              'globe'.svg,
            ),
          ),
          16.wi,
          CustomPopupMenu(
            onItemSelected: (selectedItem) {
              print("Tapped on: $selectedItem"); // Handle item tap here
            },
          ),
        ],
      ),
      backgroundColor: AppColors.primaryShade900,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueContainer(),
            8.hi,
            CoinDetailsContainer(),
            8.hi,
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                border: Border.all(
                  color: AppColors.borderColor,
                ),
              ),
              child: Column(
                children: [
                  10.hi,
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
                        Tab(text: 'Open Orders'),
                        Tab(text: 'Positions'),
                        Tab(text: 'Order History'),
                      ],
                    ),
                  ).padOnly(
                    left: 18.w,
                  ),
                  SizedBox(
                    height: .3.sh,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No Open Orders',
                              style: context.textTheme.titleSmall?.copyWith(
                                fontSize: 17.sp,
                              ),
                            ),
                            8.hi,
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                              style: context.textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ).padHorizontal(18),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No Open Positions',
                              style: context.textTheme.titleSmall?.copyWith(
                                fontSize: 17.sp,
                              ),
                            ),
                            8.hi,
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                              style: context.textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ).padHorizontal(18),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No Order History',
                              style: context.textTheme.titleSmall?.copyWith(
                                fontSize: 17.sp,
                              ),
                            ),
                            8.hi,
                            Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                              style: context.textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ).padHorizontal(18),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.h,
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.borderColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: AppElevatedButton(
                      label: 'Buy',
                      onTap: () {
                        modalBottomSheet(context);
                      },
                    ),
                  ),
                  8.wi,
                  Expanded(
                    child: AppElevatedButton(
                      label: 'Sell',
                      onTap: () {},
                      bgColor: AppColors.redShade500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PopupMenuItem<String> _buildMenuItem(String text) {
  return PopupMenuItem<String>(
    value: text,
    child: Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
  );
}
