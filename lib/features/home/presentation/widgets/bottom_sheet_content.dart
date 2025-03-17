import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sissyphus/core/common_widgets/app_elevated_button.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../../../../core/common_widgets/app_dropdown_field.dart';
import '../../../../core/common_widgets/app_textfield.dart';
import '../../../../core/utils/app_colors.dart';
import 'duration_box.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({
    super.key,
  });

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final TextEditingController priceLimitController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  bool isLimit = true;
  bool isMarket = false;
  bool isStopLimit = false;

  final List<String> items = [
    'Good till cancelled',
    'Immediate or cancel',
    'Fill or kill',
  ];
  String? selectedItem = '';
  String? selectedCurrency = '';
  final List<String> currencies = [
    'NGN',
    'USD',
    'EUR',
  ];
  bool isPostOnly = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Pushes content up
      ),
      child: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              40.hi,
              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryShade900,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 0.9,
                  ),
                ),
                child: TabBar(
                  labelPadding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  labelStyle: context.textTheme.bodyMedium
                      ?.copyWith(fontSize: 14.sp, color: Colors.white),
                  unselectedLabelColor: AppColors.white,
                  indicator: BoxDecoration(
                    color: AppColors.primaryShade800,
                    borderRadius: BorderRadius.circular(16.r),
                    border:
                        Border.all(width: 1, color: AppColors.greenShade500),
                  ),
                  tabs: const [
                    Tab(text: 'Buy'),
                    Tab(text: 'Sell'),
                  ],
                ),
              ),
              16.hi,
              SizedBox(
                height: 4.sh,
                child: TabBarView(
                  // controller: _tabController,
                  children: [
                    Column(
                      children: [
                        20.hi,
                        Row(
                          children: [
                            DurationBox(
                              onTap: () {
                                setState(() {
                                  isLimit = true;
                                  isMarket = false;
                                  isStopLimit = false;
                                });
                              },
                              label: 'Limit',
                              isActive: isLimit,
                              bgColor: AppColors.primaryShade500,
                            ),
                            DurationBox(
                              onTap: () {
                                setState(() {
                                  isMarket = true;
                                  isLimit = false;
                                  isStopLimit = false;
                                });
                              },
                              label: 'Market',
                              isActive: isMarket,
                              bgColor: AppColors.primaryShade500,
                            ),
                            DurationBox(
                              onTap: () {
                                setState(() {
                                  isStopLimit = true;
                                  isMarket = false;
                                  isLimit = false;
                                });
                              },
                              label: 'Stop-Limit',
                              isActive: isStopLimit,
                              bgColor: AppColors.primaryShade500,
                            ),
                          ],
                        ),
                        26.hi,
                        AppTextField(
                          hintText: '',
                          label: 'Limit price',
                          controller: priceLimitController,
                          keyboardType: TextInputType.number,
                        ),
                        16.hi,
                        AppTextField(
                          hintText: '',
                          label: 'Amount',
                          controller: amountController,
                          keyboardType: TextInputType.number,
                        ),
                        16.hi,
                        AppDropdownField(
                          hintText: 'Select',
                          items: items,
                          value: (selectedItem != null &&
                                  items.contains(selectedItem))
                              ? selectedItem
                              : null,
                        ),
                        28.hi,
                        Row(
                          children: [
                            Container(
                              height: 16.h,
                              width: 16.w,
                              decoration: BoxDecoration(
                                color: AppColors.primaryShade900,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4.r),
                                ),
                              ),
                              child: Checkbox(
                                value: isPostOnly,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    isPostOnly = !isPostOnly;
                                  });
                                },
                                activeColor: AppColors.pink,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(4.r),
                                )),
                                side: const BorderSide(
                                  color: AppColors.primaryShade300,
                                  width: 1,
                                ),
                              ),
                            ),
                            8.wi,
                            Text(
                              'Post Only',
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.greyShade200,
                              ),
                            ),
                            5.wi,
                            SvgPicture.asset('info_icon'.svg),
                          ],
                        ),
                        28.hi,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.greyShade200,
                              ),
                            ),
                            Text(
                              '0.00',
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontSize: 12.sp,
                                color: AppColors.greyShade200,
                              ),
                            ),
                          ],
                        ),
                        16.hi,
                        AppElevatedButton(
                          gradient: const LinearGradient(
                            colors: [
                              AppColors.purple,
                              AppColors.lilac,
                              AppColors.pink,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          label: 'Buy BTC',
                          fontSize: 14.sp,
                          onTap: () {},
                        ),
                        16.hi,
                        const Divider(
                          color: AppColors.primaryShade600,
                        ),
                        16.hi,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total account value',
                                    style:
                                        context.textTheme.bodyMedium?.copyWith(
                                      fontSize: 12.sp,
                                      color: AppColors.greyShade200,
                                    ),
                                  ),
                                  8.hi,
                                  Text(
                                    '0.00',
                                    style:
                                        context.textTheme.titleSmall?.copyWith(
                                      fontSize: 14.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 50.w,
                              child: AppDropdownField(
                                items: currencies,
                                value: (selectedCurrency != null &&
                                        currencies.contains(selectedCurrency))
                                    ? selectedCurrency
                                    : null,
                                contentPadding: EdgeInsets.zero,
                                hasBorder: false,
                                textStyle:    context.textTheme.bodyMedium?.copyWith(
                                  fontSize: 12.sp,
                                  color: AppColors.greyShade200,
                                ),
                              ),
                            ),
                          ],
                        ),
                        16.hi,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Open Orders',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColors.greyShade200,
                                  ),
                                ),
                                8.hi,
                                Text(
                                  '0.00',
                                  style: context.textTheme.titleSmall?.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Available',
                                  style: context.textTheme.bodyMedium?.copyWith(
                                    fontSize: 12.sp,
                                    color: AppColors.greyShade200,
                                  ),
                                ),
                                Text(
                                  '0.00',
                                  style: context.textTheme.titleSmall?.copyWith(
                                    fontSize: 14.sp,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        50.hi,
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            width: 100.w,
                            child: AppElevatedButton(
                              label: 'Deposit',
                              fontSize: 14.sp,
                              onTap: () {},
                              bgColor: AppColors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text('Melo'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ).padHorizontal(16),
    );
  }
}
