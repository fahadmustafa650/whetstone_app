import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({Key key}) : super(key: key);

  @override
  _CustomDropDownMenuState createState() => _CustomDropDownMenuState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String dropdownValue = 'All Videos';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward, color: Colors.white),
      iconSize: 24,
      elevation: 5,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.white,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: ['All Videos', 'Sort By Tag', 'Favourite', 'Sort By Athlete']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        );
      }).toList(),
    );
  }
}
