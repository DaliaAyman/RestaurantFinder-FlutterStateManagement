import 'package:flutter/material.dart';
import 'package:restaurant_finder/bloc/location_bloc.dart';
import 'package:restaurant_finder/bloc/providers/bloc_provider.dart';

import 'package:restaurant_finder/ui/pages/location_page.dart';

import 'package:restaurant_finder/ui/pages/main_page.dart';

void main() => runApp(RestaurantApp());

class RestaurantApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bloc = LocationBloc();

    return BlocProvider(
      bloc: bloc,
      child: MaterialApp(
        title: "Restaurant Finder",
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: MainPage(),
      ),
    );
  }
}