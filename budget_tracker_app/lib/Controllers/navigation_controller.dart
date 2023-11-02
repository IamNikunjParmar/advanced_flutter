
import 'package:budget_tracker_app/View/Componets/category_componets.dart';
import 'package:budget_tracker_app/View/Componets/chart_componets.dart';
import 'package:budget_tracker_app/View/Componets/home_componets.dart';
import 'package:budget_tracker_app/View/Componets/profile_componets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {

  RxInt selectedIndex = 0.obs;

  PageController pageController = PageController();


  List<Widget> pages = [
    HomeComponets(),
    const CategoryComponets(),
    const ChartComponets(),
    const ProfileComponets()
  ];


  changeIndex({required int index}){

    selectedIndex(index);

    pageController.animateToPage(
        index,
        duration: const Duration(
           milliseconds: 800
        ),
        curve: Curves.easeInOut);

  }


}