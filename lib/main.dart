import 'package:flutter/material.dart';
import 'package:tuto_weather/UI/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather tuto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.lightBlue,
      ),
      home: MyHomePage(title: 'Weather'),
    );
  }
}