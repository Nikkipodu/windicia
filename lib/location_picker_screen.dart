import 'package:flutter/material.dart';
import'package:provider/provider.dart';
import 'package:windicia/weather_provider.dart';

class LocationPickerScreen extends StatefulWidget{
   LocationPickerScreen({super.key});
  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
  TextEditingController searchController= TextEditingController();
  }

class _LocationPickerScreenState extends State<LocationPickerScreen>{
  var double_latitude= 0.0;
  var double_longitude=0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose your location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Latitude:$double_latitude'),
            Text('Longitude:$double_longitude'),
            ElevatedButton(
                onPressed:(){
                  final weatherProvider= Provider.of<WeatherProvider>(context, listen: false);
                  weatherProvider.setLocation(double_latitude, double_longitude);
                  Navigator.pop(context);
                },
              child: const Text('Set the location'),
            ),
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'Enter the City',
                labelText: 'City',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){
                    var fetchWeatherDataByText = provider.fetchWeatherDataByText(searchController.text);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  }
