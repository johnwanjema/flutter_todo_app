import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
                          )
                        ],
                        // taskWidget(
                        //   color:Colors.red,
                        //   'meeting','9:00 Am'
                        // ),
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
}
