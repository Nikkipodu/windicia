import 'package:flutter/material.dart';
import'package:provider/provider.dart';
import 'package:windicia/weather_provider.dart';

class LocationPickerScreen extends StatefulWidget{
   LocationPickerScreen({super.key});
  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
  }

class _LocationPickerScreenState extends State<LocationPickerScreen>{
  var doublelatitude= 0.0;
  var doublelongitude=0.0;
  TextEditingController searchController= TextEditingController();
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
            Text('Latitude:$doublelatitude'),
            Text('Longitude:$doublelongitude'),
            ElevatedButton(
                onPressed:(){
                  final weatherProvider= Provider.of<WeatherProvider>(context, listen: false);
                  weatherProvider.setLocation(doublelatitude, doublelongitude);
                  Navigator.pop(context);
                },
              child: const Text('Set the location'),
            ),
            TextField(
              controller: searchController,
          void Function(String)? onSubmitted:(),
              decoration: const InputDecoration(
                hintText: 'Enter the City',
                labelText: 'City',
                suffixIcon: Icon(
                   Icons.search,
                ),
              ),
        ),
  ]),
    ),
    );
  }
  }
