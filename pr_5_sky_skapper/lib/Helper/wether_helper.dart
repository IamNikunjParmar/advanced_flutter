import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:pr_5_sky_skapper/Modal/weather_modal.dart';


class ApiHelper {

  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  String searchData = "";

  String weatherApi = "https://api.api-ninjas.com/v1/weather";


  String city = 'surat';
  Future<WeatherModel?>getWeatherData({ String city = 'surat'}) async {


    http.Response response = await http.get(Uri.parse("$weatherApi?city=$city"),
        headers: {
          'X-Api-Key':'EmHYPfSq0nffZDKFokM9ug==Zv2vCzKKlOL22ZJr'
        }

    );

    if(response.statusCode == 200){

      Map data = jsonDecode(response.body);
      WeatherModel weatherModel = WeatherModel.formMap(data: data);


      return weatherModel;
    }
    else {
      return null;
    }

  }





}







