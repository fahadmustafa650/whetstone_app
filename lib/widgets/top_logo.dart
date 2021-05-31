import 'package:flutter/material.dart';

class TopLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 80,
      child: Center(
        child: FittedBox(
          child: Image(
            width: 120,
            height: 120,
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
