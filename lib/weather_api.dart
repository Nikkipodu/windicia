import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WeatherApi {
  final String apiKey;
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  WeatherApi({required this.apiKey});

  Future<Map<String, dynamic>> fetchWeatherData(
      double latitude, double longitude) async {
    // String fetchWeatherURl = 
    // TODO #1: add a ternary operator here to check whether the querying data is for Lat & Long or text search query. Based on the URL will change in the following manner
    // case 1: (lat & long) => "apiUrl?lat=<latitude value will come here>&long=<longitude value will come here>&appid=<your API key>
    // case 2: (query) => "apiUrl?q=<enter your city name>&appid=<your api key>.
    final response = await http.get(Uri.parse(
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
