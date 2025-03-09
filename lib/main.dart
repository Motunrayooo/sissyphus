import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'core/utils/themes/app_theme.dart';
import 'features/home/presentation/screen/home_screen.dart';

void main() {
  runApp(const Sissyphus());
}

class Sissyphus extends StatelessWidget {
  const Sissyphus({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(390, 1137),
          minTextAdapt: true,
        builder: (context,child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
            darkTheme: AppTheme.lightTheme,

            home: const HomeScreen(),
          );
        }
      ),
    );
  }
}
