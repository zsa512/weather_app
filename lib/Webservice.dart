import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:weather_app/StaticValues.dart';
import 'package:weather_app/WeatherModel.dart';

class WeatherApiController {
  weatherApi() async {
    String host = "api.openweathermap.org";
    String apiUrl = "/data/2.5/weather";
    Map<String, dynamic> queryParams = {
      "q": StaticValues.cityName.toString(),
      "appid": StaticValues.weatherApiKey.toString(),
    };

    try {
      // API RESPONSE
      var url = Uri.https(host, apiUrl, queryParams);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        return WeatherModel.fromJson(jsonResponse);
      } else {
        throw Exception('error fetching weather');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
