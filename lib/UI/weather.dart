import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Weather extends StatelessWidget {
  const Weather({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget dateSection = Container(
      child: Text(
        DateFormat('d MMMM, H:m').format(DateTime.now()),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
    );

    Widget tempSection = Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "20",
            style: TextStyle(fontSize: 80.0),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 12.0),
              margin: EdgeInsets.only(left: 6.0),
              child: Text(
                "\u2103",
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          ),
          Image.asset(
            'assets/img/nuage.png',
            width: 140.0,
            height: 140.0,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );

    Widget descriptionSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tokyo",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),Text(
            "Nuageux",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
    return Container(
      padding: EdgeInsets.all(60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [dateSection, tempSection, descriptionSection],
      ),
    );
  }
}
