import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/url.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State{
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  Widget _widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
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
                _widget = add();
              }else if(index == 1){
                _widget = ABCadd();
              }
            });
          },
        ),
        body: _widget
    );
  }

  Widget add(){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
            image: AssetImage(url_imgbackground_welcome))
      ),
      child: Column(
        children: [
          SizedBox(height: 100,),
          tintuc(),
          tintuc(),tintuc(),tintuc()
        ],
      ),
    );
  }
  Widget ABCadd(){
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(url_imgbackground_welcome))
      ),
    );
  }
  Widget tintuc(){
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          height: 100,
          decoration: BoxDecoration(
//                color: Colors.redAccent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                width: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.new_releases),
                    Padding(
                      padding:  EdgeInsets.only(top:8.0),
                      child: Text("20%", style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.w700,
                      ),),
                    )
                  ],
                ),
              ),
              Expanded(child: Container(
//                    color: Colors.redAccent,
//                  padding: EdgeInsets.only(left: 20),
                child: ListTile(
                  title: Text("Sân bóng ABC",style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),),
                  subtitle: Text('12h - 3h',style: TextStyle(
                    fontSize: 20,
                  ),),
                ),
              ))
            ],)
      ),
    );
  }
}