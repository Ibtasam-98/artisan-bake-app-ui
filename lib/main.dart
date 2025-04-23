import 'package:artisanbakes/views/boarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    const baseDesignWidth = 360.0;
    const baseDesignHeight = 690.0;

    final bool isTablet = screenWidth < 600;

    double designWidth = baseDesignWidth;
    double designHeight = baseDesignHeight;

    if(isTablet){
      designWidth = 768.0;
      designHeight = 1024.0;
    }


    return ScreenUtilInit(
      designSize: Size(designWidth,designHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: true,
          home:child,
        );
      },
      child: OnBoardingScreen(),
    );
  }
}
