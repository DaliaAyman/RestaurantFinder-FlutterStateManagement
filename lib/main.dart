import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Restaurant Finder",
      theme: ThemeData(
        primarySwatch: Colors.red.shade800,
      ),
      home: HomePage(title: 'Restaurant Finder Home Page'),
    );
  }
}