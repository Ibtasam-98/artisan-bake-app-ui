import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/appcolors.dart';
import 'custom_text.dart';

class TabItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const TabItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : AppColor.grey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CustomText(
          title: title,
          fontSize: 12.sp,
          textColor: isSelected ? AppColor.white : AppColor.black,
        ),
      ),
    );
  }
}