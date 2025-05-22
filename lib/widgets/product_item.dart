import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_sizedbox.dart';
import '../config/appcolors.dart';
import 'custom_text.dart';


class ProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imgUrl;
  final String rating;

  const ProductCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imgUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColor.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  child: Image.asset(
                    imgUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: AppColor.yellow, size: 14.sp,),
                          AppSizedBox.space5w,
                          CustomText(
                            title: rating,
                            textColor: AppColor.yellow,
                            fontSize: 10.sp,
                            textStyle: GoogleFonts.quicksand(),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: title,
                    fontSize: 14.sp,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.bold, // Added for better emphasis
                  ),
                  CustomText(
                    title: subtitle,
                    fontSize: 10.sp,
                    textAlign: TextAlign.start,
                    textColor: AppColor.grey, // Added for better contrast
                  ),
                  AppSizedBox.space5h,
                  Padding(
                    padding: EdgeInsets.only(right: 10.w, bottom: 8.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          title: price,
                          fontSize: 14.sp,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.bold, // Added for better emphasis
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: AppColor.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.favorite_border,
                            size: 18,
                            color: AppColor.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
