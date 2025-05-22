import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppHomeScreenController extends GetxController{

  var selectedIndex = 0.obs;
  var searchText = "".obs;

  void onItemTapped(int index){
    selectedIndex.value = index;
  }

  void updateSearchText(String text){
    searchText.value = text;
  }
}