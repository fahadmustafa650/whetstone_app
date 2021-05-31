import 'package:whetstone/screeens/calender_screen.dart';
import 'package:whetstone/screeens/import_video_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:whetstone/screeens/videos_screen.dart';
import 'code_verification_athlete_screen.dart';

class CoachesMainScreen extends StatefulWidget {
  static final id = '/coaches_main_screen';

  @override
  _CoachesMainScreenState createState() => _CoachesMainScreenState();
}

class _CoachesMainScreenState extends State<CoachesMainScreen> {
  // File _storedImage;
  var selectedUser;
  Future<void> _showToast({String msg}) async {
    await Fluttertoast.cancel();
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.7),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  final List<String> _groups = [
    'Group 1',
    'Group 2',
    'Group 3',
  ];
  final List<IconData> ballsList = [
    FontAwesomeIcons.footballBall,
    FontAwesomeIcons.futbol,
    FontAwesomeIcons.basketballBall,
    FontAwesomeIcons.baseballBall,
    FontAwesomeIcons.tableTennis,
    FontAwesomeIcons.dumbbell
  ];

  int ballIndex = 0;

  void controlBallIndex() {
    setState(() {
      if (ballIndex >= ballsList.length - 1) {
        ballIndex = 0;
      } else if (ballIndex >= 0 && ballIndex < ballsList.length) ballIndex++;
    });
  }

  void showBallNameToast(int index) {
    switch (index) {
      case 0:
        _showToast(msg: 'American Football Activated');
        break;
      case 1:
        _showToast(msg: 'Football Activated');
        break;
      case 2:
        _showToast(msg: 'BasketBall Activated');
        break;
      case 3:
        _showToast(msg: 'BaseBall Activated');
        break;
      case 4:
        _showToast(msg: 'Tenis Ball Activated');
        break;
      case 5:
        _showToast(msg: 'Dumnbell Activated');
        break;
    }
  }

  Future<void> _takePicture() async {
    await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar(context),
        body: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            CustomVideo(),
            CustomLikeCmntDownload(),
            CustomVideo(),
            CustomLikeCmntDownload(),
            CustomVideo(),
            CustomLikeCmntDownload(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: recBtn(),
        bottomNavigationBar: bottomAppBar(context),
      ),
    );
  }

  BottomAppBar bottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.lightBlueAccent,
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ImportVideoScreen.id);
                  },
                  child: Icon(
                    FontAwesomeIcons.fileImport,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    controlBallIndex();
                    showBallNameToast(ballIndex);
                  },
                  child: Icon(
                    ballsList[ballIndex],
                    color: ballsList[ballIndex] == FontAwesomeIcons.futbol
                        ? Colors.black
                        : Colors.white,
                    size: 35,
                  ),
                )
              ],
            ),
            // Right Tab bar icons
            Row(
              children: <Widget>[saveVideoBtn(context), calenderBtn(context)],
            )
          ],
        ),
      ),
    );
  }

  FloatingActionButton recBtn() {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      child: Text(
        'Rec',
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
      onPressed: () {
        _takePicture();
      },
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.lightBlueAccent,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, CodeVerificationAthlete.id);
        },
        icon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 25,
            ),
            onPressed: null),
        Container(
          margin: EdgeInsets.only(top: 4),
          child: DropdownButton<String>(
            hint: Text(
              "Groups",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            value: selectedUser,
            style: TextStyle(color: Colors.black),
            onChanged: (value) {
              setState(() {
                selectedUser = value;
              });
            },
            items: _groups.map((coach) {
              return DropdownMenuItem<String>(
                value: coach,
                child: Row(
                  children: <Widget>[
                    Text(
                      coach,
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  MaterialButton saveVideoBtn(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, VideosScreens.id);
      },
      child: Icon(
        FontAwesomeIcons.solidSave,
        color: Colors.white,
        size: 35,
      ),
    );
  }

  MaterialButton calenderBtn(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, CalenderScreen.id);
      },
      child: Icon(
        FontAwesomeIcons.calendarAlt,
        color: Colors.white,
        size: 35,
      ),
    );
  }
}

class CustomLikeCmntDownload extends StatelessWidget {
  const CustomLikeCmntDownload({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              likeBtn(),
              commentBtn(),
            ],
          ),
        ),
        downloadBtn(),
      ],
    );
  }

  IconButton downloadBtn() =>
      IconButton(icon: Icon(FontAwesomeIcons.download), onPressed: null);

  IconButton commentBtn() =>
      IconButton(icon: Icon(FontAwesomeIcons.comment), onPressed: null);

  IconButton likeBtn() {
    return IconButton(icon: Icon(FontAwesomeIcons.thumbsUp), onPressed: null);
  }
}

class CustomVideo extends StatelessWidget {
  const CustomVideo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            'Coach Name',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Container(
              width: 300,
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text('Video Thumbnail',
                    style: TextStyle(color: Colors.white, fontSize: 30)),
              )),
        ),
      ],
    );
  }
}
