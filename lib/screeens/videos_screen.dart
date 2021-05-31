import 'package:whetstone/screeens/playback_screen.dart';
import 'package:whetstone/widgets/video_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

bool isSelected = false;

class VideosScreens extends StatefulWidget {
  static final id = '/video_screen';
  @override
  _VideosScreensState createState() => _VideosScreensState();
}

class _VideosScreensState extends State<VideosScreens> {
  String selectBtnText = "Select";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: CustomDropDownMenu(),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  isSelected = isSelected == false ? true : false;
                  selectBtnText =
                      selectBtnText == "Select" ? "Unselect" : "Select";
                });
              },
              child: Text(
                selectBtnText,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: ListView(
        children: [
          CustomVideoArea(),
          CustomVideoArea(),
          CustomVideoArea(),
          CustomVideoArea(),
        ],
      ),
    );
  }
}

class CustomVideoArea extends StatefulWidget {
  @override
  _CustomVideoAreaState createState() => _CustomVideoAreaState();
}

class _CustomVideoAreaState extends State<CustomVideoArea> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'May 1,2021',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
        Divider(),
        isSelected ? checkBoxShow(context) : notSelectedBox(context),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PlaybackScreen.id);
              },
              child: IconTextWidget(
                text: 'Play',
                iconData: Icons.play_arrow,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: IconTextWidget(
                text: 'Share',
                iconData: Icons.share,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: IconTextWidget(
                text: 'Tags',
                iconData: FontAwesomeIcons.tag,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: IconTextWidget(
                text: 'Fav',
                iconData: FontAwesomeIcons.star,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: IconTextWidget(
                text: 'Delete',
                iconData: Icons.delete,
              ),
            )
          ],
        )
      ],
    );
  }

  Container notSelectedBox(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.30,
      child: Stack(
        children: [
          Center(
            child: Text(
              'Video',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: Text(
              '8:30 pm',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget checkBoxShow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Checkbox(
                value: checkBoxValue,
                onChanged: (value) {
                  setState(() {
                    checkBoxValue = value;
                  });
                })),
        Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.30,
          child: Stack(
            children: [
              Center(
                child: Text(
                  'Video',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: Text(
                  '8:30 pm',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class IconTextWidget extends StatelessWidget {
  final text;
  final iconData;
  const IconTextWidget({Key key, this.text, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconData, color: Colors.black),
        Text(
          text,
          style: TextStyle(color: Colors.black),
        )
      ],
    );
  }
}
