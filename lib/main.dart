import 'package:flutter/material.dart';
import 'package:web_rtc/screens/auth/auth_screen.dart';
import 'package:web_rtc/screens/onCall/on_call_running.dart';

main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Permission.camera.request();
  // await Permission.microphone.request();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.transparent,
      ),
      home: OnCallRunningScreen(),
    );
  }
}
