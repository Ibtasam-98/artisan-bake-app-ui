import 'package:flutter/material.dart';

import 'package:artisanbakes/config/app_sizedbox.dart';
import 'package:artisanbakes/widgets/custom_button.dart';
import 'package:artisanbakes/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/appcolors.dart';
import '../../controller/onboarding_screen_controller.dart';
import '../../widgets/custom_positioned_stack_circle.dart';
import '../../widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingScreenController controller =
    Get.put(onBoardingScreenController());


    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final userController = TextEditingController();
    final phoneNumberController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Positioned(
            top: 36.h,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.west,
                    size: 18.h,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                CustomText(
                  title: "Back",
                  textColor: AppColor.black,
                  fontSize: 18.sp,
                )
              ],
            ),
          ),
          buildPositiondCircle(const Offset(-100, -80), 180, AppColor.secondry.withOpacity(0.3), 20),
          buildPositiondCircle(const Offset(-140, -115), 250, AppColor.primary, 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: "Login",
                  fontSize: 25.sp,
                  textStyle: GoogleFonts.fredoka(),
                ),
                CustomText(
                  title: "Welcome back to our account",
                  fontSize: 16.sp,
                  textStyle: GoogleFonts.quicksand(),
                  textColor: AppColor.primary,
                ),
                AppSizedBox.space10h,
                CustomTextField(
                  label: "User",
                  isPassword: false,
                  contentPadding: EdgeInsets.all(15),
                  textEditingController: userController,
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                  borderColor: AppColor.black.withOpacity(0.1),
                ),
                CustomTextField(
                  label: "Email",
                  isPassword: false,
                  contentPadding: EdgeInsets.all(15),
                  textEditingController: emailController,
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                  borderColor: AppColor.black.withOpacity(0.1),
                ),
                CustomTextField(
                  label: "Contact Number",
                  isPassword: false,
                  contentPadding: EdgeInsets.all(15),
                  textEditingController: phoneNumberController,
                  icon: Icons.phone_android_outlined,
                  keyboardType: TextInputType.number,
                  borderColor: AppColor.black.withOpacity(0.1),
                ),
                CustomTextField(
                  label: "Password",
                  isPassword: true,
                  textEditingController: passwordController,
                  icon: Icons.lock,
                  contentPadding: EdgeInsets.all(15),
                  borderColor: AppColor.black.withOpacity(0.1),
                ),
                CustomTextField(
                  label: "Confirm Password",
                  isPassword: true,
                  textEditingController: passwordController,
                  icon: Icons.lock,
                  contentPadding: EdgeInsets.all(15),
                  borderColor: AppColor.black.withOpacity(0.1),
                ),

                AppSizedBox.space15h,
                CustomButton(
                  onTap: () {},
                  haveBgColor: true,
                  btnTitle: "Sign Up",
                  btnTitleColor: AppColor.white,
                  bgColor: AppColor.primary,
                  borderRadius: 45.r,
                  btnTitleFontSize: 14.sp,
                  height: 45.h,
                  btnWidth: Get.width - 30,
                  gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [AppColor.primary, AppColor.secondry]),
                ),

              ],
            ),
          ),
          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomText(
                firstText: "Already have an Account ?",
                secondText: " Login here",
                firstTextColor: AppColor.primary,
                secondTextColor: AppColor.black,
                fontFamily: 'grenda',
                fontSize: 12.sp,
                maxLines: 1,
                textStyle: GoogleFonts.quicksand(),
                textOverflow: TextOverflow.ellipsis,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

