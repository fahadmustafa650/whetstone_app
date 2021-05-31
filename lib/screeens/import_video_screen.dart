import 'package:flutter/material.dart';
import 'calender_screen.dart';

class ImportVideoScreen extends StatefulWidget {
  static final id = '/import_video_screen';
  @override
  _ImportVideoScreenState createState() => _ImportVideoScreenState();
}

class _ImportVideoScreenState extends State<ImportVideoScreen> {
  bool checkShareValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        //  leading: Text('Dsdgsdgsdg'),
        title: Text(
          'Import Video',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addCommentBtn(),
            addAtheleteTextField(),
            shareToPublicRadioBtn(),
            addTagTextField(),
            saveVideoBtn(context)
          ],
        ),
      ),
    );
  }

  Container addCommentBtn() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextFormField(
        controller: null,
        minLines: 3,
        maxLines: 10,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          labelText: 'Tap to add comment',
        ),
      ),
    );
  }

  GestureDetector saveVideoBtn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CalenderScreen.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 40),
        width: 140,
        height: 35,
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: FittedBox(
            child: Text(
              'Save Video',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Container addTagTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: null,
        minLines: 4,
        maxLines: 10,
        decoration: InputDecoration(
          hintMaxLines: 3,
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          labelText: 'Add Tag',
        ),
      ),
    );
  }

  Container shareToPublicRadioBtn() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Radio(
              value: true,
              groupValue: checkShareValue,
              onChanged: (value) {
                setState(() {
                  checkShareValue = value == false ? true : false;
                });
              }),
          Text(
            'Share to Public',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Container addAtheleteTextField() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        controller: null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          labelText: 'Tap to add Athlete',
        ),
      ),
    );
  }
}
