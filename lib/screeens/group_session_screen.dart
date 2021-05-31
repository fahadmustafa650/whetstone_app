import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GroupSessionScreen extends StatefulWidget {
  static final id = '/group_session';
  @override
  _GroupSessionScreenState createState() => _GroupSessionScreenState();
}

class _GroupSessionScreenState extends State<GroupSessionScreen> {
  bool switchTile = false;
  String dropdownValue = "1";
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
          'Group Session',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                leading: Text('Slots',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                trailing: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.arrow_downward,
                    size: 20,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  underline: Container(
                    height: 1,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
