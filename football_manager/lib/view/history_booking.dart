import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/details_history.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryBookingPage extends StatefulWidget {
  @override
  HistoryBookingPageState createState() => HistoryBookingPageState();
}

class HistoryBookingPageState extends State<HistoryBookingPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(url_imgbackground_welcome))),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Lịch sử đặt sân'),
            backgroundColor: Colors.white10,
          ),
          backgroundColor: Colors.white10,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 10,),
                historyCard(
                    context,
                    'HCI',
                    '23-10-2020  14:00',
                    Colors.lightGreen,
                    Icon(
                      Icons.check,
                      color: Colors.lightGreenAccent,
                      size: 50,
                    ),
                    'Hoàn tất'),
                historyCard(
                    context,
                    'HCI',
                    '21-10-2020  10:30',
                    Colors.lightGreen,
                    Icon(
                      Icons.check,
                      color: Colors.lightGreenAccent,
                      size: 50,
                    ),
                    'Hoàn tất'),
                historyCard(
                    context,
                    'SWD',
                    '18-10-2020  18:00',
                    Colors.redAccent,
                    Icon(
                      Icons.clear,
                      color: Colors.redAccent,
                      size: 50,
                    ),
                    'Hủy'),
              ],
            ),
          ),
        ));
  }
}

Widget historyCard(BuildContext context, String name, String time, Color color,
    Icon icon, String status) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: 350,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(20),
        ),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsHistoryBookingPage()));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        'Sân bóng $name',
                        style: GoogleFonts.capriola(
                            fontSize: 20,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Ngày đặt: $time',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Row(
                        children: [
                          Text(
                            'Trạng thái: ',
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            '$status',
                            style: TextStyle(
                                color: color, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container(height: 100, child: icon)),
            ],
          ),
        ),
      ),
    ),
  );
}
