import 'package:artisanbakes/config/app_sizedbox.dart';
import 'package:artisanbakes/widgets/custom_button.dart';
import 'package:artisanbakes/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/appcolors.dart';
import '../../controller/onboarding_screen_controller.dart';
import '../../widgets/custom_positioned_stack_circle.dart';
import '../auth/login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingScreenController controller = Get.put(onBoardingScreenController());
    final List<Color> circleColors = [
      AppColor.green,
      AppColor.blue,
      AppColor.primary,
      AppColor.secondry,
      AppColor.pink,
    ];
    final List<Offset> circlePositions = [
      const Offset(25,65),
      const Offset(80,400),
      const Offset(80,150),
      const Offset(150,100),
      const Offset(25,200),
    ];


    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          buildPositiondCircle(const Offset(-100,-80),180, AppColor.secondry.withOpacity(0.3), 20),
          buildPositiondCircle(const Offset(-140,-115),250, AppColor.primary, 20),
          _buildPositionedImageStack(const Offset(30, 200),160, "assets/cake.png",3, AppColor.pink,130),
          _buildpositionedImageCircle(const Offset(120, 160), "assets/bread.png", 45),
          _buildpositionedImageCircle(const Offset(30, 300), "assets/macroon.png", 80),

          Positioned(
            bottom:80,
            left: 30,
            right: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  firstText: "Artisan",
                  secondText: " Bakes",
                  firstTextColor: AppColor.black,
                  secondTextColor: AppColor.secondry,
                  fontSize: 20.sp,
                ),
                AppSizedBox.space10h,
                CustomText(
                  title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                  fontSize: 16.sp,
                  textColor: Colors.black,
                  textAlign: TextAlign.start,
                ),
                AppSizedBox.space35h,
                Obx(() => _buildContinueButtion(controller, context)),
              ],
            ),
          ),
          for(int i = 0 ; i< circleColors.length; i++)
            Positioned(
              top: circlePositions[i].dy,
              left: circlePositions[i].dx,
              child: _buildSmallCircle(circleColors[i])
            )
        ],
      ),
    );
  }

  Widget _buildPositionedImageStack(Offset offset, double stackSize, String imagePath,
      double borderwidth, Color borderColor, double imageSize,){
       return Positioned(
         top: offset.dy,
         left: offset.dx,
         child: Stack(
           alignment: Alignment.center,
           children: [
             Container(
               width: stackSize,
               height: stackSize,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 border: Border.all(
                   color: borderColor,
                   width: borderwidth,
                 ),
               ),
             ),
             ClipOval(
               child: Image.asset(imagePath, width: imageSize,height: imageSize,fit: BoxFit.cover,),
             )
           ],
         ),
       );
  }


  Widget _buildpositionedImageCircle( Offset offset, String imagePath, double size){
    return Positioned(
        top: offset.dy,
        right: offset.dx,
        child: Container(
          child: ClipOval(
            child: Image.asset(imagePath, width: size,height: size,fit: BoxFit.cover,),
          )
        ),
    );
  }

  Widget _buildContinueButtion(onBoardingScreenController controller, BuildContext context){
    return AnimatedOpacity(
        opacity: controller.showContinueButton.value ? 1.0 : 0.0,
        duration: const Duration(seconds: 1),
      child: SlideTransition(
          position: controller.slideAnimaiton,
        child: CustomButton(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
          },
            haveBgColor: true,
            btnTitle: "Continue",
            btnTitleColor: AppColor.white,
            bgColor: AppColor.primary,
            borderRadius: 45.r,
          btnTitleFontSize: 16.sp,
          height: 50.h,
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: [
                AppColor.primary,
                AppColor.secondry
              ]
          ),
        ),
      ),
    );
  }

  Widget _buildSmallCircle(Color color){
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color
      ),
    );
  }
}
