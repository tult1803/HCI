import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/vote_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DeleteHistoryBookingPage extends StatefulWidget {
  @override
  DeleteHistoryBookingPageState createState() =>
      DeleteHistoryBookingPageState();
}

class DeleteHistoryBookingPageState extends State<DeleteHistoryBookingPage> {
  @override
  Widget build(BuildContext context) {
    String address = '442 Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, TP.HCM';
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        color: Colors.white,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Chi tiết đặt sân',
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
                                      'Sân Nam Lý',
                                      style: GoogleFonts.alice(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                )),
                          ),

                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                          // textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                              fontSize: 17, color: Colors.black54),
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only( left: 230.0, top: 32),
                                child: GestureDetector(
                                  onTap: () {
                                    MapUtils.openMap(
                                        10.8441733, 106.7890298);
                                  },
                                  child: new Text("Vị trí", style: TextStyle(
                                    decoration:TextDecoration.underline,
                                    color: Colors.blueAccent,
                                  )),
                                ),
                              ),
                            ],
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
                                  '14h00 - 16h00 (2h)',
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
                                  '160k',
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
                                  'Đã Hủy',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 22),
                            child: Row(
                              children: [
                                Text(
                                  'Lý do: ',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Thay đổi ý',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20,),
                          // Padding(
                          //   padding: const EdgeInsets.all(20.0),
                          //   child: Center(
                          //     child: Container(
                          //       height: 35,
                          //       width: 130,
                          //       decoration: BoxDecoration(
                          //         color: main_color,
                          //         borderRadius: BorderRadius.circular(20),
                          //       ),
                          //       child: FlatButton(
                          //           onPressed: () {
                          //             // MapUtils.openMap(
                          //             //     10.8441733, 106.7890298);
                          //
                          //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => VotePage()));
                          //           },
                          //           child: Text(
                          //             'Đánh giá',
                          //             style: TextStyle(
                          //                 fontSize: 18,
                          //                 fontWeight: FontWeight.w600,
                          //                 color: Colors.white),
                          //           )),
                          //     ),
                          //   ),
                          // ),
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
