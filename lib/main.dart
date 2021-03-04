import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:permission_handler/permission_handler.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _localRenderer = new RTCVideoRenderer();
  MediaStream _localStream;
  bool _inCalling = false;

  final Map<String, dynamic> mediaConstraints = {
    'audio': true,
    'video': {
      /// `Provide your own width, height and frame rate here`
      /// if it's larger than your screen , it wount showUP
      'mandatory': {
        'minWidth': '200',
        'minHeight': '200',
        'minFrameRate': '30',
      },
      'facingMode': 'user',
      'optional': [],
    },
  };

  @override
  void initState() {
    super.initState();
    initRenderers();
    _getUserMedia();
  }

  @override
  void dispose() {
    _localStream.dispose();
    _localRenderer.dispose();
    super.dispose();
  }

  initRenderers() async {
    await _localRenderer.initialize();
  }

  _getUserMedia() async {
    try {
      var stream = await navigator.getUserMedia(mediaConstraints);
      _localStream = stream;
      _localRenderer.srcObject = _localStream;
    } catch (e) {
      print(e.toString());
    }
    if (!mounted) return;

    setState(() {
      _inCalling = true;
    });
  }

  bool isFrontCamera = true;

  void switchCamera() async {
    if (_localStream != null) {
      bool value = await _localStream.getVideoTracks()[0].switchCamera();
      while (value == this.isFrontCamera)
        value = await _localStream.getVideoTracks()[0].switchCamera();
      this.isFrontCamera = value;
    }
  }

  getUserMedia() async {
    var devices = await navigator.mediaDevices.getUserMedia(mediaConstraints);
    log("logs" + devices.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WebRTC"),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: RTCVideoView(_localRenderer, mirror: true),
                // child: Text("hey"),
              ),
              RaisedButton(
                onPressed: getUserMedia,
                child: Text("get r"),
              ),
              RaisedButton(
                onPressed: switchCamera,
                child: Text("Switch Cam"),
              )
            ],
          ),
        ));
  }
}
