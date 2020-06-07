import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_report/config/default.dart';
import 'package:weather_report/models/weathermodel.dart';
import 'package:weather_report/utility/appstate.dart';
import 'package:http/http.dart' as http;

class WeatherController with ChangeNotifier {
  AppState _state = AppState.Idle;
  AppState get state => _state;
  void setState(AppState appState) {
    _state = appState;
    notifyListeners();
  }

  WeatherModel weatherModel = new WeatherModel();
  WeatherModel get weather => weatherModel;
  Future<WeatherModel> getWeather(String city) async {
    try {
      setState(AppState.Busy);
      var weatherResponse = await http.get(Config().apiurl + city);
      if (weatherResponse.statusCode == 200) {
        weatherModel = WeatherModel.fromJson(json.decode(weatherResponse.body));
      }
    } catch (e) {
      setState(AppState.Idle);
    }
    setState(AppState.Idle);
    return weatherModel;
  }
}
