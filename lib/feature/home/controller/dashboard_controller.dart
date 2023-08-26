import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DashboardController extends GetxController {

  DashboardController();

  PageController pageController = PageController(initialPage: 0);
  int selectedIndex = 0;

  void navigationTapped(int page){
    pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 1),
        curve: Curves.ease
    );
    selectedIndex = page;
    update();
  }

  void onPageViewChange(int page) {
    selectedIndex = page;
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}
