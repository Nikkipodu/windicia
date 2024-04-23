
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
    _locationData = LocationData(latitude: 0.0, longitude: 0.0);
    getlocationAndFetchWeatherData();
  }
  WeatherData? get weatherData => _weatherData;
  LocationData? get locationData => _locationData;

  void setLocation(double latitude, double longitude) {
    _locationData = LocationData(latitude: latitude, longitude: longitude);
    fetchWeatherData();
  }

  Future<void> fetchWeatherDataByText() async {
    try {
      Position position= await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high, 
      ); 
      setLocation(position.latitude, position.longitude);
      final api = WeatherApi(apiKey: '0818b875d3e21bd91f44fb28ef1f7554');
      final data = await api.fetchWeatherData(
          _locationData!.latitude, _locationData!.longitude);
      if (kDebugMode) {
        print(
            '''${data['name']}, ${data['weather'][0]['description']}, ${data['main']['temp']}, ${data['main']['humidity']}''');
      }

      _weatherData = WeatherData(
        city: data['name'],
        description: data['weather'][0]['description'],
        temperature: data['main']['temp'],
        humidity: data['main']['humidity'],
      );
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching weather condition : $e');

        Future<void> fetchWeatherData() async {
          try {
            Position position= await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
            );
            setLocation(position.latitude, position.longitude);
            final api = WeatherApi(apiKey: '0818b875d3e21bd91f44fb28ef1f7554');
            final data = await api.fetchWeatherData(
                _locationData!.latitude, _locationData!.longitude);
            if (kDebugMode) {
              print(
                  '''${data['name']}, ${data['weather'][0]['description']}, ${data['main']['temp']}, ${data['main']['humidity']}''');
            }

            _weatherData = WeatherData(
              city: data['name'],
              description: data['weather'][0]['description'],
              temperature: data['main']['temp'],
              humidity: data['main']['humidity'],
            );
            notifyListeners();
          } catch (e) {
            if (kDebugMode) {
              print('Error fetching weather condition : $e');
      }
    }
  }
}
