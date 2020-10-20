import 'package:flutter/material.dart';
import 'package:tuto_weather/UI/weather.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Weather(),
      ),
    );
  }
}
