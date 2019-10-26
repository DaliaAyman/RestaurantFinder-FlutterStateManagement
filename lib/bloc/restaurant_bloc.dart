
import 'dart:async';

import 'package:restaurant_finder/data/location.dart';
import 'package:restaurant_finder/data/restaurant.dart';
import 'package:restaurant_finder/data/zomato_client.dart';

import 'bloc.dart';

/*
  It’s almost the same as LocationQueryBloc! The only difference is the API and the data type that is being returned.
 */

class RestaurantBloc implements AbstractBloc{

  final Location location;
  RestaurantBloc(this.location);

  final _restaurantController = StreamController<List<Restaurant>>();

  Stream<List<Restaurant>> get restaurantStream => _restaurantController.stream;

  void submitQuery(String query) async{
    final results = await ZomatoClient().fetchRestaurants(location, query);
    _restaurantController.sink.add(results);
  }

  @override
  void dispose() {
    _restaurantController.close();
  }
}