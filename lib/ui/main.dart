import 'package:flutter/material.dart';
import 'package:restaurant_finder/bloc/index.dart';
import 'package:restaurant_finder/ui/pages/main_page.dart';

void main() => runApp(RestaurantApp());

class RestaurantApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final locationBloc = LocationBloc();

    /*
      Favorite BLoC needs to be accessible from multiple screens, which means it needs to be placed above the navigator.
     */

    return BlocProvider(
      bloc: locationBloc,
      child: BlocProvider(
        bloc: FavoriteBloc(),
        child: MaterialApp(
          title: "Restaurant Finder",
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: MainPage(),
        ),
      ),
    );
  }
}