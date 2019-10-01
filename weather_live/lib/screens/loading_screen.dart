import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location myLocation = Location();
    await myLocation.getCurrentLocation();
    print(myLocation.latitude);
    print(myLocation.longitute);
  }

  void getData() async {
    http.Response response = await http.get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');

    if (response.statusCode == 200) {
      String data = response.body;

      var weather_object = jsonDecode(data);

      double temperature = weather_object['main']['temp'];
      int condition = weather_object['weather'][0]['id'];
      String city_name = weather_object['name'];

    } else {
      throw Exception('Bad Request');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
