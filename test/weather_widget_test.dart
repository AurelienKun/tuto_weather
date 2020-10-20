import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tuto_weather/UI/weather.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Weather Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(directAncestor(Weather()));

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
