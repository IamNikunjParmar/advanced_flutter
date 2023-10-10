
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practical_exam_app/Model/qoutes_model.dart';


class ApiHelper{


  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String QuoteApi = "https://api.api-ninjas.com/v1/quotes";

 String category = 'happiness';


Future<List<QuoteModel>?>getQouteData({String category = 'happiness'}) async {
  
  
 http.Response response = await http.get(Uri.parse("$QuoteApi?category=$category"),
    headers: {
      'X-Api-Key':'EmHYPfSq0nffZDKFokM9ug==Zv2vCzKKlOL22ZJr'
    }


  );

 if(response.statusCode == 200){


   List data = jsonDecode(response.body);

   List<QuoteModel> allQuotes = data.map((e) => QuoteModel.fromJson(
       json: e
   )
   ).toList();

   return allQuotes;

 }
 else {
   return null;
 }


}





}