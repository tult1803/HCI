import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/DangXuLy.dart';
import 'package:football_manager/view/Huy.dart';
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
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //         fit: BoxFit.fill,
        //         image: AssetImage(url_imgbackground_welcome))),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Lịch sử đặt sân',
              style: TextStyle(fontSize: 25),
            ),
            backgroundColor: Color.fromARGB(255, 2, 177, 79),
          ),
          // backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 10,),
                historyCard(
                    context,
                    'Hiệp Phú',
                    '30-10-2020  17:30',
                    Colors.orangeAccent,
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.orangeAccent,
                      size: 50,
                    ),
                    'Chờ nhận sân', WaitHistoryBookingPage()),

                historyCard(
                    context,
                    'Phúc Lộc',
                    '23-10-2020  14:00',
                    Color.fromARGB(255, 2, 177, 79),
                    Icon(
                      Icons.check,
                      color: Color.fromARGB(255, 2, 177, 79),
                      size: 50,
                    ),
                    'Hoàn tất', DetailsHistoryBookingPage()),
                historyCard(
                    context,
                    'Phúc Lộc',
                    '21-10-2020  10:30',
                    Color.fromARGB(255, 2, 177, 79),
                    Icon(
                      Icons.check,
                      color: Color.fromARGB(255, 2, 177, 79),
                      size: 50,
                    ),
                    'Hoàn tất', DetailsHistoryBookingPage()),
                historyCard(
                    context,
                    'Nam Lý',
                    '18-10-2020  18:00',
                    Colors.redAccent,
                    Icon(
                      Icons.clear,
                      color: Colors.redAccent,
                      size: 50,
                    ),
                    'Hủy', DeleteHistoryBookingPage()),
              ],
            ),
          ),
        ));
  }
}

Widget historyCard(BuildContext context, String name, String time, Color color, Icon icon, String status, Widget widget) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        width: 350,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12, width: 0.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => widget));
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
                        'Sân $name',
                        style: GoogleFonts.capriola(
                            fontSize: 22,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
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
