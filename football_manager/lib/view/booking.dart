

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  String tapped ='';

  CalendarController _controller;
  Map<DateTime, List> _events;
  List _selectedEvents;
  String day = '';
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    final _selectedDay = DateTime.now();
    _events = {
      _selectedDay.subtract(Duration(days: 0)): ['Sân bóng SWD', 'Sân bóng HCI', 'Sân bóng PRM'],
      _selectedDay.subtract(Duration(days: -1)): ['Sân bóng ACC', 'Sân bóng ISC'],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                startingDayOfWeek: StartingDayOfWeek.monday,
                initialCalendarFormat: CalendarFormat.week,
                calendarController: _controller,
                events: _events,
                onDaySelected: _onDaySelected,
                calendarStyle: CalendarStyle(
                  todayColor: Colors.lightGreen,
                  selectedColor: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Expanded(child: _buildEventList()),

            Text('$tapped', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),

          ],
        ),
      ),
    );
  }

  void _onDaySelected(DateTime days, List events) {
    setState(() {
      _selectedEvents = events; // cap nhat va show danh sách
      day = '${days.day}-${days.weekday}-${days.year}';
      print('onDaySelected: $day');
    });
    print('Day: $day');
  }
  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(width: 0.8),
          borderRadius: BorderRadius.circular(12.0),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          trailing: Text('Chi tiết', style: TextStyle(color: Colors.blue, fontSize: 15),),
          title: Text(event.toString(), style: GoogleFonts.yrsa(fontSize: 26, fontWeight: FontWeight.w500),),
          subtitle: Text('Mở cửa: 8h - 22h', style: TextStyle(fontSize: 16,),),
          onTap: () {
            print('$event tapped!');

//            Demo nhan tapped
            setState(() {
              tapped = event;
            });
          }
        ),
      ))
          .toList(),
    );
  }
}
