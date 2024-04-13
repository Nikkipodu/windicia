import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windicia/weather_data.dart';
import 'package:windicia/weather_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(title: const Text('Weather')),
      body: weatherData != null
          ? Center(
              child: Column(
              children: [
                // TODO #3: Add a text field to do text search. Use the enterred text and pass it to the API call.
                WeatherInfoWidget(weatherData: weatherData),
              ],
            ))
          : const CircularProgressIndicator(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO #4: I think you made this floating action button to add the weather update based on the location. Implement the get location functionality and then pass the lat & long to the API.  
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }
}

class WeatherInfoWidget extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherInfoWidget({super.key, required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: 150,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://openweathermap.org/img/wn/10d@2x.png")),
            )),
        const SizedBox(height: 10),
        Text(weatherData.city,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(weatherData.description, style: const TextStyle(fontSize: 23)),
        const SizedBox(height: 10),
        Text('''
                ${weatherData.temperature.toStringAsFixed(0)}''',
            style: const TextStyle(fontSize: 21)),
        Text("Humidity:${weatherData.humidity}",
            style: const TextStyle(fontSize: 19)),
      ],
    );
  }
}


