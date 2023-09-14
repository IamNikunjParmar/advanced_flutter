
import 'package:flutter/material.dart';

class DateController extends ChangeNotifier {
  DateTime? d = DateTime.now();

  TimeOfDay? t = TimeOfDay.now();

  timeChange({required TimeOfDay time }){

    t = time;
    notifyListeners();

  }





  dateChange({required DateTime dateTime }){

    d = dateTime;
    notifyListeners();
  }




}