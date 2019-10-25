import 'package:flutter/material.dart';

import 'package:restaurant_finder/ui/location_page.dart';

void main() => runApp(RestaurantApp());

class RestaurantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Restaurant Finder",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LocationPage(title: 'Where do you want to eat?'),
    );
  }
}