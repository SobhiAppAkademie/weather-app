import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_project/json/aufgabe5/weather_data.dart';

class WeatherRepository {

  final url = "https://api.open-meteo.com/v1/forecast?latitude=48.783333&longitude=9.183333&current=temperature_2m,apparent_temperature,is_day,precipitation&timezone=Europe%2FBerlin&forecast_days=1";

  WeatherData? weatherData;


  Future<void> getWeather() async {
    try{
      final response = await get(Uri.parse(url));
      weatherData = WeatherData.fromMap(json.decode(response.body));
    } catch(e){
      print("[JSON-Parser-Exception]: Weather Data could not be parsed: ${e}");
    }
  }
}