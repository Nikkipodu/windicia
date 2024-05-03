import 'package:flutter/foundation.dart';
import 'package:windicia/location_data.dart';
import 'package:windicia/weather_data.dart';
import 'package:windicia/weather_api.dart';
import'package:geolocator/geolocator.dart'; 
import 'dart:async';

class WeatherProvider with ChangeNotifier {
  WeatherData? _weatherData;
  LocationData? _locationData;


  WeatherProvider() {
    getlocationAndFetchWeatherData();
  }


  Future<void> getlocationAndFetchWeatherData() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      _locationData = LocationData(
          latitude: position.latitude, longitude: position.longitude);
      fetchWeatherData();
    }
    catch (e) {
      if (kDebugMode) {
        print('Error in finding the location : $e');
      }
    }
  }
  Future<void>fetchWeatherData() async{
    try{
      final api = WeatherApi(apiKey:'0818b875d3e21bd91f44fb28ef1f7554');
      final data = await api.fetchWeatherDataByCityName(
        _locationData!.latitude as String, _locationData!.longitude , city);
      _weatherData = WeatherData(
          city: data['name'],
          description: data['weather'][0]['description'],
          temperature: data['main']['temp'],
          humidity: data['main']['humidity'],
      );
      notifyListeners(); }
        catch (e) {
      if (kDebugMode){
        print('Unable to fetch weather condition : $e');
      }
        }
  }
  WeatherData? get weatherData =>_weatherData;
  LocationData? get locationData => _locationData;

  void setLocation(double doubleLatitude, double doubleLongitude) {

  }
  }