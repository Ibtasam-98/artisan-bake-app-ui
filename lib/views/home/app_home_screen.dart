import 'package:artisanbakes/config/app_sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../config/appcolors.dart';
import '../../widgets/cateogry_item.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/product_item.dart';
import '../../widgets/tab_item.dart';
import '../boarding/app_home_screen_controller.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final AppHomeScreenController appHomeScreenController = Get.put(AppHomeScreenController());

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.transparent,
        leading: Icon(
          Icons.menu,
          color: AppColor.black,
          size: 16.h,
        ),
        centerTitle: false,
        title: CustomText(
          firstText: "Artisan",
          secondText: " Bakes",
          firstTextColor: AppColor.primary,
          secondTextColor: AppColor.black,
          textColor: AppColor.black,
          fontSize: 18.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomText(
                    title: "Deliever to",
                    textColor: AppColor.black,
                    fontSize: 12.sp,
                    textStyle: GoogleFonts.montserrat(),
                    fontWeight: FontWeight.bold,
                  ),
                  AppSizedBox.space5w,
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                  )
                ],
              ),
              CustomText(
                title: "Islamabad, Pakistan",
                textColor: AppColor.primary,
                fontSize: 12.sp,
              ),
              AppSizedBox.space10h,
              Container(
                decoration: BoxDecoration(
                  color: AppColor.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  onChanged: (text) => appHomeScreenController.updateSearchText(text),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: AppColor.black),
                    hintText: "Search",
                    hintStyle: GoogleFonts.quicksand(),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
              AppSizedBox.space10h,
              CustomText(
                title: "Category",
                textColor: AppColor.black,
                fontSize: 14.sp,
                textStyle: GoogleFonts.montserrat(),
                fontWeight: FontWeight.bold,
              ),
              AppSizedBox.space10h,
              SizedBox(
                height: 70.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryItem(title: 'Burger', icon: Icons.fastfood, bgColor: AppColor.pink.shade50),
                    CategoryItem(title: 'Hot Dog', icon: Icons.lunch_dining, bgColor: AppColor.blue.shade50),
                    CategoryItem(title: 'Taco', icon: Icons.tapas, bgColor: AppColor.orange.shade50),
                    CategoryItem(title: 'Pizza', icon: Icons.local_pizza, bgColor: AppColor.green.shade50),
                    CategoryItem(title: 'Donut', icon: Icons.donut_large, bgColor: AppColor.primary.withOpacity(0.2)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    title: "Best Popular",
                    textColor: AppColor.black,
                    fontSize: 14.sp,
                    textStyle: GoogleFonts.montserrat(),
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    title: "View All",
                    textColor: AppColor.primary,
                    fontSize: 12.sp,
                    textStyle: GoogleFonts.quicksand(),
                  ),
                ],
              ),
              AppSizedBox.space10h,
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:  [
                    TabItem(title: "Cupcake", isSelected: true),
                    TabItem(title: "Sponge", isSelected: false),
                    TabItem(title: "Red Velvet", isSelected: false),
                    TabItem(title: "Chiffon", isSelected: false),
                    TabItem(title: "Cheesecake", isSelected: false),
                  ],
                ),
              ),
              AppSizedBox.space10h,
              Column(
                children: [
                  Row(
                    children: [
                      ProductCard(
                        title:"Vanila",
                        subtitle:"with cheese oil",
                        price: "\$5.0",
                        imgUrl: "assets/cupcake1.png",
                        rating:"4.0",
                      ),
                      AppSizedBox.space10w,
                      ProductCard(
                        title:"Vanila",
                        subtitle:"with cheese oil",
                        price: "\$5.0",
                        imgUrl: "assets/cupcake2.png",
                        rating:"4.0",
                      )
                    ],
                  ),
                  AppSizedBox.space10h,
                  Row(
                    children: [
                      ProductCard(
                        title:"Vanila",
                        subtitle:"with cheese oil",
                        price: "\$5.0",
                        imgUrl: "assets/cupcake3.png",
                        rating:"4.0",
                      ),
                      AppSizedBox.space10w,
                       ProductCard(
                        title:"Vanila",
                        subtitle:"with cheese oil",
                        price: "\$5.0",
                        imgUrl: "assets/cupcake4.png",
                        rating:"4.0",
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Obx(
                () => GNav(
              gap: 10,
              activeColor: AppColor.white,
              textStyle: GoogleFonts.quicksand(
                color: Colors.white,
                fontSize: 12.sp,
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              duration: const Duration(milliseconds: 400),
              tabBorderRadius: 45.r,
              iconSize: 18.sp,
              color: AppColor.black,
              tabBackgroundGradient: const LinearGradient(
                colors: [
                  AppColor.primary,
                  Colors.pink,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Option 2',
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Option 3',
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Option 4',
                ),
              ],
              selectedIndex: appHomeScreenController.selectedIndex.value,
              onTabChange: (index) {
                appHomeScreenController.onItemTapped(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}