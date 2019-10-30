import 'package:flutter/material.dart';
import 'package:restaurant_finder/bloc/providers/bloc_provider.dart';
import 'package:restaurant_finder/bloc/restaurant_bloc.dart';
import 'package:restaurant_finder/data/location.dart';
import 'package:restaurant_finder/data/restaurant.dart';
import 'package:restaurant_finder/ui/widgets/restaurant_tile.dart';

import 'favorite_page.dart';
import 'location_page.dart';

class RestaurantPage extends StatelessWidget {
  final Location location;

  const RestaurantPage({Key key, this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(location.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => FavoritePage())))
        ],
      ),
      body: _buildSearch(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit_location),
          onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            LocationPage(title: 'Where do you want to eat?', isFullScreenDialog: true,)
          ));
      }),
    );
  }

  Widget _buildSearch(BuildContext context) {
    final bloc = RestaurantBloc(location);

    return BlocProvider<RestaurantBloc>(
      bloc: bloc,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "What do you want to eat?"),
              onChanged: (query) => bloc.submitQuery(query),
            ),
          ),
          Expanded(child: _buildStreamBuilder(bloc)),
        ],
      ),
    );
  }

  Widget _buildStreamBuilder(RestaurantBloc bloc) {
    return StreamBuilder<List<Restaurant>>(
        stream: bloc.restaurantStream,
        builder: (context, snapshot) {
          final results = snapshot.data;

          if (results == null) {
            return Center(child: Text("Enter a restaurant name"));
          }

          if (results.isEmpty) {
            return Center(
              child: Text("No Results"),
            );
          }

          return _buildSearchResults(results);
        });
  }

  Widget _buildSearchResults(List<Restaurant> results) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final restaurantItem = results[index];

          return RestaurantTile(
            restaurant: restaurantItem,
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: results.length);
  }
}
