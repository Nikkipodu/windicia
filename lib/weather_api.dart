import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherApi{
  final String apiKey;
  final String apiUrl= 'https://api.openweathermap.org/data/2.5/weather';

  WeatherApi({required this.apiKey}); 
  
  Future<Map<String, dynamic>> fetchWeatherData(double latitude, double longitude)async{
    final response = await http.get("https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=0818b875d3e21bd91f44fb28ef1f7554" as Uri);

    if(response.statusCode==200){
      return jsonDecode(response.body);
    } else{
      throw Exception('Failed to load the weather');
    }
  }
}