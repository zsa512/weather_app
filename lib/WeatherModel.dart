import 'package:weather_app/GeneralUtils.dart';

class WeatherModel {
  String temp = '';
  String tempMin = '';
  String tempMax = '';
  String weatherName = '';

  WeatherModel({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weatherName,
  });

  WeatherModel.fromJson(Map<String, dynamic> json) {
    var jsonMain = json['main'];
    var weatherObj = json['weather'][0];
    temp = GeneralUtils().convertTempInCelsius(jsonMain['temp'].toString());
    tempMin =
        GeneralUtils().convertTempInCelsius(jsonMain['temp_min'].toString());
    tempMax =
        GeneralUtils().convertTempInCelsius(jsonMain['temp_max'].toString());
    weatherName = weatherObj['main'];
  }
}
