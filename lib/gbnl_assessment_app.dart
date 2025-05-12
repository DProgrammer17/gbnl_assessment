import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:great_brands_assessment/core/constants/app_colors.dart';
import 'package:great_brands_assessment/features/splash/ui/splash_page.dart';

import 'core/constants/app_constants.dart';
import 'core/constants/app_strings.dart';
import 'core/theme/global_app_bar_theme.dart';

class GbnlApp extends StatelessWidget{
  const GbnlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(AppConstants.designWidth, AppConstants.designHeight),
      splitScreenMode: true,
      minTextAdapt: false,
      builder: (_, child){
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemStatusBarContrastEnforced: true,
          ),
          child: MaterialApp(
            title: AppStrings.appName,
            theme: ThemeData(
              useMaterial3: false,
              primaryColor: AppColors.primaryPurple,
              scaffoldBackgroundColor: AppColors.neutralWhite,
              appBarTheme: globalAppBarTheme,
            ),
            debugShowCheckedModeBanner: false,
            home: const SplashPage(),
          ),
        );
      },
    );
  }

}