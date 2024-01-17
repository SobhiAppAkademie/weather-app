class WeatherData {
  final double latitude;
  final double longitude;
  final WeatherCurrentData weatherCurrentData;

  factory WeatherData.fromJSON(Map<String,dynamic> json){
    return WeatherData(latitude: json["latitude"], longitude: json["longitude"], weatherCurrentData: WeatherCurrentData.fromJSON(json["current"]));
  }

  WeatherData({required this.latitude, required this.longitude, required this.weatherCurrentData});

}

class WeatherCurrentData {
  final double apparent_temperature;
  final double temperature_2m;
  final double precipitation;
  final bool isDay;
  final bool schneit;
  final bool regnet;

  factory WeatherCurrentData.fromJSON(Map<String,dynamic> json){
    return WeatherCurrentData(precipitation: json["precipitation"],schneit: json["snowfall"] == 1,regnet: json["rain"] == 1, temperature_2m: json["temperature_2m"], apparent_temperature: json["apparent_temperature"], isDay: json["is_day"] == 1);
  }

  WeatherCurrentData({required this.schneit, required this.regnet,required this.precipitation,required this.temperature_2m, required this.apparent_temperature, required this.isDay});
}

