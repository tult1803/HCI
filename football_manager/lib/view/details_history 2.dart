import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';


class DetailsHistoryBookingPage extends StatefulWidget {
  @override
  DetailsHistoryBookingPageState createState() => DetailsHistoryBookingPageState();
}

class DetailsHistoryBookingPageState extends State<DetailsHistoryBookingPage> {


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
            title: Text('Chi tiết đặt sân'),
            backgroundColor: Colors.white10,
          ),
          backgroundColor: Colors.white10,
          body:  SingleChildScrollView(

          ),
        ));}}

