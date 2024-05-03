import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  final String apiKey;
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  WeatherApi({required this.apiKey});

  Future<Map<String, dynamic>> fetchWeatherDataByCityName(String cityName,
      double latitude, double longitude) async {
    String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=<enter your current city name>&appid={0818b875d3e21bd91f44fb28ef1f7554}';
    final http.Response response = await http.get(Uri.parse(
        "$apiUrl?q=hyderabad&appid=0818b875d3e21bd91f44fb28ef1f7554&lang=en"));
    if (response.statusCode == 200) {
      if (kDebugMode) {
        print(response.body);
        print(jsonDecode(response.body));
      }

      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load the weather');
    }
  }
}
