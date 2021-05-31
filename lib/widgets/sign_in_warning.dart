import 'package:flutter/material.dart';

class SignInWarning extends StatelessWidget {
  const SignInWarning({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.white,
          height: 2,
          width: MediaQuery.of(context).size.width * 0.35,
        ),
        Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.28,
            child: Text('Or Sign In With',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold))),
        Container(
          color: Colors.white,
          height: 2,
          width: MediaQuery.of(context).size.width * 0.37,
        ),
        //Divider(indent: 0, endIndent: 20, color: Colors.white),
      ],
    );
  }
}
