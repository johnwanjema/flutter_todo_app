import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'avenir'),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  String filterType = 'today';
  CalendarController Cntrl = new CalendarController();
  DateTime today = new DateTime.now();
  var months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            AppBar(
              elevation: 0,
              title: Text(
                'Work List',
                style: TextStyle(fontSize: 30),
              ),
              backgroundColor: Color(0xfff96060),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.short_text,
                    size: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Container(
              height: 70,
              color: Color(0xfff96060),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            filterType = 'today';
                          });
                        },
                        child: Text(
                          'Today',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 4,
                        width: 120,
                        color: filterType == 'today'
                            ? Colors.white
                            : Colors.transparent,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          setState(() {
                            filterType = 'monthly';
                          });
                        },
                        child: Text(
                          'Monthly',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 4,
                        width: 120,
                        color: filterType == 'monthly'
                            ? Colors.white
                            : Colors.transparent,
                      )
                    ],
                  )
                ],
              ),
            ),
            (filterType == 'monthly')
                ? TableCalendar(
                    calendarController: Cntrl,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    initialCalendarFormat: CalendarFormat.week,
                  )
                : Container(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Today ${months[today.month - 1]} , ${today.day}/${today.year}',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          taskWidget(
                              Colors.red, 'Meeting with dev', '09:00'),
                          taskWidget(
                              Colors.blue,'class at D1', '10:00'),
                          taskWidget(
                              Colors.blue,  'Take medicine', '14:00'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Slidable taskWidget(
      Color color,  String title, String time) {
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: .3,
        child: Container(
          height: 80,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.03),
                offset: Offset(0, 9),
                blurRadius: 20,
                spreadRadius: 1)
          ]),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 4),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Text(time, style: TextStyle(color: Colors.grey, fontSize: 18))
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Container(height: 50, width: 5, color: color)
            ],
          ),
        ));
  }
}
