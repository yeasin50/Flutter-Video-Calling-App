import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:web_rtc/components/utils.dart';

class CallProvider with ChangeNotifier {
  ///duration handler
  late Timer timer;
  int _sec = 0;

  String strDuration = "connecting..";

  void onStart() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _sec += 1;
      strDuration = Utils.duratuin2string(_sec);
      notifyListeners();
    });
  }

  void onCallEnd() {
    timer.cancel();
  }
}
