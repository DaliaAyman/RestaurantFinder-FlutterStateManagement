

import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a location'),
              onChanged: (query) { },
            ),
          ),
          Expanded(
            child: _buildResults(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildResults() {
    return Container();
  }
}
