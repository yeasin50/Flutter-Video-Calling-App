import 'package:flutter/material.dart';

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
    if (_isOpen)
      _controller.reverse();
    else
      _controller.forward();
    setState(() {
      _isOpen = !_isOpen;
    });
    print("isOpne:=> $_isOpen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.yellow.withOpacity(.3),
          child: Row(
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
          ),
        ),
      ),
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
