import 'package:whetstone/screeens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'screeens/calender_screen.dart';
import 'screeens/coaches_main_screen.dart';
import 'screeens/group_session_screen.dart';
import 'screeens/import_video_screen.dart';
import 'screeens/code_verification_athlete_screen.dart';
import 'screeens/playback_screen.dart';
import 'screeens/sign_up_screen.dart';
import 'screeens/single_session_screen.dart';
import 'screeens/splash_screen.dart';
import 'screeens/start_screen.dart';
import 'screeens/videos_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: GroupSessionScreen.id,
        routes: {
          CustomSplashScreen.id: (context) => CustomSplashScreen(),
          CoachesMainScreen.id: (context) => CoachesMainScreen(),
          StartScreen.id: (context) => StartScreen(),
          SignInScreen.id: (context) => SignInScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          CodeVerificationAthlete.id: (context) => CodeVerificationAthlete(),
          ImportVideoScreen.id: (context) => ImportVideoScreen(),
          VideosScreens.id: (context) => VideosScreens(),
          CalenderScreen.id: (context) => CalenderScreen(),
          PlaybackScreen.id: (context) => PlaybackScreen(),
          SingleSessionScreen.id: (context) => SingleSessionScreen(),
          GroupSessionScreen.id: (context) => GroupSessionScreen(),
        });
  }
}
