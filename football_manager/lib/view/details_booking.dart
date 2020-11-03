import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/booking.dart';
import 'package:football_manager/view/final_details_booking.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'details_history.dart';

class DetailsBooking extends StatefulWidget {
  @override
  DetailsBookingState createState() => DetailsBookingState();
}

class DetailsBookingState extends State<DetailsBooking> {
  Color _colorPicked, _colorPicked1;
  int checkClickDiscount, price;
  // DateTime _endTime;
  DateTime pickedDate;
  SingingCharacter character = SingingCharacter.money;
  String btnDiscount, pttt, eror;
  Widget _widget, _widgetDetails;
  String tapped = null, dropdownValue = 'Sân 5';
  String email, displayName, demo, days;
  String address, startTime = '', endTime='-----';
  String phone, discount = '-----', discountCheck;
  String timeOpen, priceDiscount;
  String admin, totalTimeHours, totalTime, totalTimeMinute;
  static String downPrice = '0';
  String note =
      'Bạn chỉ được đặt sân ngoài khung giờ trên. Thân chào, quyết thắng và thân ái !!!';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    demo = '${DateTime.now()}';
    pickedDate = DateTime.now();
    checkClickDiscount = 0;
    startTime = ' ${demo.substring(11, 16).trim()}';
    _colorPicked = main_color;
    _colorPicked1 = Colors.black54;
    checkClickDiscount = 0;
    btnDiscount = 'Nhập mã';
    DateTime dateTime = DateTime.now();
    days = '${dateTime.day}-${dateTime.month}-${dateTime.year}';

    _picked();
    _getProfile();
    _getTapped();
    _checkTapped();
  }

  void _getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      displayName = prefs.getString('displayName');
    });
  }

  void _getTapped() {
    setState(() {
      tapped = BookingPageState.tapped;
      if (tapped == '') {
        tapped = 'Sân Phúc Lộc   4.0';
      }
      if (BookingPageState.day == '') {
        DateTime dateTime = DateTime.now();
        days = '${dateTime.day}-${dateTime.month}-${dateTime.year}';
      } else {
        days = BookingPageState.day;
      }
    });
  }


  void _checkTapped() {
    if (tapped == 'Sân Nam Lý   4.5') {
      setState(() {
        address = '67 Đường số 447, Tăng Nhơn Phú A, Quận 9, TP.HCM';
        phone = '0956721329';
        timeOpen = '8h - 22h';
        admin = 'A.Tú';
        price = 130;
        // _widget = columnSWD();
      });
    } else if (tapped == 'Sân Phúc Lộc   4.0') {
      setState(() {
        address = '442 Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, TP.HCM';
        phone = '0906534119';
        timeOpen = '8h - 22h';
        admin = 'A.Tuấn';
        price = 100;
        // _widget = columHCI();
      });
    } else if (tapped == 'Sân Tiến Phát   3.5') {
      setState(() {
        address = '6 Đường số 51, Hiệp Bình Chánh, Thủ Đức, TP.HCM';
        phone = '0978999999';
        timeOpen = '8h - 22h';
        admin = 'A.Đạt';
        price = 110;
        // _widget = columPRM();
      });
    } else if (tapped == 'Sân Hiệp Phú  3.0') {
      setState(() {
        address = '225 Nam Hòa, Phước Long A, Quận 9, TP.HCM';
        phone = '0907777777';
        timeOpen = '8h - 22h';
        admin = 'A.Dũng';
        price = 120;
        // _widget = columACC();
      });
    } else if (tapped == 'Sân Kaly   4.0') {
      setState(() {
        address = '9 Hém 445, Phước Long B, Quận 9, TP.HCM';
        phone = '0901234567';
        timeOpen = '8h - 22h';
        admin = 'A.Nguyên';
        price = 100;
        // _widget = columISC();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chi tiết sân', style: TextStyle(fontSize: 25)),
          backgroundColor: main_color,
        ),
        backgroundColor: Colors.white10,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10),
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
                        // height: 230,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${tapped}',
                                    style: GoogleFonts.alice(
                                        fontSize: 28,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ],
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Liên hệ: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '$phone ($admin)',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 18),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Địa chỉ: ',
                                    style: TextStyle(
                                        fontSize: 20,
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
                                            fontSize: 20,
                                            color: Colors.black54),
                                        overflow: TextOverflow.fade,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'Mở cửa: ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    '$timeOpen',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Container(
                                height: 40,
                                // color: Colors.lightGreen,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _colorPicked = main_color;
                                          _colorPicked1 = Colors.black54;
                                          _widgetDetails = FinalDetailsBooking();
                                        });
                                      },
                                      child: new Text("Đặt sân",
                                          style: TextStyle(
                                            fontSize: 17,
                                            decoration: TextDecoration.none,
                                            color: _colorPicked,
                                          )),
                                    ),
                                    SizedBox(
                                      width: 10,
                                      child: Center(child: Text('|', style: TextStyle(fontSize: 18, color: Colors.black54),)),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _colorPicked1 = main_color;
                                          _colorPicked = Colors.black54;
                                          _widgetDetails = votes(context);
                                        });
                                      },
                                      child: new Text("Bình luận",
                                          style: TextStyle(
                                            fontSize: 17,
                                            decoration: TextDecoration.none,
                                            color: _colorPicked1,
                                          )),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        // width: 15,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 40.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          MapUtils.openMap(
                                              10.8441733, 106.7890298);
                                        },
                                        child: new Text("Vị trí",
                                            style: TextStyle(
                                              fontSize: 15,
                                              decoration:
                                                  TextDecoration.underline,
                                              color: Colors.blueAccent,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ))),
                _widgetDetails,
                // booking(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _picked() {
       _widgetDetails =   FinalDetailsBooking();
  }



  Widget votes(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: size.width,
        height: 500,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Bình luận',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    border: Border.all(color: Colors.black54),
                  ),
                  child: Column(
                    children: [
                      containerRates(
                          'Thanh Tú', '12:19  18/10/2020', Star5(), 'Tốt !!!'),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          '-----------------------',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                      containerRates('Minh Tuấn', '17:25  17/10/2020',
                          Star4_5(), 'Chủ sân nhiệt tình !!!'),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          '-----------------------',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                      containerRates('Phương Đạt', '12:00  17/10/2020', Star4(),
                          'Tốt !!!'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Star4_5() {
    return Row(children: [
      SizedBox(
        width: 8,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star_half,
        color: Colors.amber,
        size: 20,
      ),
    ]);
  }

  Widget Star5() {
    return Row(children: [
      SizedBox(
        width: 8,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
    ]);
  }

  Widget Star4() {
    return Row(children: [
      SizedBox(
        width: 8,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 20,
      ),
    ]);
  }

  Widget Star3() {
    return Row(children: [
      SizedBox(
        width: 8,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 20,
      ),
      Icon(
        Icons.star_border,
        color: Colors.amber,
        size: 20,
      ),
    ]);
  }

  Widget containerRates(
      String name, String dateTime, Widget star, String chat) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(
                  child: Icon(
                    Icons.person_outline,
                    size: 30,
                    color: Colors.white,
                  ),
                  radius: 25,
                  backgroundColor: Colors.black26,
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.green,
                  width: 130,
                  height: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 5),
                            child: Text(
                              '$name',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                              child: SizedBox(
                            height: 10,
                          )),
                          Text(
                            '$dateTime',
                            style: TextStyle(color: Colors.black87),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      star,
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 70,
              ),
              Text('$chat'),
            ],
          ),
        ],
      ),
    );
  }


  Widget containerWrap(Widget widget) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget,
        ),
      ),
    );
  }



}