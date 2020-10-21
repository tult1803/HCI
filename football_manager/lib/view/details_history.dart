import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsHistoryBookingPage extends StatefulWidget {
  @override
  DetailsHistoryBookingPageState createState() =>
      DetailsHistoryBookingPageState();
}

class DetailsHistoryBookingPageState extends State<DetailsHistoryBookingPage> {
  @override
  Widget build(BuildContext context) {
    String address = '442 Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, TP.HCM';
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(url_imgbackground_welcome))),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Chi tiết đặt sân'),
            backgroundColor: Colors.white10,
          ),
          backgroundColor: Colors.white10,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Card(
                    color: Colors.white70,
                    child: Container(
                      width: size.width,
                      // height: 400,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Row(
                          //   children: [
                          //     Icon(Icons.)
                          //   ],
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Sân bóng HCI',
                                  style: GoogleFonts.alice(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Địa chỉ: ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: Container(
                                    // margin: EdgeInsets.only(right: 5),
                                    // width: size.width * 0.67,
                                    child: Text(
                                      '$address',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black54),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Loại sân: ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Sân 7',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Ngày đặt: ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '23-10-2020',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Giờ đặt: ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '14h00 - 15h00',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Phương thức thanh toán: ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Tiền mặt',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Tổng tiền: ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '80k',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20),
                            child: Row(
                              children: [
                                Text(
                                  'Trạng thái: ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Hoàn tất',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: FlatButton(
                                    onPressed: () {
                                      MapUtils.openMap(10.8441733, 106.7890298);
                                    },
                                    child: Text(
                                      'Vị trí',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
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
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/place/442+L%C3%AA+V%C4%83n+Vi%E1%BB%87t,+T%C4%83ng+Nh%C6%A1n+Ph%C3%BA+A,+Qu%E1%BA%ADn+9,+Th%C3%A0nh+ph%E1%BB%91+H%E1%BB%93+Ch%C3%AD+Minh,+Vietnam';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}