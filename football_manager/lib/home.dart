import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/booking.dart';
import 'package:football_manager/view/news.dart';
import 'package:football_manager/view/profile.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State{
  int _page = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();
  Widget _widget;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widget = NewsPage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 1,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.assignment, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.green,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
              print('$index');
              if(index == 0){
                _widget = BookingPage();
              }else if(index == 1){
                _widget = NewsPage();
              }else if(index == 2){
                _widget = ProfilePage();
              }
            });
          },
        ),
        body: _widget
    );
  }

}