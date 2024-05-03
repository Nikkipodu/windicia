import 'package:flutter/material.dart';
import 'package:windicia/home_page.dart';
import 'package:windicia/location_picker_screen.dart';

final Map<String, WidgetBuilder> routes={
  '/': (context) => const Homepage(),
  '/location_picker': (context) => LocationPickerScreen(),
};