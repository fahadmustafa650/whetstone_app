import 'dart:async';
import 'package:flutter/material.dart';
import 'start_screen.dart';

class CustomSplashScreen extends StatefulWidget {
  static final id = '/custom_splash';
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _opacity = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _controller.forward();
    _controller.addListener(() {
      setState(() {
        _opacity = _controller.value;
      });
    });
    Timer(
        Duration(seconds: 4),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => StartScreen())));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lightBlueAccent.withOpacity(_opacity),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
                opacity: _opacity,
                child: Image(image: AssetImage('assets/images/logo_text.png'))),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
