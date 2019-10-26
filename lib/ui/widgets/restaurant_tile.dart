
import 'package:flutter/material.dart';
import 'package:restaurant_finder/data/restaurant.dart';

import '../image_container.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantTile({Key key, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageContainer(
        width: 50, height: 50,
        url: restaurant.thumbUrl,
      ),
      title: Text(restaurant.name),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }
}
