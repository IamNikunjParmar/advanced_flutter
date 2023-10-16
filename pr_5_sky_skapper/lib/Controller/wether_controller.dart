import 'package:flutter/cupertino.dart';
import 'package:pr_5_sky_skapper/Helper/wether_helper.dart';
import 'package:pr_5_sky_skapper/Modal/weather_modal.dart';
import 'package:provider/provider.dart';

class WeatherController extends ChangeNotifier{

 late WeatherModel  weatherModel ;

 bool isVisible = false;



WeatherController(){
  getWeatherData();
}


Future<WeatherModel?>getWeatherData({String city = 'surat'}) async {

  weatherModel =(await ApiHelper.apiHelper.getWeatherData(city: city))!;
  notifyListeners();
  return null;
}


visibleMethod(){

  isVisible = !isVisible;
  notifyListeners();

}













}