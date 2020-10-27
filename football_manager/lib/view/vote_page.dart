
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:football_manager/url/url.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home.dart';
// import 'package:url_launcher/url_launcher.dart';

class VotePage extends StatefulWidget {
  @override
  VotePageState createState() => VotePageState();
}

class VotePageState extends State<VotePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Đánh giá sân bóng',
              style: TextStyle(fontSize: 25),
            ),
            backgroundColor: main_color,
          ),
          backgroundColor: Colors.white10,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black12, width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Container(
                      width: size.width,
                      height: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sân Phúc Lộc',
                                  style: GoogleFonts.alice(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: RatingBar(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 5.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              // obscureText: true,
                              maxLines: 10,
                              // maxLengthEnforced: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                // isDense: true,
                                // filled: true,
                                hintText: 'Ý kiến của bạn',
                                // contentPadding: EdgeInsets.all(20),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Hủy', style: TextStyle(color: Colors.white),)),
                              ),
                              SizedBox(width: 40,),

                              Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: main_color,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: FlatButton(
                                    onPressed: () async{
                                      await _showVote();
                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                                    },
                                    child: Text('Gửi', style: TextStyle(color: Colors.white, fontSize: 15),)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void _showVote() async{
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          // title: new Text("Đánh giá sân" , style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 22),),
          content: Container(
            // height: 50,
            child: Text('Cảm ơn bạn đã đánh giá', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 20),),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Done",style: TextStyle(color: Colors.green),),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    ).then((val) {
//            *** Code Here ***
    });
  }
}
