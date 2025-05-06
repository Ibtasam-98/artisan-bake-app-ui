import 'package:artisanbakes/config/app_sizedbox.dart';
import 'package:artisanbakes/config/appcolors.dart';
import 'package:artisanbakes/views/auth/login_screen.dart';
import 'package:artisanbakes/views/auth/signup_screen.dart';
import 'package:artisanbakes/widgets/custom_button.dart';
import 'package:artisanbakes/widgets/custom_text.dart';
import 'package:artisanbakes/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../widgets/custom_positioned_circle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final usernameController = TextEditingController();
    final confirmPassword = TextEditingController();
    final contactNumberFieldController = TextEditingController();


    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Positioned(
              top: 45.h,
              left: 15.w,
              child: InkWell(
                onTap: (){
                  Get.back();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.west,
                      color: AppColor.black,
                      size: 16.h,
                    ),
                    AppSizedBox.space5w,
                    CustomText(
                      textColor: AppColor.black,
                      title: "Back",
                      fontSize: 16.sp,
                    )
                  ],
                ),
              )
          ),
          CustomPositionedCircle(
            offset: Offset(-100,-80),
            size: 180,
            color:  AppColor.secondry.withOpacity(0.3),
            borderWidth: 20,
          ),
          CustomPositionedCircle(
            offset: Offset(-140,-115),
            size: 250,
            color:  AppColor.primary,
            borderWidth: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: "Sign Up",
                  fontSize: 25.sp,
                  textColor: AppColor.black,
                  textStyle: GoogleFonts.fredoka(),
                ),
                CustomText(
                  title: "Register with Us",
                  fontSize: 16.sp,
                  textColor: AppColor.primary,
                  textStyle: GoogleFonts.quicksand(),
                  textAlign: TextAlign.start,
                ),
                AppSizedBox.space15h,
                CustomTextField(
                  label: "Username",
                  isPassword: false,
                  textEditingController: usernameController,
                  icon: Icons.person,
                  borderColor: AppColor.black.withOpacity(0.2),
                ),
                CustomTextField(
                  label: "Email",
                  isPassword: false,
                  textEditingController: emailController,
                  icon: Icons.email_outlined,
                  borderColor: AppColor.black.withOpacity(0.2),
                ),
                CustomTextField(
                  label: "Contact Number",
                  isPassword: false,
                  textEditingController: contactNumberFieldController,
                  icon: Icons.phone_android_outlined,
                  borderColor: AppColor.black.withOpacity(0.2),
                ),
                CustomTextField(
                  label: "Password",
                  isPassword: true,
                  textEditingController: passwordController,
                  icon: Icons.password,
                  borderColor: AppColor.black.withOpacity(0.2),
                ),
                CustomTextField(
                  label: "Confirm Password",
                  isPassword: true,
                  textEditingController: confirmPassword,
                  icon: Icons.password,
                  borderColor: AppColor.black.withOpacity(0.2),
                ),
                AppSizedBox.space25h,
                CustomButton(
                  onTap: (){

                  },
                  btnWidth: Get.width,
                  height: 45.h,
                  haveBgColor: true,
                  useGradient: true,
                  btnTitle: "Register",
                  btnTitleColor: AppColor.white,
                  bgColor: AppColor.primary,
                  borderRadius: 45.r,
                  gradient:LinearGradient(
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                      colors: [
                        AppColor.primary,
                        AppColor.secondry
                      ]
                  ),
                  btnTitleFontSize: 16.sp,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: InkWell(
              onTap: (){
                Get.to(LoginScreen());
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomText(
                  firstText: "Already have an Account",
                  secondText: " Login here",
                  firstTextColor: AppColor.black,
                  secondTextColor: AppColor.primary,
                  fontSize: 12.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
