
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {

  RxInt selectedIndex = 0.obs;

  PageController pageController = PageController();


  changeIndex({required int index}){

    selectedIndex(index);
    pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut);

  }


}