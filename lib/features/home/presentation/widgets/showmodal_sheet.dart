import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sissyphus/core/common_widgets/app_elevated_button.dart';
import 'package:sissyphus/core/common_widgets/app_textfield.dart';
import 'package:sissyphus/core/utils/extensions.dart';
import 'package:sissyphus/features/home/presentation/widgets/duration_box.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // Pushes content up
      ),
      child: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              40.hi,
              Container(
                height: 60.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryShade600,
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
                height: 400.h,
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
                        AppTextField(
                          hintText: '',
                          label: 'Type',
                          controller: typeController,
                          keyboardType: TextInputType.number,
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
