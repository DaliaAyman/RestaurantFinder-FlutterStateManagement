import 'dart:async';

import 'package:restaurant_finder/data/location.dart';

import 'bloc.dart';

// The first BLoC will be responsible for managing the app’s selected location.

class LocationBloc extends AbstractBloc{

  Location _location;
  Location get selectedLocation => _location;


  // STREAM CONTROLLER
  final _locationController = StreamController<Location>();
  Stream<Location> get locationStream => _locationController.stream;

  void selectLocation(Location location){
    _location = location;
    _locationController.add(location);
  }

  @override
  void dispose() {
    _locationController.close();
  }

}