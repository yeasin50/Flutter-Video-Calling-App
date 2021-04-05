import 'package:flutter/material.dart';
import 'package:web_rtc/components/round_icon.dart';

class RunningCallBody extends StatefulWidget {
  const RunningCallBody({
    Key key,
  }) : super(key: key);

  @override
  _RunningCallBodyState createState() => _RunningCallBodyState();
}

class _RunningCallBodyState extends State<RunningCallBody> {
  double iconSize = 30;
  bool _micOn = true;
  bool _camOn = true;

  bool _hideCaller = false;

  _handleMic() {
    setState(() {
      _micOn = !_micOn;
    });
  }

  _handleCam() {
    setState(() {
      _camOn = !_camOn;
    });
  }

  _hangUP() {}

  double _callerViewHeight = 100;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      _callerViewHeight = constraints.maxWidth * .3;
      return Stack(
        children: [
          ///`receiver`
          Container(
            color: Colors.green.withOpacity(.4),

          ),

          ///`Caller/myPreview`
          callerPreview(),

          ///`action buttons`
          callActions(),
        ],
      );
    });
  }

  Align callerPreview() {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            padding: EdgeInsets.all(1),
            onPressed: () {
              setState(() {
                _hideCaller = !_hideCaller;
              });
            },
            icon: Icon(
              _hideCaller ? Icons.navigate_before : Icons.navigate_next,
              color: Colors.white,
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 400),
            color: Colors.yellow,
            width: _hideCaller ? 0.0 : _callerViewHeight,
            height: _hideCaller ? 0.0 : _callerViewHeight * 1.4,
            child: Text("Container here"),
          ),
        ],
      ),
    );
  }

  Widget callActions() {
    return Align(
      alignment: Alignment(0, .9),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Tooltip(
            message: 'Microphone On/Off',
            child: RoundIcon(
              background: Colors.black.withOpacity(.4),
              child: Icon(
                _micOn ? Icons.mic_off : Icons.mic_rounded,
                color: Colors.white,
                size: iconSize,
              ),
              press: _handleMic,
              // label: "Mute",
            ),
          ),
          Tooltip(
            message: "Hang UP",
            child: RoundIcon(
              background: Colors.red,
              child: Icon(
                Icons.call_end_sharp,
                color: Colors.white,
                size: iconSize,
              ),
              press: _hangUP,
              // label: "Call End",
            ),
          ),
          Tooltip(
            message: "Turn off/on your camera",
            child: RoundIcon(
              background: Colors.black.withOpacity(.4),
              child: Icon(
                _camOn ? Icons.videocam_off : Icons.videocam,
                color: Colors.white,
                size: iconSize,
              ),
              press: _handleCam,
              // label: "Camera",
            ),
          ),
        ],
      ),
    );
  }
}
