import 'dart:math';
import 'package:web_rtc/model/message.dart';
import 'user_data.dart';

final Random random = Random();

get _userID {
  return dummyUsers[random.nextInt(dummyUsers.length)].id;
}

final List<String> _list = [
  "Hey, how are you?",
  "fine, how about you?",
  "same, here",
  "I think, i saw you today",
  "where?",
  "it was there , from here and there but near, btw not here but somewhere."
];

///`UI`
int min = 0;
Message msg(bool isMe, String msg) {
  return Message(
    senderUId: isMe ? "user1" : "user2",
    receiverUId: !isMe ? "user1" : "user2",
    text: msg,
    sentTime: DateTime(2021, 1, 1, 10, min += 1),
  );
}

List<Message> _dummyMessages = [
  msg(false, "Hey, how are you?"),
  msg(true, "fine, how about you?"),
  msg(false, "same, here"),
  msg(true, "I think, i saw you today"),
  msg(false, "where?"),
  msg(true,
      "it was there , from here and there but near, btw not here but somewhere."),
  msg(true, "just kidding."),
  msg(true, ":)"),
  msg(false, "bruhhhhhhhh"),
  msg(false, "always do"),
];
//TODO:: reverse the messages
List<Message> dummyMessages = new List.from(_dummyMessages.reversed);
