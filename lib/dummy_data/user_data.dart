import 'dart:math';

import 'package:web_rtc/model/user.dart';

final Random random = Random();
get time {
  DateTime.utc(
    2021,
    1,
  );
}

List<User> dummyUsers = List.generate(
  20,
  (index) => User(
    id: "uId$index",
    name: "user$index",
    urlAvatar: "avatarURL",
    lastActiveTime: DateTime.now(),
  ),
);
