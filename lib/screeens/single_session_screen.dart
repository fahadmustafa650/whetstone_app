import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SingleSessionScreen extends StatefulWidget {
  static final id = '/single_session';
  @override
  _SingleSessionScreenState createState() => _SingleSessionScreenState();
}

class _SingleSessionScreenState extends State<SingleSessionScreen> {
  bool switchTile = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Single Session',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: null,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Search Athlete',
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'or',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              SwitchListTile(
                tileColor: Colors.lightBlueAccent,
                activeColor: Colors.blue[900],
                activeTrackColor: Colors.blue,
                // shape: ShapeBorder,
                value: switchTile,
                title: Text(
                  'Open Session',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    switchTile = value;
                  });
                },
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: null,
                  //  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'Location',
                      contentPadding: EdgeInsets.only(left: 10),
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: null,
                  //  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Price',
                      contentPadding: EdgeInsets.only(left: 10),
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: TextFormField(
                  controller: null,
                  // textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10),
                      hintText: 'Duration',
                      alignLabelWithHint: true,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
