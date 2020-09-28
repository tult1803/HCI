
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/home.dart';
import 'package:football_manager/url.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';

class WelcomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return WelcomePageState();
  }}

  Timer timer;
  int count = 0;
class WelcomePageState extends State{

  @override
  void initState() {
    _checkTime();
  }

  void _checkTime(){
    timer = Timer.periodic(Duration(seconds: 3), (time)  {
      if(count == 0){
        count = 1;
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(url_imgbackground_welcome),
        ),
      ),
      child: Center(
        child: Text('FBall Manager', style: GoogleFonts.alice(
            fontSize: 50,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            decoration: TextDecoration.none
        ),),
      ),
    );
  }

}