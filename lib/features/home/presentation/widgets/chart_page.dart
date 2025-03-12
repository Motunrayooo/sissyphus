import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../../../../core/common_widgets/app_vertical_divider.dart';
import '../../../../core/utils/app_colors.dart';
import 'duration_box.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  bool isOneHour = true;
  bool isTwoHour = false;
  bool isFourHour = false;
  bool isOneDay = false;
  bool isOneWeek = false;
  bool isOneMonth = false;
  bool isTrading = true;
  bool isDepth = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ListView(
              scrollDirection: Axis.horizontal,
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
                const AppVerticalDivider(),
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
        ).padHorizontal(6),
        10.hi,
        const Divider(
          color: AppColors.borderColor,
        ),
        16.hi,
        Row(
          children: [
            DurationBox(
              onTap: () {
                setState(() {
                  isTrading = true;
                  isDepth = false;
                });
              },
              label: 'Trading view',
              isActive: isTrading,
              bgColor: AppColors.primaryShade500,
              borderRadius: 100,
            ),
            DurationBox(
              onTap: () {
                setState(() {
                  isTrading = false;
                  isDepth = true;
                });
              },
              label: 'Depth',
              isActive: isDepth,
              bgColor: AppColors.primaryShade500,
              borderRadius: 100,
            ),
            20.wi,
            SvgPicture.asset('double_arrow'.svg),
          ],
        ).padHorizontal(16),
        16.hi,
        const Divider(
          color: AppColors.borderColor,
        ),
      ],
    );
  }
}
