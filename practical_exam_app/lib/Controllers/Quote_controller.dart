

import 'package:flutter/material.dart';
import 'package:practical_exam_app/Helper/api_helper.dart';
import 'package:practical_exam_app/Model/qoutes_model.dart';


class QuoteController extends ChangeNotifier {


List<QuoteModel> allQuotes = [];


QuoteController(){
  getQuoteData();
}


getQuoteData({String category = 'happiness'}) async {

  allQuotes =  await ApiHelper.apiHelper.getQouteData(category: category) ?? [];

  notifyListeners();
}







}