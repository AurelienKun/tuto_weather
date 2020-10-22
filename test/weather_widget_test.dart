import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../lib/UI/weather.dart';
import '../lib/model/WeatherData.dart';

void main() {
  testWidgets('Weather Widget Test', (WidgetTester tester) async {
    final wData =
        WeatherData(main: "Nuageux", icon: "04d", name: "Mock", temp: 18.0);
    await mockNetworkImagesFor(
        () => tester.pumpWidget(directAncestor(Weather(weatherData: wData))));
    expect(find.byType(RichText), findsWidgets);
    expect(find.byType(Row), findsWidgets);
    expect(find.text("Nuageux"), findsOneWidget);
  });
}

Widget directAncestor(Widget child) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Center(
      child: child,
    ),
  );
}
