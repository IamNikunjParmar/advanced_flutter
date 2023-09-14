import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {


  int NavigtionBar = 0;

  changenavigtion({required  int index }){

    NavigtionBar = index;

    notifyListeners();

  }


}