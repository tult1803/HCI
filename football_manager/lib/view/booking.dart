import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  CalendarController _controller;
  String day = '';
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(url_imgbackground_welcome))
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white70,
              child: TableCalendar(
                initialCalendarFormat: CalendarFormat.week,
                calendarController: _controller,
                onDaySelected: (days, events) {
                  setState(() {
                    day = '${days.day}-${days.weekday}-${days.year}';
                  });
                  print('Day: $day');
                },
                calendarStyle: CalendarStyle(
                  todayColor: Colors.lightGreen,
                  selectedColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Text('$day', style: TextStyle(color: Colors.black, fontSize: 30),),

          ],
        ),
      ),
    );
  }
}
