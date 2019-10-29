
import 'package:flutter/material.dart';
import 'package:restaurant_finder/bloc/index.dart';
import 'package:restaurant_finder/data/restaurant.dart';
import 'package:restaurant_finder/ui/widgets/restaurant_tile.dart';

class FavoritePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final favoriteBloc = BlocProvider.of<FavoriteBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
      ),
      body: StreamBuilder<List<Restaurant>>(
        stream: favoriteBloc.favoritesStream,
        initialData: favoriteBloc.favorites,
        builder: (context, snapshot) {

          List<Restaurant> favorites = (snapshot.connectionState == ConnectionState.waiting)? favoriteBloc.favorites : snapshot.data;

          if(favorites == null || favorites.isEmpty){
            return Center(
              child: Text("No Favorites"),
            );
          }

          return ListView.separated(
              itemBuilder: (context, index){
                final item = favorites[index];
                return RestaurantTile(restaurant: item);
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: favorites.length);
        }
      ),
    );
  }
}
