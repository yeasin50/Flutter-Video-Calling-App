import 'package:flutter/material.dart';
import 'package:web_rtc/dummy_data/user_message.dart';
import 'package:web_rtc/model/message.dart';

class MessageProvider with ChangeNotifier {
  MessageProvider() {
    _getMessages();
    print("MP called");
  }
  List<Message> _messages = [];

  get messages => [..._messages];

  Future<void> _getMessages() async {
    _messages = await dummyMessages;
    notifyListeners();
  }

  Future<void> addMessage(Message message) async {
    _messages.add(message);
    notifyListeners();
  }

  // Stream<List<Message>> streamMessages() async* {
  //   _messages = await _getMessages();
  //   yield await _getMessages();
  // }
}
