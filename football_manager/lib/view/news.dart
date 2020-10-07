import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(url_imgbackground_welcome))
      ),
      child: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 10,),
            tintuc('8h - 13h','SWD', 20),
            tintuc('10h - 13h','HCI', 25),
            tintuc('16h - 22h','ACC', 50),
            tintuc('15h - 19h','ISC', 30),
            tintuc('20h - 22h','PRM', 90),
            tintuc('9h - 12h','ISC', 10),
          ],
        ),
      ),
    );
  }

  Widget tintuc(String time, String soccer_field, int sale){
    return Card(
      margin: EdgeInsets.only(left: 10, right: 10,top: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          height: 100,
          decoration: BoxDecoration(
                color: Colors.white70,
          border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(20),
          ),
          child:  FlatButton(
            onPressed: () {

            },
            child: Row(
              children: [
                Container(
                  width: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_money, size: 50, color: Colors.red,),
//                    Padding(
//                      padding:  EdgeInsets.only(top:8.0),
//                      child: Text("$sale%", style: TextStyle(
//                        fontSize: 20,
//                        color: Colors.red,
//                        fontWeight: FontWeight.w700,
//                      ),),
//                    )
                    ],
                  ),
                ),
                Expanded(child: Container(
//                    color: Colors.redAccent,
//                  padding: EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: Text("Sân bóng ${soccer_field}",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),),
                    subtitle: Text(time,style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),
                )),
                Container(
                  width: 80,
                  child: Text('$sale%', style: GoogleFonts.zeyada(fontSize: 40, color: Colors.red, fontWeight: FontWeight.w600),),
                )
              ],),
          )
      ),
    );
  }
}
