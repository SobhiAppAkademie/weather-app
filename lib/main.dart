import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_project/json/aufgabe2/json_parser.dart' as Parser2;
import 'package:weather_project/json/aufgabe3_4/json_parser.dart' as Parser3;
import 'package:weather_project/json/aufgabe5/weather_data.dart' as JSON5;
import 'package:weather_project/json/aufgabenblatt/weather_data.dart';
import 'package:weather_project/json/aufgabenblatt/weather_repo.dart';


import 'json/aufgabe3_4/weather_data.dart' as WeatherData3;
import 'json/aufgabe5/weather_repository.dart' as REPO5;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  FutureBuilderExample(),
    );
  }
}



class Aufgabe1 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    return Scaffold(

      body: Center(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Center(
               child: Padding(
                 padding: const EdgeInsets.all(20),
                 child: Container(


                   decoration: BoxDecoration(
                     color: const Color(0xFFFFFBFE),
                     border: Border.all(color: Colors.black,width: 0.1)
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Container(
                         height: 50,
                         color: const Color(0xFFE8E2F1),
                         child: Center(
                           child: Text("Wetter-App",style: theme.textTheme.titleMedium?.copyWith(fontSize: 20),),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(15),
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Center(child: Text("Stadt: Stuttgart",style: theme.textTheme.labelLarge?.copyWith(fontSize: 25,color: Colors.blue),)),
                             const SizedBox(height: 20,),
                             Center(child: Text("Gefühlte Temperatur: -10°",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                             const SizedBox(height: 20,),
                             Center(child: Text("Temperatur: -4°",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                             const SizedBox(height: 20,),
                             Center(child: Text("Niederschlag: 15.00 mm",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                             const SizedBox(height: 20,),
                             Center(child: Text("Tageszeit: Tag",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                             const SizedBox(height: 20,),
                             Center(child: Text("Standort: lat: 48.783, long: 9.183",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                             const SizedBox(height: 20,),
                             Center(
                               child: MaterialButton(
                                 onPressed: () => (){},
                                 padding: EdgeInsets.symmetric(horizontal: 20),
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(18.0),
                                     side: const BorderSide(color: Color(0xFF6B54A6))
                                 ),
                                 child: Text("Vorhersage updaten",style: theme.textTheme.labelMedium?.copyWith(fontSize: 14,color: const Color(0xFF6B54A6)),),
                               )
                             )
                           ],
                         ),
                       )
                     ],
                   ),
                 ),
               ),
             ),
           ],
         ),
      ),

    );
  }
}


class Aufgabe2 extends StatefulWidget {
  const Aufgabe2({super.key});




  @override
  State<Aufgabe2> createState() => _Aufgabe2();
}

class _Aufgabe2 extends State<Aufgabe2> {


  final Parser2.JSONParser jsonParser = Parser2.JSONParser();
  Map<String,dynamic>? weatherData;


  void update(){
    setState(() {
      weatherData = jsonParser.parseData();
    });
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(


                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFBFE),
                      border: Border.all(color: Colors.black,width: 0.1)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        color: const Color(0xFFE8E2F1),
                        child: Center(
                          child: Text("Wetter-App",style: theme.textTheme.titleMedium?.copyWith(fontSize: 20),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(child: Text("Stadt: Stuttgart",style: theme.textTheme.labelLarge?.copyWith(fontSize: 25,color: Colors.blue),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Gefühlte Temperatur: ${weatherData?["current"]["apparent_temperature"] ?? "n.a"}°",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Temperatur: ${weatherData?["current"]["temperature_2m"] ?? "n.a"}°",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Niederschlag: ${weatherData?["current"]["precipitation"] ?? "n.a"} mm",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Tageszeit: ${weatherData != null ? (weatherData?["current"]["is_day"] == 1 ? "Tag": "Nacht") : "n.a"}",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Standort: lat: ${weatherData?["latitude"] ?? "n.a"}, long: ${weatherData?["longitude"] ?? "n.a"}",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                            const SizedBox(height: 20,),
                            Center(
                                child: MaterialButton(
                                  onPressed: () => update(),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Color(0xFF6B54A6))
                                  ),
                                  child: Text("Vorhersage updaten",style: theme.textTheme.labelMedium?.copyWith(fontSize: 14,color: const Color(0xFF6B54A6)),),
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class Aufgabe3_4 extends StatefulWidget {
  const Aufgabe3_4({super.key});




  @override
  State<Aufgabe3_4> createState() => _Aufgabe3_4();
}

class _Aufgabe3_4 extends State<Aufgabe3_4> {


  final Parser3.JSONParser jsonParser = Parser3.JSONParser();
  WeatherData3.WeatherData? weatherData;

  void update() async {
    weatherData = await jsonParser.parseData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(


                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFBFE),
                      border: Border.all(color: Colors.black,width: 0.1)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        color: const Color(0xFFE8E2F1),
                        child: Center(
                          child: Text("Wetter-App",style: theme.textTheme.titleMedium?.copyWith(fontSize: 20),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(child: Text("Stadt: Stuttgart",style: theme.textTheme.labelLarge?.copyWith(fontSize: 25,color: Colors.blue),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Gefühlte Temperatur: ${weatherData?.current.apparent_temperature ?? "n.a"}°",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Temperatur: ${weatherData?.current.temperature_2m ?? "n.a"}°",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Niederschlag: ${weatherData?.current.precipitation ?? "n.a"} mm",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Tageszeit: ${weatherData != null ? (weatherData!.current.is_day == 1 ? "Tag": "Nacht") : "n.a"}",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Standort: lat: ${weatherData?.latitude ?? "n.a"}, long: ${weatherData?.longitude ?? "n.a"}",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                            const SizedBox(height: 20,),
                            Center(
                                child: MaterialButton(
                                  onPressed: () => update(),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Color(0xFF6B54A6))
                                  ),
                                  child: Text("Vorhersage updaten",style: theme.textTheme.labelMedium?.copyWith(fontSize: 14,color: const Color(0xFF6B54A6)),),
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class Aufgabe5 extends StatefulWidget {
  const Aufgabe5({super.key});




  @override
  State<Aufgabe5> createState() => _Aufgabe5();
}

class _Aufgabe5 extends State<Aufgabe5> {


  final REPO5.WeatherRepository weatherRepository = REPO5.WeatherRepository();


  void update() async {
    await weatherRepository.getWeather();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(


                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFBFE),
                      border: Border.all(color: Colors.black,width: 0.1)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        color: const Color(0xFFE8E2F1),
                        child: Center(
                          child: Text("Wetter-App",style: theme.textTheme.titleMedium?.copyWith(fontSize: 20),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(child: Text("Stadt: Stuttgart",style: theme.textTheme.labelLarge?.copyWith(fontSize: 25,color: Colors.blue),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Gefühlte Temperatur: ${weatherRepository.weatherData?.current.apparent_temperature ?? "n.a"}°",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Temperatur: ${weatherRepository.weatherData?.current.temperature_2m ?? "n.a"}°",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Niederschlag: ${weatherRepository.weatherData?.current.precipitation ?? "n.a"} mm",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Tageszeit: ${weatherRepository.weatherData != null ? (weatherRepository.weatherData!.current.is_day == 1 ? "Tag": "Nacht") : "n.a"}",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                            const SizedBox(height: 20,),
                            Center(child: Text("Standort: lat: ${weatherRepository.weatherData?.latitude ?? "n.a"}, long: ${weatherRepository.weatherData?.longitude ?? "n.a"}",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                            const SizedBox(height: 20,),
                            Center(
                                child: MaterialButton(
                                  onPressed: () => update(),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(color: Color(0xFF6B54A6))
                                  ),
                                  child: Text("Vorhersage updaten",style: theme.textTheme.labelMedium?.copyWith(fontSize: 14,color: const Color(0xFF6B54A6)),),
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {


  WeatherRepository repository = WeatherRepository();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(


                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFBFE),
                      border: Border.all(color: Colors.black,width: 0.1)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        color: const Color(0xFFE8E2F1),
                        child: Center(
                          child: Text("Wetter-App",style: theme.textTheme.titleMedium?.copyWith(fontSize: 20),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: FutureBuilder<WeatherData?>(
                          future: repository.getWeather(),
                          builder: (context,state) {

                            /// Ein Fehler ist aufgetreten
                            if(state.hasError){
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Center(child: Text("Stadt: Stuttgart",style: theme.textTheme.labelLarge?.copyWith(fontSize: 25,color: Colors.blue),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Gefühlte Temperatur: Fehler",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Temperatur: Fehler",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Niederschlag: Fehler",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Tageszeit: Fehler",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Standort: Fehler",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Regen: Fehler",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Schneit: Fehler",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                  const SizedBox(height: 20,),

                                  Center(
                                      child: MaterialButton(
                                        onPressed: () => (){},
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: const BorderSide(color: Color(0xFF6B54A6))
                                        ),
                                        child: Text("Vorhersage updaten",style: theme.textTheme.labelMedium?.copyWith(fontSize: 14,color: const Color(0xFF6B54A6)),),
                                      )
                                  ),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Fehler-Nachricht: ${state.error}",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),

                                ],
                              );
                            }

                            /// Wir haben Daten erhalten
                            if(state.hasData){
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Center(child: Text("Stadt: Stuttgart",style: theme.textTheme.labelLarge?.copyWith(fontSize: 25,color: Colors.blue),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Gefühlte Temperatur: ${state.data!.weatherCurrentData.apparent_temperature}°",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Temperatur: ${state.data!.weatherCurrentData.temperature_2m}°",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Niederschlag: ${state.data!.weatherCurrentData.precipitation} mm",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Tageszeit: ${state.data!.weatherCurrentData.isDay ? "Tag" : "Nacht"}",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Standort: lat: ${state.data!.latitude}, long: ${state.data!.longitude}",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Regen: ${state.data!.weatherCurrentData.regnet ? "Ja": "Nein"}",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                  const SizedBox(height: 20,),
                                  Center(child: Text("Schneit: ${state.data!.weatherCurrentData.schneit ? "Ja": "Nein"}",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),

                                  const SizedBox(height: 20,),

                                  Center(
                                      child: MaterialButton(
                                        onPressed: () => (){},
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: const BorderSide(color: Color(0xFF6B54A6))
                                        ),
                                        child: Text("Vorhersage updaten",style: theme.textTheme.labelMedium?.copyWith(fontSize: 14,color: const Color(0xFF6B54A6)),),
                                      )
                                  )
                                ],
                              );
                            }

                            /// Haben noch keine Daten bekommen
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Center(child: Text("Stadt: Stuttgart",style: theme.textTheme.labelLarge?.copyWith(fontSize: 25,color: Colors.blue),)),
                                const SizedBox(height: 20,),
                                Center(child: Text("Gefühlte Temperatur: Warten...",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                                const SizedBox(height: 20,),
                                Center(child: Text("Temperatur: Warten...",style: theme.textTheme.displayMedium?.copyWith(fontSize: 18),)),
                                const SizedBox(height: 20,),
                                Center(child: Text("Niederschlag: Warten...",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                const SizedBox(height: 20,),
                                Center(child: Text("Tageszeit: Warten...",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                const SizedBox(height: 20,),
                                Center(child: Text("Standort: Warten...",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                const SizedBox(height: 20,),
                                Center(child: Text("Regen: Warten...",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                const SizedBox(height: 20,),
                                Center(child: Text("Schneit: Warten...",style: theme.textTheme.displaySmall?.copyWith(fontSize: 15),)),
                                const SizedBox(height: 20,),

                                Center(
                                    child: MaterialButton(
                                      onPressed: () => (){},
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18.0),
                                          side: const BorderSide(color: Color(0xFF6B54A6))
                                      ),
                                      child: Text("Vorhersage updaten",style: theme.textTheme.labelMedium?.copyWith(fontSize: 14,color: const Color(0xFF6B54A6)),),
                                    )
                                )
                              ],
                            );
                          }
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
