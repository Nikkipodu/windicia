import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windicia/navigations.dart';
import 'package:windicia/weather_provider.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        title: 'Windicia',
        theme: ThemeData(primarySwatch: Colors.indigo),
        initialRoute: '/',
        routes:routes,
      ),
    );
  }
}

