import 'package:flutter/material.dart';

import 'components/header.dart';

class BodyChatsScreen extends StatefulWidget {
  BodyChatsScreen({Key key}) : super(key: key);
  @override
  _BodyChatsScreenState createState() => _BodyChatsScreenState();
}

class _BodyChatsScreenState extends State<BodyChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),

        ///`search bar`
        searchBar()

        ///`active list`
      ],
    );
  }

  Padding searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          prefixIcon: Icon(
            Icons.search,
          ),
          hintText: "Search",
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
