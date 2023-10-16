
class WeatherModel {

   double wind_speed;
   int wind_degrees;
   int temp;
   int humidity;
   int sunset;
   int min_temp ;
   int cloud_pct;
   int feels_like;
   int sunrise;
   int max_temp;

  WeatherModel({
    required this.wind_speed,
    required this.wind_degrees,
    required this.temp,
    required this.sunset,
    required this.sunrise,
    required this.min_temp,
    required this.max_temp,
    required this.humidity,
    required this.feels_like,
    required this.cloud_pct,

  });

  factory WeatherModel.formMap({required Map data}){
    return WeatherModel(
       wind_speed: data['wind_speed'],
       wind_degrees: data['wind_degrees'],
       temp: data['temp'],
       sunset: data['sunset'],
       sunrise: data['sunrise'],
       min_temp: data['min_temp'],
       max_temp: data['max_temp'],
       humidity: data['humidity'],
       feels_like: data['feels_like'],
       cloud_pct: data['cloud_pct'],
    );
  }



}
