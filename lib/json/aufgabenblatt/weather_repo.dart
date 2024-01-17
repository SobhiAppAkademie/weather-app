import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

import 'weather_data.dart';

class WeatherRepository {

  Future<WeatherData?> getWeather() async {

    try {
      final url = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,apparent_temperature,is_day,precipitation,rain,showers,snowfall&hourly=temperature_2m,rain,snowfall,visibility&timezone=Europe%2FBerlin";

      /// Hier holen wir uns die Daten
      final response = await get(Uri.parse(url));

      /// Hier konvertieren wir den String in ein JSON Objekt
      Map<String, dynamic> datenVomServer = json.decode(response.body);



      /// Umleiten des JSON Objekts in die Klasse und returnen
      return WeatherData.fromJSON(datenVomServer);
    } catch(e){
      rethrow;
    }
  }


  /*void saveJSONFile(String json) async {

    final temp = await getTemporaryDirectory();
    File file = File(temp.path);
    file.writeAsStringSync(json);

    file.readAsStringSync()
  }*/

}