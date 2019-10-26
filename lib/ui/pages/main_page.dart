import 'package:flutter/material.dart';
import 'package:restaurant_finder/bloc/location_bloc.dart';
import 'package:restaurant_finder/bloc/providers/bloc_provider.dart';
import 'package:restaurant_finder/data/location.dart';

import 'package:restaurant_finder/ui/pages/location_page.dart';
import 'package:restaurant_finder/ui/pages/restaurant_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {

    /*
      These widgets will automatically listen for events from the stream.
      When a new event is received, the builder closure will be executed,
      updating the widget tree.
      With StreamBuilder and the BLoC pattern, there is no need to call setState() once in this entire tutorial.
     */

    return StreamBuilder<Location>(
      stream: BlocProvider.of<LocationBloc>(context).locationStream,
      builder: (context, snapshot) {
        final location = snapshot.data;

        if(location == null)
          return LocationPage(title: 'Where do you want to eat?');

        return RestaurantPage(location: location,);
      }
    );
  }
}
