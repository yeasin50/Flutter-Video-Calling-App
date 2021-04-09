const String keyUId = 'uid';
const String keyName = "name";
const String keyUrlAvatar = "urlAvater";
const String keyLastActiveTime = "lastTime";

class User {
  final String id;
  final String name;
  final String urlAvatar;
  final DateTime lastActiveTime;

  User({
    required this.id,
    required this.name,
    required this.urlAvatar,
    required this.lastActiveTime,
  });

  Map<String, dynamic> toMap() {
    return {
      keyUId: id,
      keyName: name,
      keyUrlAvatar: urlAvatar,
      keyLastActiveTime: lastActiveTime.toIso8601String(),
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json[keyUId],
      name: json[keyName],
      urlAvatar: json[keyUrlAvatar],
      lastActiveTime: DateTime.parse(json[keyLastActiveTime]),
    );
  }
}
