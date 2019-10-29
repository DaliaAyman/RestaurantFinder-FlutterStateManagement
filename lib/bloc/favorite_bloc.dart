
import 'dart:async';

import 'package:restaurant_finder/data/restaurant.dart';

import 'bloc.dart';


/*
  Note: As a general rule when designing BLoCs, start with just a regular stream controller
  and then alter the code later if a broadcast stream need.
  Flutter will throw an exception if multiple objects try to listen to a regular stream.
  Use this as an indicator of when the code needs to be updated.
 */

class FavoriteBloc extends AbstractBloc{

  var _restaurants = <Restaurant>[];
  List<Restaurant> get favorites => _restaurants;

  /*
    Broadcast streams allow multiple listeners, whereas regular streams only allow one.
   */
  final _favoriteController = StreamController<List<Restaurant>>.broadcast();

  Stream<List<Restaurant>> get favoritesStream => _favoriteController.stream;

  void toggleRestaurant(Restaurant restaurant){
    if(_restaurants.contains(restaurant)){
      _restaurants.remove(restaurant);
    }else{
      _restaurants.add(restaurant);
    }

    _favoriteController.sink.add(_restaurants);
  }

  @override
  void dispose() {
    _favoriteController.close();
  }
}