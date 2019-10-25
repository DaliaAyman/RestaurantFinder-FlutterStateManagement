import 'dart:async';
import 'package:restaurant_finder/data/location.dart';
import 'package:restaurant_finder/data/zomato_client.dart';
import 'bloc.dart';

//This BLoC is almost the same the as the last one except that
// instead of just storing and reporting locations, this one encapsulates an API call.

class LocationQueryBloc extends AbstractBloc{

  final _locationQueryController = StreamController<List<Location>>();
  Stream<List<Location>> get locationStream => _locationQueryController.stream;

  void submitQuery(String query) async{
    final results = await ZomatoClient().fetchLocations(query);
    _locationQueryController.sink.add(results);
  }

  @override
  void dispose() {
    _locationQueryController.close();
  }
}