import 'package:covid_data/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Info',
      theme: ThemeData(fontFamily: 'ComicNeue'),
      initialRoute: HomePage.routename,
      routes: {
        HomePage.routename: (_) => HomePage(),
      },
    );
  }
}