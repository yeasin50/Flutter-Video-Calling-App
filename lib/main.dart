import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/dummy_data.dart';
import 'screens/chat_screen/chatting_screen.dart';

main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // await Permission.camera.request();
  // await Permission.microphone.request();

  runApp(MyApp());
}

///TODO:: status bar color, backgound
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // StreamProvider<List<Message>>.value(
        //   value: MessageProvider().streamMessages(),
        //   initialData: [],
        // ),
        ChangeNotifierProvider(
          create: (_) => MessageProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.transparent,
        ),
        home: ChattingScreen(),
      ),
    );
  }
}
