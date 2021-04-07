import 'package:flutter/material.dart';
import 'package:web_rtc/screens/ChatsScreen/components/conversation_row.dart';

import 'components/custom_logo.dart';
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
        searchBar(),
        conversationRows(),

        ///`active list`
      ],
    );
  }

  Expanded conversationRows() {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: 17,
        itemBuilder: (context, index) => ConversationRow(
          makeBold: index % 2 == 0,
          isActive: index % 3 == 0,
          lastConversation: "hey wanna go",
          lastMsgTime: "12:23pm",
          name: "Mikasa",
          leading: Icon(Icons.ac_unit),
          onPres: () {
            print("$index");
          },
        ),
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
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
