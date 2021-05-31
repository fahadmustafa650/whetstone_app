import 'package:whetstone/screeens/single_session_screen.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderScreen extends StatefulWidget {
  static final id = '/calender_screen';
  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              topTableCalender(),
              HeadingDataIcon(
                date: 'Today,Wed Mar 10',
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.check,
                    color: Colors.lightBlueAccent,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '9:40 am',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'John',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  Text(
                    '15 mins',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  Text(
                    '\$0',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: HeadingDataIcon(
                  date: 'Tomorrow,Thu Mar 11',
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'No Appointments',
                    style: TextStyle(color: Colors.grey),
                  )),
              HeadingDataIcon(
                date: 'Fri, Mar 12',
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'No Appointments',
                    style: TextStyle(color: Colors.grey),
                  )),
              HeadingDataIcon(
                date: 'Sat Mar 13',
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'No Appointments',
                    style: TextStyle(color: Colors.grey),
                  )),
              HeadingDataIcon(
                date: 'Sun,Mar 14',
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'No Appointments',
                    style: TextStyle(color: Colors.grey),
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, SingleSessionScreen.id);
          },
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  TableCalendar topTableCalender() {
    return TableCalendar(
      initialCalendarFormat: CalendarFormat.week,
      calendarStyle: CalendarStyle(
          todayColor: Colors.orange,
          selectedColor: Colors.yellow,
          todayStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black)),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonTextStyle: TextStyle(color: Colors.black),
        formatButtonShowsNext: false,
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      onDaySelected: (date, e, f) {
        print(date.toIso8601String());
      },
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, events) => Container(
            margin: const EdgeInsets.all(4.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(50.0)),
            child: Text(
              date.day.toString(),
              style: TextStyle(color: Colors.white),
            )),
        todayDayBuilder: (context, date, events) => CircleAvatar(
          backgroundColor: Colors.green,
          child: Text(
            date.day.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      calendarController: _controller,
    );
  }
}

class HeadingDataIcon extends StatelessWidget {
  final date;
  final color;
  const HeadingDataIcon({Key key, this.date, this.color = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent[600],
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: TextStyle(
                color: color, fontWeight: FontWeight.w600, fontSize: 17),
          ),
          IconButton(
              icon: Icon(
                Icons.add,
                size: 20,
              ),
              onPressed: null)
        ],
      ),
    );
  }
}
