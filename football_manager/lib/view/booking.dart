
import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/details_booking.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingPage extends StatefulWidget {
  @override
  BookingPageState createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  static String tapped ='';
  CalendarController _controller;
  Map<DateTime, List> _events;
  List _selectedEvents;
  static String day = '';
  @override
  void initState() {
    super.initState();
    DateTime dateTime = DateTime.now();
    day = '${dateTime.day}-${dateTime.month}-${dateTime.year}';
    _controller = CalendarController();
    final _selectedDay = DateTime.now();
    _events = {
      _selectedDay.subtract(Duration(days: 0)):  ['Sân Nam Lý   4.5', 'Sân Phúc Lộc   4.0', 'Sân Tiến Phát   3.5'],
      _selectedDay.subtract(Duration(days: -1)): ['Sân Hiệp Phú   3.0', 'Sân Kaly   4.0'],
      _selectedDay.subtract(Duration(days: -2)): ['Sân Nam Lý   4.5', 'Sân Kaly   4.0', 'Sân Phúc Lộc   4.0'],
      _selectedDay.subtract(Duration(days: -3)): ['Sân Hiệp Phú   3.0', 'Sân Tiến Phát   3.5', 'Sân Phúc Lộc   4.0', 'Sân Kaly   4.0'],
      _selectedDay.subtract(Duration(days: -4)): ['Sân Phúc Lộc   4.0', 'Sân Tiến Phát   3.5', 'Sân Hiệp Phú   3.0', 'Sân Nam Lý   4.5', 'Sân Kaly   4.0'],
      _selectedDay.subtract(Duration(days: -5)): ['Sân Nam Lý   4.5', 'Sân Phúc Lộc   4.0', 'Sân Tiến Phát   3.5', 'Sân Hiệp Phú   3.0', 'Sân Kaly   4.0'],
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
    var size = MediaQuery.of(context).size;
    return  Container(
      height: size.height,
        color: Colors.white,
        child: Scaffold(
        appBar: AppBar(
    title: Text('Lịch đặt sân'),
    backgroundColor: main_color,
    ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Colors.white70,
                child: TableCalendar(
                  availableCalendarFormats: const {
                    CalendarFormat.month: '',
                    CalendarFormat.week: '',
                  },
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonVisible: false,

                  ),
                  startDay: DateTime.now(),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  initialCalendarFormat: CalendarFormat.week,
                  calendarController: _controller,
                  events: _events,
                  onDaySelected: _onDaySelected,
                  calendarStyle: CalendarStyle(
                    markersColor: Colors.white10,
                    outsideDaysVisible: false,
                    todayColor: Colors.lightGreen,
                    selectedColor: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Expanded(child: _buildEventList()),
            ],
          ),
        ),
    ));
  }

  void _onDaySelected(DateTime days, List events) {
    setState(() {
      _selectedEvents = events; // cap nhat va show danh sách
      day = '${days.day}-${days.month}-${days.year}';
      print('onDaySelected: $day');
    });
  }
  Widget _buildEventList(){
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.1),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ]
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ListTile(
          trailing: Text('Chi tiết', style: TextStyle(color: Colors.blue, fontSize: 15),),
          title: Row(
            children: [
              Text(event.toString(), style: GoogleFonts.yrsa(fontSize: 27, fontWeight: FontWeight.w500),),
              Icon(Icons.star ,color: Colors.amber,),
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mở cửa: 8h - 22h', style: TextStyle(fontSize: 16,),),
              Container(
                // margin: EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.watch_later_outlined, size: 15,),
                    Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
                    // Icon(Icons.),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            print('$event tapped!');
//            Demo nhan tapped
            setState(() {
              DetailsBookingState.downPrice = '0';
              tapped = event;
            });

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsBooking()));
          }
        ),
      ))
          .toList(),
    );
  }
}
