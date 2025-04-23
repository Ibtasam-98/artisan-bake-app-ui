import 'package:flutter/material.dart';
import 'package:get/get.dart';

class onBoardingScreenController extends GetxController with SingleGetTickerProviderMixin{
  final PageController pageController = PageController(initialPage: 0);
  RxInt currentPage = 0.obs;
  late AnimationController animationController;
  late Animation<Offset> slideAnimaiton;
  var showContinueButton = false.obs;


  @override
  void onInit(){
    super.onInit();
    animationController  = AnimationController(
      duration: const Duration(seconds: 1),
        vsync: this,
    );
    slideAnimaiton = Tween<Offset>(
      begin: const Offset(0,1),
      end: const Offset(0,0),
    ).animate(
      CurvedAnimation(
          parent: animationController,
          curve: Curves.easeInOut,
      )
    );
    Future.delayed(const Duration(seconds: 3), (){
      showContinueButton.value = true;
      animationController.forward();
    });
  }

  @override
  void onClose(){
    animationController.dispose();
    pageController.dispose();
    super.onClose();
  }
}
