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

    const baseDesignWidth = 360.0;
    const baseDesignHeight = 690.0;


    return ScreenUtilInit(
      designSize: const Size(baseDesignWidth, baseDesignHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        print("Initializing GetMaterialApp...");
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child:  OnBoardingScreen(),
    );
  }
}
