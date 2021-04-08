import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_rtc/screens/chat_screen/components/name_status.dart';

class ChatAppBar extends StatefulWidget {
  @override
  _ChatAppBarState createState() => _ChatAppBarState();
}

class _ChatAppBarState extends State<ChatAppBar> {
  String name = "Name Here";
  String photUrl = "assets/images/yeasin.jpg";
  String lastActive = "Active";

  @override
  Widget build(BuildContext context) {
    //TODO:: chat appbar of conversation
    if (kIsWeb)
      return Row(
        children: [
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {},
          ),
        ],
      );
    else
      ////`phone appbar`
      return headerProfileActions(context);
  }

  Widget headerProfileActions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          ///`back arrow, receiver pic, name`
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 4),
                icon: Icon(
                  Icons.navigate_before,
                  color: Colors.blueAccent,
                  size: kToolbarHeight * .7,
                ),
                onPressed: () {
                  print("pop");
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: ClipOval(
                  child: Image.asset(
                    photUrl,
                    height: kToolbarHeight * .8,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              ///`name & active status`
              NameActivity(name: name, lastActive: lastActive),
            ],
          ),

          ///`action buttons`
          Expanded(
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.call,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      print("audio call");
                    }),
                IconButton(
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      print("Video call");
                    }),
                IconButton(
                    icon: Icon(
                      Icons.info,
                      color: Colors.blueAccent,
                    ),
                    onPressed: () {
                      print("more info/actions");
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
