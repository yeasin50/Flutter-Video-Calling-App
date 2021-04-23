import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AnimTester extends StatefulWidget {
  @override
  _AnimTesterState createState() => _AnimTesterState();
}

class _AnimTesterState extends State<AnimTester>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;

  double _width = 150;

  late AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );
  late Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  _open() {
    if (!_isOpen) {
      setState(() => _isOpen = true);
      _controller.forward();
    } else {
      _controller.reverse();
      Timer(Duration(milliseconds: 400), () {
        _animation.addListener(() {
          SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
            print(
                "Anim: ${_animation.status} Controller: ${_controller.status}");
            if (_animation.isDismissed)
              setState(() {
                _isOpen = false;
              });
          });
        });
      });
    }

    print("isOpne:=> $_isOpen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.yellow.withOpacity(.3),
              child: IconButton(
                icon: Icon(
                  _isOpen ? Icons.close : Icons.add_photo_alternate_outlined,
                ),
                onPressed: _open,
              ),
            ),
            if (_isOpen)
              ScaleTransition(
                scale: _controller,
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            Container(
              height: 100,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }

  Row buildRowExpandButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            _isOpen ? Icons.close : Icons.add_photo_alternate_outlined,
          ),
          onPressed: _open,
        ),
        AnimatedContainer(
          width: _isOpen ? _width : 0,
          curve: Curves.bounceInOut,
          alignment: Alignment.centerLeft,
          duration: Duration(milliseconds: 400),
          child: FittedBox(
            child: ScaleTransition(
              scale: _controller,
              child: actionButton(),
            ),
          ),
        ),
        Expanded(
            child: Container(
          color: Colors.green,
        ))
      ],
    );
  }
}

///extra actions for images, camera, voice
Row actionButton() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
          tooltip: "open camera & share image",
          icon: Icon(
            Icons.camera_alt,
            color: Colors.blue,
          ),
          onPressed: () {}),
      IconButton(
          tooltip: "send image",
          icon: Icon(
            Icons.photo,
            color: Colors.blue,
          ),
          onPressed: () {}),
      IconButton(
          tooltip: "voice message",
          icon: Icon(
            Icons.mic,
            color: Colors.blue,
          ),
          onPressed: () {}),
    ],
  );
}
