import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_sizedbox.dart';
import '../config/appcolors.dart';
import 'custom_text.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color bgColor;

  const CategoryItem({
    super.key,
    required this.title,
    required this.icon,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColor.primary, size: 28.0),
          ),
          AppSizedBox.space5h,
          CustomText(
            title: title,
            fontSize: 12.sp,
          )
        ],
      ),
    );
  }
}
