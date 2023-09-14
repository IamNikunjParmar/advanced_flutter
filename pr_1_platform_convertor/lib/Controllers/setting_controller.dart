import 'package:flutter/material.dart';

class SettingController extends ChangeNotifier{

  bool isSelected = false;


  profileChange(){

    isSelected =!isSelected;
    notifyListeners();

  }


}