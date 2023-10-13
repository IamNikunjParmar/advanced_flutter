import 'dart:convert';

import 'package:flutter/services.dart';


class JasonHelper {

  JasonHelper._();

  static final JasonHelper jasonHelper = JasonHelper._();


  Future<List> getData() async{

    String data = await rootBundle.loadString("assets/json/data.json");

    List allData = jsonDecode(data);

    return allData;

  }

  Future<List>geetaGetData() async {

    String data = await rootBundle.loadString("assets/json/bhagwat_geeta.json");

    List allGeetaData = jsonDecode(data);

    return allGeetaData;

  }




}