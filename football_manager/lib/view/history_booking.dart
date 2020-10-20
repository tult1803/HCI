
import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';


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
              image: AssetImage(url_imgbackground_welcome))
      ),
      child: Scaffold(
      appBar: AppBar(
    title: Text('Lịch sử đặt sân'),
    backgroundColor: Colors.white10,
    ),
    backgroundColor: Colors.white10,
    ));}}