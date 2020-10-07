

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/booking.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsBooking extends StatefulWidget {
  @override
  _DetailsBookingState createState() => _DetailsBookingState();
}

class _DetailsBookingState extends State<DetailsBooking> {
  Widget _widget;
  String tapped;
  String address;
  String phone;
  String timeOpen;
  String admin;
  String note = 'Bạn chỉ được đặt sân ngoài khung giờ trên. Thân chào, quyết thắng và thân ái !!!';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getTapped();
    _checkTapped();
  }

  void _getTapped(){
    setState(() {
      tapped = BookingPageState.tapped;
    });
  }

  void _checkTapped(){
    if(tapped == 'Sân bóng SWD'){
      setState(() {
         address = '67 Đường số 447, Tăng Nhơn Phú A, Quận 9, TP.HCM';
         phone = '0956721329';
         timeOpen = '8h - 22h';
         admin = 'A.Tú';
         _widget = columSWD();
      });
    }else if(tapped == 'Sân bóng HCI'){
      setState(() {
        address = '442 Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, TP.HCM';
        phone = '0906534119';
        timeOpen = '8h - 22h';
        admin = 'A.Tuấn';
        _widget = columHCI();
      });
    }else if(tapped == 'Sân bóng PRM'){
      setState(() {
        address = '6 Đường số 51, Hiệp Bình Chánh, Thủ Đức, TP.HCM';
        phone = '0978999999';
        timeOpen = '8h - 22h';
        admin = 'A.Đạt';
        _widget = columPRM();
      });
    }else if(tapped == 'Sân bóng ACC'){
      setState(() {
        address = '225 Nam Hòa, Phước Long A, Quận 9, TP.HCM';
        phone = '0907777777';
        timeOpen = '8h - 22h';
        admin = 'A.Dũng';
        _widget = columACC();
      });
    }else if(tapped == 'Sân bóng ISC'){
      setState(() {
        address = '9 Hém 445, Phước Long B, Quận 9, TP.HCM';
        phone = '0901234567';
        timeOpen = '8h - 22h';
        admin = 'A.Nguyên';
        _widget = columISC();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(url_imgbackground_welcome))
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chi tiết sân'),
          backgroundColor: Colors.white10,
        ),
        backgroundColor: Colors.white10,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 10),
            child: Column(
              children: [
                Card(
                  color: Colors.white70,
                  child: Container(
                    width: size.width,
                    // height: 230,
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     // mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 20.0),
                         child: Center(child: Text('${tapped}', style: GoogleFonts.alice(fontSize: 28, fontWeight: FontWeight.w600),)),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 10, left: 20),
                         child: Row(
                           children: [
                             Text('Liên hệ: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                             Text('$phone ($admin)', style: TextStyle(fontSize: 20, color: Colors.black54),),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 10, left: 20),
                         child: Row(
                           // mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Địa chỉ: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                             Expanded(
                               child: Container(
                                 // margin: EdgeInsets.only(right: 5),
                                 // width: size.width * 0.67,
                                 child: Text('$address', style: TextStyle(fontSize: 20, color: Colors.black54),overflow: TextOverflow.fade,),),
                             ),
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 10, left: 20),
                         child: Row(
                           children: [
                             Text('Mở cửa: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                             Text('$timeOpen', style: TextStyle(fontSize: 20, color: Colors.black54),),
                           ],
                         ),
                       ),
                       SizedBox(height: 20,),
                     ],
                   ))),

            Card(
              color: Colors.white70,
              child: Container(
                width: size.width,
                height: 400,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sân được đặt lúc: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                          Expanded(
                            child: Container(
                              child: _widget)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lưu ý: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),),
                          Expanded(
                            child: Container(
                              // margin: EdgeInsets.only(right: 5),
                              // width: size.width * 0.67,
                              child: Text('$note', style: TextStyle(fontSize: 20, color: Colors.black54),overflow: TextOverflow.fade,),),
                          ),
                        ],
                      ),
                    ),

                    FlatButton(
                        onPressed: () {
                          DatePicker.showTime12hPicker(context, showTitleActions: true, onChanged: (date) {
                            print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                          }, onConfirm: (date) {
                            print('confirm $date');
                          }, currentTime: DateTime.now());
                        },
                        child: Text(
                          'show 12H time picker with AM/PM',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget columSWD(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('8h - 9h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
        Text('13h - 15h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
        Text('20h - 22h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget columHCI(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('8h - 9h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
        Text('16h - 18h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }
  Widget columISC(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('13h - 15h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
        Text('18h - 20h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }
  Widget columPRM(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('13h - 15h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
        Text('21h - 22h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }
  Widget columACC(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('10h - 12h', style: TextStyle(fontSize: 20, color: Colors.redAccent, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
