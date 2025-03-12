import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import 'bubble_button.dart';

class OrderBookPage extends StatefulWidget {
  const OrderBookPage({super.key});

  @override
  State<OrderBookPage> createState() => _OrderBookPageState();
}

class _OrderBookPageState extends State<OrderBookPage> {
  bool isRgActive = true;
  bool isRActive = false;
  bool isGActive = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        15.hi,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                BubbleButton(
                  img: 'rg',
                  onTap: () {
                    setState(() {
                      isRgActive = true;
                      isGActive = false;
                      isRActive = false;
                    });
                  },
                  isActive: isRgActive,
                ),
                4.wi,
                BubbleButton(
                  img: 'g_icon',
                  onTap: () {
                    setState(() {
                      isRgActive = false;
                      isGActive = true;
                      isRActive = false;
                    });
                  },
                  isActive: isGActive,
                ),
                4.wi,
                BubbleButton(
                  img: 'r_icon',
                  onTap: () {
                    setState(() {
                      isRgActive = false;
                      isGActive = false;
                      isRActive = true;
                    });
                  },
                  isActive: isRActive,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryShade500,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.r),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    '10',
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  16.wi,
                  SvgPicture.asset('down_arrow'.svg),
                ],
              ),
            ),
          ],
        ),
      ],
    ).padHorizontal(16);
  }
}
