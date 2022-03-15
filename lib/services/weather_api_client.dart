import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/model/weather_model.dart';

class WeatherApiClient {
  Future <Weather> getCurrentWeather(String? location) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=a3ca5bd2564ab62208d3225286263482&units=metric");

    var resposne = await http.get(endpoint);
    var body = jsonDecode(resposne.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}