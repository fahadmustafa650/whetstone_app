import 'package:whetstone/screeens/sign_in_screen.dart';
import 'package:whetstone/widgets/top_logo.dart';
import 'package:flutter/material.dart';

import 'sign_up_screen.dart';

class StartScreen extends StatefulWidget {
  static final id = '/start_screen';
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TopLogo(),
              Column(
                children: [
                  Text(
                    'SIGN UP AS',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //BOTH CIRCULAR SHAPES COACH AND ATHLETE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [CoachCircleBtn(), AthleteCircleBtn()],
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        loginBtn(),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, SignUpScreen.id);
      },
      child: Text(
        'Login',
        style: TextStyle(
            color: Colors.blue[900], fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class AthleteCircleBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
            );
          },
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/athelete.webp'),
          ),
        ),
        Text(
          'Athlete',
          style: TextStyle(
              color: Colors.blue[900],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class CoachCircleBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/coach.png'),
          ),
        ),
        Text(
          'Coach',
          style: TextStyle(
              color: Colors.blue[900],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
