import 'package:flutter/material.dart';
import 'package:restaurant_finder/bloc/location_bloc.dart';
import 'package:restaurant_finder/bloc/location_query_bloc.dart';
import 'package:restaurant_finder/bloc/providers/bloc_provider.dart';
import 'package:restaurant_finder/data/location.dart';

class LocationPage extends StatelessWidget {
  final String title;
  final bool isFullScreenDialog;

  LocationPage({Key key, this.title, this.isFullScreenDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LocationQueryBloc();

    return BlocProvider(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter a location'),
                onChanged: (query) {
                  bloc.submitQuery(query);
                },
              ),
            ),
            Expanded(
              child: _buildResults(bloc),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildResults(LocationQueryBloc bloc) {
    return StreamBuilder<List<Location>>(
        stream: bloc.locationStream,
        builder: (context, snapshot) {
          final results = snapshot.data;

          if (results == null) {
            return Center(
              child: Text("Enter a location"),
            );
          }

          if (results.isEmpty) {
            return Center(
              child: Text("No Results"),
            );
          }

          return _buildSearchResults(results);
        });
  }

  Widget _buildSearchResults(List<Location> results) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final locationItem = results[index];

          return ListTile(
            title: Text(locationItem.title),
            onTap: (){
              final locationBloc = BlocProvider.of<LocationBloc>(context);
              locationBloc.selectLocation(locationItem);

              if(isFullScreenDialog){
                Navigator.of(context).pop();
              }
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: results.length);
  }
}
