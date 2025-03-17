import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sissyphus/core/utils/extensions.dart';

import '../utils/app_colors.dart';

class CustomPopupMenu extends StatelessWidget {
  final Function(String) onItemSelected;

  const CustomPopupMenu({Key? key, required this.onItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: AppColors.primaryShade900,
      // Background color of the menu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      onSelected: (String value) {
        onItemSelected(value);
      },
      itemBuilder: (BuildContext context) => [
        _buildMenuItem('Exchange',context),
        _buildMenuItem('Wallets',context),
        _buildMenuItem('Roqqu Hub',context),
        _buildMenuItem('Log out',context),
      ],
      child: SvgPicture.asset(
        'menu'.svg,
      ),
    ).padOnly(right: 16.w);
  }

  PopupMenuItem<String> _buildMenuItem(String text, BuildContext context) {
    return PopupMenuItem<String>(
      value: text,
      child: Text(
        text,
        style: context.textTheme.bodyMedium?.copyWith(
          fontSize: 16.sp,
        ), // Customize text color
      ),
    );
  }
}
