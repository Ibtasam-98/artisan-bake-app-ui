import 'package:artisanbakes/config/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/app_sizedbox.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String btnTitle;
  final Color btnTitleColor;
  final Color? btnBorderColor;
  final Color bgColor;
  final bool haveBgColor;
  final bool useGradient;
  final Gradient? gradient;
  final double borderRadius;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final double? height;
  final double? btnWidth; // Added parameter for button width
  final VoidCallback? onTap;
  final bool isLoading;
  final double? btnTitleFontSize;

  const CustomButton({
    super.key,
    required this.haveBgColor,
    required this.btnTitle,
    required this.btnTitleColor,
    this.btnBorderColor,
    required this.bgColor,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.gradient,
    this.useGradient = true,
    required this.borderRadius,
    this.height,
    this.btnWidth, // Initialize the new parameter
    this.onTap,
    this.isLoading = false,
    this.btnTitleFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: btnWidth, // Use the provided width
        height: height ?? 60.h,
        decoration: BoxDecoration(
          color: haveBgColor ? bgColor : null,
          gradient: useGradient && gradient != null ? gradient : null,
          border: Border.all(
            color: btnBorderColor ?? Colors.transparent,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Centered Text
            CustomText(
              textColor: btnTitleColor,
              fontSize: btnTitleFontSize ?? 20.sp,
              title: btnTitle,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
            // Left Aligned Icon with Spacing
            if (icon != null)
              Positioned(
                left: 10.w,
                child: Icon(
                  icon,
                  color: iconColor ?? AppColor.black,
                  size: iconSize ?? 24.0,
                ),
              ),
            // Loading Indicator (remains centered)
            if (isLoading)
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
          ],
        ),
      ),
    );
  }
}