
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/booking.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FinalDetailsBooking extends StatefulWidget {
  @override
  FinalDetailsBookingState createState() => FinalDetailsBookingState();
}

enum SingingCharacter { money, momo, atm }

class FinalDetailsBookingState extends State<FinalDetailsBooking> {
  DateTime pickedDate;
  SingingCharacter character = SingingCharacter.money;
  int checkClickDiscount, price;
  double totalPrice;
  DateTime _endTime;
  String btnDiscount, eror, pttt, dropdownValue = 'Sân 5';
  Widget _widget;
  String tapped = null;
  String  email, displayName, days;
  String address, startTime ='', endTime='-----';
  String phone, discount = '-----', discountCheck;
  String timeOpen, priceDiscount;
  String admin, totalTimeHours, totalTime, totalTimeMinute, demo;
  static String  downPrice ='0';
  String note = 'Bạn chỉ được đặt sân ngoài khung giờ trên. Thân chào, quyết thắng và thân ái !!!';
  String noteB = 'Nếu đặt sân dưới 1h thì tiền sẽ tính 1h. Thân chào, quyết thắng và thân ái !!!';

  _pickedDate() async{
    DateTime date = await showDatePicker(
      context: context,
      initialDate: pickedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
      if(date != null){
        setState(() {
        pickedDate = date;
        });
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // demo = '${DateTime.now().subtract(Duration(hours: -1))}';
    demo = '${DateTime.now()}';
    pickedDate = DateTime.now();
    checkClickDiscount = 0;
    startTime = ' ${demo.substring(11, 16).trim()}';
    btnDiscount = 'Nhập mã';
    _getProfile();
    _getTapped();
    _checkTapped();
  }

  void _getProfile() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      displayName = prefs.getString('displayName');
    });
  }

  void _getTapped(){
    setState(() {
      tapped = BookingPageState.tapped;
      if(tapped == ''){
        tapped = 'Sân bóng HCI   5.0';
      }
      if(BookingPageState.day == ''){
        DateTime dateTime = DateTime.now();
        days = '${dateTime.day}-${dateTime.month}-${dateTime.year}';
      }else {
        days = BookingPageState.day;
      }
    });
  }

  void _checkTapped(){
    if(tapped == 'Sân bóng SWD   4.5'){
      setState(() {
        address = '67 Đường số 447, Tăng Nhơn Phú A, Quận 9, TP.HCM';
        phone = '0956721329';
        timeOpen = '8h - 22h';
        admin = 'A.Tú';
        price = 130;
        _widget = columnSWD();
      });
    }else if(tapped == 'Sân bóng HCI   5.0'){
      setState(() {
        address = '442 Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, TP.HCM';
        phone = '0906534119';
        timeOpen = '8h - 22h';
        admin = 'A.Tuấn';
        price = 100;
        _widget = columHCI();
      });
    }else if(tapped == 'Sân bóng PRM   3.5'){
      setState(() {
        address = '6 Đường số 51, Hiệp Bình Chánh, Thủ Đức, TP.HCM';
        phone = '0978999999';
        timeOpen = '8h - 22h';
        admin = 'A.Đạt';
        price = 110;
        _widget = columPRM();
      });
    }else if(tapped == 'Sân bóng ACC   3.0'){
      setState(() {
        address = '225 Nam Hòa, Phước Long A, Quận 9, TP.HCM';
        phone = '0907777777';
        timeOpen = '8h - 22h';
        admin = 'A.Dũng';
        price = 120;
        _widget = columACC();
      });
    }else if(tapped == 'Sân bóng ISC   4.0'){
      setState(() {
        address = '9 Hém 445, Phước Long B, Quận 9, TP.HCM';
        phone = '0901234567';
        timeOpen = '8h - 22h';
        admin = 'A.Nguyên';
        price = 100;
        _widget = columISC();
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
          title: Text('Đặt sân', style: TextStyle(fontSize: 25),),
          backgroundColor: main_color,
        ),
        backgroundColor: Colors.white10,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black12, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Center(child: Text('Bảng thời gian', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text('Sân được đặt lúc: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                          Expanded(
                              child: Center(
                                child: Container(
                                    child: _widget),
                              )),
                        ],
                      ),
                    ),

                       Container(
                        width: size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 90,),
                                  Icon(Icons.adjust, color: Colors.redAccent,),
                                  Text(' Hết sân',  style: TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(width: 20,),
                                  Icon(Icons.adjust, color: Colors.black54,),
                                  Text(' Sân trống',  style: TextStyle(color: Colors.black54, fontSize: 16, fontWeight: FontWeight.w500),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                    SizedBox(height: 20,),
                  ],),),

                Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black12, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Text('Đặt Sân', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),)),
                          Padding(
                            padding: const EdgeInsets.only(top: 0, left:20),
                            child: Row(
                              children: [
                                Text('Ngày đặt: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),),
                                Text('$days', style: TextStyle(fontSize: 20, color: Colors.black54),),
                                Expanded(child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                      icon: Icon(Icons.date_range, size: 25,),
                                      onPressed: () async{
                                        await _pickedDate();
                                        print("Picked Date: ${DateFormat('dd-MM-yyyy').format(pickedDate)}");
                                        setState(() {
                                          days = '${DateFormat('dd-MM-yyyy').format(pickedDate)}';
                                          if(pickedDate.isBefore(DateTime.now().subtract(Duration(days:  0)))){
                                            _widget = columHCI();
                                          }else if(pickedDate.isBefore(DateTime.now().subtract(Duration(days:  -1)))){
                                            _widget = columnSWD();
                                          }else if(pickedDate.isBefore(DateTime.now().subtract(Duration(days:  -2)))){
                                            _widget = columACC();
                                          }else _widget = columPRM();
                                        });
                                      }))),],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 0, left: 20),
                            child: Row(
                              children: [
                                Text('Giờ nhận: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),),
                                Text('$startTime', style: TextStyle(fontSize: 20, color: Colors.black54),),
                                Expanded(child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                      icon: Icon(Icons.timer, size: 25,),
                                      onPressed: () {
                                        DatePicker.showTime12hPicker(context, showTitleActions: true, onConfirm: (date) {
                                          String  fDate= '$date';
                                          print('Start Time ${fDate.substring(10, 16)}');
                                          setState(() {
                                            startTime = '${fDate.substring(10, 16)}';
                                          });
                                        }, currentTime: DateTime.now());
                                      }),
                                )),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 0, left: 20),
                            child: Row(
                              children: [
                                Text('Giờ trả: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),),
                                Text('$endTime', style: TextStyle(fontSize: 20, color: Colors.black54),),
                                Expanded(child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                      icon: Icon(Icons.timer_off, size: 25,),
                                      onPressed: () {
                                        DatePicker.showTime12hPicker(context, showTitleActions: true, onConfirm: (date1) {
                                          String  fDate= '$date1';
                                          print('End Time ${fDate.substring(10, 16)}');
                                          setState(() {
                                            endTime = '${fDate.substring(10, 16)}';
                                            _endTime = DateTime.parse(fDate);
                                          });
                                        }, currentTime: DateTime.now());
                                      }),
                                )),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 0, left: 20),
                            child: Row(
                              children: [
                                Text('Loại sân: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),),
                                Expanded(child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: optionF()
                                )),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 0, left: 20),
                            child: Row(
                              children: [
                                Text('Giá sân: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),),
                                Text('${price}k/1h', style: TextStyle(fontSize: 20, color: Colors.black54),),
                              ],
                            ),
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.only(top: 0, left: 20),
                          //   child: Row(
                          //     children: [
                          //       Text('Mã giảm giá: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                          //       Text('$discount', style: TextStyle(fontSize: 20, color: Colors.black54),),
                          //       Expanded(child: Container(
                          //         alignment: Alignment.centerLeft,
                          //         child: FlatButton(
                          //             onPressed: () {
                          //               setState(() {
                          //                 if(checkClickDiscount == 0){
                          //                   _inputDiscount();
                          //                 }else{
                          //                   _deleteDiscount();
                          //                 }
                          //               });
                          //             },
                          //             child: Text( btnDiscount, style: TextStyle(color: Colors.blue),))
                          //       )),
                          //     ],
                          //   ),
                          // ),

                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 20),
                            child:Text('Phương thức thanh toán: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400),),
                          ),
                          radioPay(),

                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Container(
                                width: 200,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: main_color,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: FlatButton(
                                    splashColor: Colors.white30,
                                    shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20)),
                                    onPressed: () async{
                                      setState(() {
                                        String checkpttt = '$character';
                                        if(checkpttt.substring(checkpttt.indexOf('.') + 1 ) == 'money'){
                                          pttt = 'Tiền mặt';
                                        }else if(checkpttt.substring(checkpttt.indexOf('.') + 1 ) == 'momo'){
                                          pttt = 'Momo';
                                        }else{
                                          pttt = 'ATM/Internet Banking';
                                        }
                                      });
                                      await _checkTime();
                                    },
                                    child: Text('Xác nhận', style: TextStyle(color: Colors.white,fontSize: 28, fontWeight: FontWeight.w700),)),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
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
                                    child: Text('$noteB', style: TextStyle(fontSize: 20, color: Colors.black54),overflow: TextOverflow.fade,),),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
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
  Widget radioPay() {
    return Column(
      children: <Widget>[
        ListTile(
          title:  Row(
            children: [
              Icon(Icons.account_balance_wallet_outlined),
              Text('  Tiền mặt'),
            ],
          ),
          leading: Radio(
            value: SingingCharacter.money,
            groupValue: character,
            onChanged: (SingingCharacter value) {
              setState(() {
                character = value;
              });
            },
          ),
        ),

        ListTile(
          title:  Row(
            children: [
              Icon(Icons.museum_outlined),
              Text('  Momo'),
            ],
          ),
          leading: Radio(
            value: SingingCharacter.momo,
            groupValue: character,
            onChanged: (SingingCharacter value) {
              setState(() {
                character = value;
              });
            },
          ),
        ),

        ListTile(
          title:  Row(
            children: [
              Icon(Icons.local_atm),
              Text('  ATM/ Internet Banking'),
            ],
          ),
          leading: Radio(
            value: SingingCharacter.atm,
            groupValue: character,
            onChanged: (SingingCharacter value) {
              setState(() {
                character = value;
              });
            },
          ),
        ),
      ],
    );
  }

//   void _deleteDiscount(){
//     setState(() {
//       discount = '-----';
//       checkClickDiscount = 0;
//       btnDiscount = 'Nhập mã';
//     });
//   }
//
//   void _inputDiscount() async{
//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         // return object of type Dialog
//         return AlertDialog(
//           title: new Text("Mã giảm giá"),
//           content: Container(
//             height: 60,
//             child: _buildIDTF(),
//           ),
//           actions: <Widget>[
//             // usually buttons at the bottom of the dialog
//             new FlatButton(
//               child: new Text("Done",style: TextStyle(color: Colors.green),),
//               onPressed: () async {
//                 setState(() {
//                   discount = discountCheck;
//                   setState(() {
//                     if(checkClickDiscount == 0){
//                       checkClickDiscount = 1;
//                       btnDiscount = 'Xoá mã';
//                     }
//                   });
//                 });
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     ).then((val) {
// //            *** Code Here ***
//     });
//   }

  // Widget _buildIDTF() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: <Widget>[
  //       Container(
  //         alignment: Alignment.centerLeft,
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.all(
  //                 Radius.circular(4)
  //             ),
  //             boxShadow: [BoxShadow(
  //                 color: Colors.grey,
  //                 offset: Offset(0,-1),
  //                 blurRadius: 0,
  //                 spreadRadius: 0
  //             )] ,
  //             color: Colors.white
  //         ),
  //         height: 60.0,
  //         child: TextField(
  //           onChanged: (text1) {
  //             setState(() {
  //               discountCheck = text1;
  //               print('discountCheck: $discountCheck');
  //             });
  //           },
  //           keyboardType: TextInputType.text,
  //           decoration: InputDecoration(
  //               border: InputBorder.none,
  //               contentPadding: EdgeInsets.only(top: 14.0),
  //               prefixIcon: Icon(
  //                 Icons.monetization_on,
  //                 color: Colors.blue,
  //               ),
  //               hintText: 'Nhập mã giảm giá....'
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }
  Widget containerWrap(Widget widget){
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
  Widget columnSWD(){
    return Container(
      width: 200,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          containerTime('8h', Colors.redAccent),
          containerTime('9h', Colors.redAccent),
          containerTime('10h', Colors.black54),
          containerTime('11h', Colors.black54),
          containerTime('12h', Colors.black54),
          containerTime('13h', Colors.black54),
          containerTime('14h', Colors.black54),
          containerTime('15h', Colors.black54),
          containerTime('16h', Colors.black54),
          containerTime('17h', Colors.black54),
          containerTime('18h', Colors.black54),
          containerTime('19h', Colors.black54),
          containerTime('20h', Colors.redAccent),
          containerTime('21h', Colors.redAccent),
          containerTime('22h', Colors.redAccent),
          containerTime('  ', Colors.black54),
        ],
      ),
    );
  }

  Widget columHCI(){
      return Container(
        width: 200,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            containerTime('8h', Colors.black54),
            containerTime('9h', Colors.black54),
            containerTime('10h', Colors.redAccent),
            containerTime('11h', Colors.redAccent),
            containerTime('12h', Colors.black54),
            containerTime('13h', Colors.black54),
            containerTime('14h', Colors.black54),
            containerTime('15h', Colors.black54),
            containerTime('16h', Colors.black54),
            containerTime('17h', Colors.redAccent),
            containerTime('18h', Colors.redAccent),
            containerTime('19h', Colors.black54),
            containerTime('20h', Colors.black54),
            containerTime('21h', Colors.black54),
            containerTime('22h', Colors.black54),
            containerTime('  ', Colors.black54),
          ],
        ),
      );
  }

  Widget containerTime(String time, Color color){
   return Container(
      height: 30,width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: color),
      ),
      child: Center(child: Text('$time', style: TextStyle(color: color, fontWeight: FontWeight.w700),)),
    );
  }
  Widget columISC(){
    return Container(
      width: 200,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          containerTime('8h', Colors.black54),
          containerTime('9h', Colors.black54),
          containerTime('10h', Colors.black54),
          containerTime('11h', Colors.black54),
          containerTime('12h', Colors.black54),
          containerTime('13h', Colors.black54),
          containerTime('14h', Colors.black54),
          containerTime('15h', Colors.black54),
          containerTime('16h', Colors.black54),
          containerTime('17h', Colors.black54),
          containerTime('18h', Colors.black54),
          containerTime('19h', Colors.black54),
          containerTime('20h', Colors.black54),
          containerTime('21h', Colors.black54),
          containerTime('22h', Colors.black54),
          containerTime('  ', Colors.black54),
        ],
      ),
    );
  }
  Widget columPRM(){
    return Container(
      width: 200,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          containerTime('8h', Colors.black54),
          containerTime('9h', Colors.black54),
          containerTime('10h', Colors.black54),
          containerTime('11h', Colors.black54),
          containerTime('12h', Colors.black54),
          containerTime('13h', Colors.black54),
          containerTime('14h', Colors.black54),
          containerTime('15h', Colors.black54),
          containerTime('16h', Colors.black54),
          containerTime('17h', Colors.black54),
          containerTime('18h', Colors.black54),
          containerTime('19h', Colors.black54),
          containerTime('20h', Colors.black54),
          containerTime('21h', Colors.black54),
          containerTime('22h', Colors.black54),
          containerTime('  ', Colors.black54),
        ],
      ),
    );
  }
  Widget columACC(){
    return Container(
      width: 200,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          containerTime('8h', Colors.black54),
          containerTime('9h', Colors.black54),
          containerTime('10h', Colors.redAccent),
          containerTime('11h', Colors.redAccent),
          containerTime('12h', Colors.black54),
          containerTime('13h', Colors.black54),
          containerTime('14h', Colors.black54),
          containerTime('15h', Colors.black54),
          containerTime('16h', Colors.black54),
          containerTime('17h', Colors.redAccent),
          containerTime('18h', Colors.redAccent),
          containerTime('19h', Colors.redAccent),
          containerTime('20h', Colors.redAccent),
          containerTime('21h', Colors.redAccent),
          containerTime('22h', Colors.redAccent),
          containerTime('  ', Colors.black54),
        ],
      ),
    );
  }
  void _checkTime(){
    if(startTime.isEmpty || startTime == ''){
      _showCheck("Giờ nhận trống !!!");
    }else{
      if(endTime.isEmpty || endTime =='' || endTime == '-----'){
        _showCheck("Giờ trả trống !!!");
      }else{
        String hStartTime = startTime.substring(0, 3).trim();
        String mStartTime = startTime.substring(4, 6).trim();
        String hEndTime = endTime.substring(0, 3).trim();
        String mEndTime = endTime.substring(4, 6).trim();
        int sTime = int.parse(hStartTime);
        int eTime = int.parse(hEndTime);
        int smTime = int.parse(mStartTime);
        int emTime = int.parse(mEndTime);
        if(sTime > eTime || ((sTime == eTime) && emTime < smTime)){
          _showCheck("Giờ trả < Giờ nhận");
        }else if(sTime == eTime && smTime == emTime){
          _showCheck("Không đá đặt chi ???");
        }else{
          _checkTimeDiscount(hStartTime, hEndTime);
        }
      }
    }
  }

  void _checkTimeDiscount(String hStartTime, String hEndTime){
    String code;
    String name = tapped.substring(9, 12);
    List _listSWD = ['08','09','10','11','12','13'];
    List _listHCI = ['10','11','12','13'];
    List _listPRM = ['20','21','22'];
    List _listACC = ['16','17','18','19','20','21','22'];
    List _listISC = ['15','16','17','18','19'];
    List _list;
    List _codeToCheck = ['FBall0813', 'FBall1013', 'FBall2022', 'FBall1622', 'FBall1519'];
    setState(() {
      if(name == 'SWD'){
        _list = _listSWD;
        code = 'FBall0813';
      }else if(name == 'HCI'){
        _list = _listHCI;
        code = 'FBall1013';
      }else if(name == 'PRM'){
        _list = _listPRM;
        code = 'FBall2022';
      }else if(name == 'ACC'){
        _list = _listACC;
        code = 'FBall1622';
      }else if(name == 'ISC'){
        _list = _listISC;
        code = 'FBall1519';
      }

      if(discount != '-----' && discount != null && discount != ''){
        if(discount == code){
          if(!_list.contains(hStartTime) || hStartTime == _list.last){
            _showCheck("Giờ nhận ngoài thời gian giảm giá .");
          }else{
            if(!_list.contains(hEndTime)){
              _showCheck("Giờ trả ngoài thời gian giảm giá .");
            }else{
              print('Code is available');
              if(code == 'FBall0813'){
                setState(() {
                  downPrice = '20';
                });
              }else if(code == 'FBall1013'){
                setState(() {
                  downPrice = '25';
                });
              }else if(code == 'FBall2022'){
                setState(() {
                  downPrice = '50';
                });
              }else if(code == 'FBall1622'){
                setState(() {
                  downPrice = '30';
                });
              }else if(code == 'FBall1519'){
                setState(() {
                  downPrice = '10';
                });
              }
              _formCheckInfo();
            }}
        }else{
          if(!_codeToCheck.contains(discount)){
            _showCheck("Mã giảm giá sai.");
          }else {
            _showCheck("Sân không hỗ trợ mã giảm giá này");
          }
        }
      }else{
        _formCheckInfo();
      }
    });
  }

  void _showCheck(String error) async{
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Thông báo" , style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800, fontSize: 25),),
          content: Container(
            height: 50,
            child: Text('$error', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700, fontSize: 20),),
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

  void _formCheckInfo() async{
    int hourT = int.parse(startTime.substring(0,3));
    int minuteT = int.parse(startTime.substring(4,6));
    String totalT = '${_endTime.subtract( Duration(hours: hourT, minutes: minuteT))}';
    int dowPrice = int.parse(downPrice);
    double perPrice = dowPrice/100;
    double mainTime, time2, time1, perPriceDown, mainPrice;
    print("Main Discount:$perPrice");
    setState(() {
      totalTimeHours = "${totalT.substring(11,13)}";
      time1 = double.parse(totalTimeHours);
      totalTimeMinute = '${totalT.substring(14,16)}';
      time2 = double.parse(totalTimeMinute);
      if((time1 + (time2/60)) < 1){
        mainTime = 1;
      }else mainTime = time1 + (time2/60);
      print("Time chinh:$mainTime");
      totalTime = '${totalTimeHours}h${totalTimeMinute}p';
      perPriceDown = price * perPrice;
      print("Giá được giảm:$perPriceDown");
      mainPrice = price - perPriceDown;
      print("Giá sau giảm:$mainPrice");
      totalPrice = mainPrice * mainTime ;
      print("Tổng tiền:$totalPrice");
    });
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        var size = MediaQuery.of(context).size;
        // return object of type Dialog
        return  FittedBox(
          fit: BoxFit.fill,
          child: AlertDialog(
            title: Center(child: new Text("Phiếu Xác Nhận" , style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25),)),
            content: Container(
                // height: size.height,
                // width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _formPadding('Tên', displayName),
                    _formPadding('Email', email),
                    _formPadding('SĐT', '0967566774'),
                    _formPadding('Sân', tapped.substring(0, 13).trim()),
                    _formPadding('Ngày đặt', days),
                    _formPadding('Giờ nhận sân', startTime),
                    _formPadding('Giờ trả sân', endTime),
                    _formPadding('Loại sân', '$dropdownValue'),
                    _formPadding('PTTT ', pttt),
                    SizedBox(height: 10,),
                    Center(child: Text('--------------------'),),
                    SizedBox(height: 5,),
                    Center(child:  Text("Tổng tiền" , style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25),)),
                    _formPadding('Giá sân', '$price/1h'),
                    _formPadding('Giảm giá', '$downPrice%'),
                    _formPadding('Tổng giờ', totalTime),
                    _formPadding('Giá sau giảm', '${mainPrice.toInt()}k/1h'),
                    _formPadding('Tổng tiền', '${totalPrice.toInt()}k'),

                  ],
                )
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Huỷ",style: TextStyle(color: Colors.redAccent),),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),

              new FlatButton(
                child: new Text("Xác nhận",style: TextStyle(color: Colors.green),),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    ).then((val) {
//            *** Code Here ***
    });
  }

  Widget optionF(){
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 16,
      elevation: 16,
      style: TextStyle(color: Colors.black54),
      underline: Container(
        height: 1,
        // color: main_color,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
          if(dropdownValue == 'Sân 5'){
            price = 100;
          }else{
            price = 140;
          }
        });
      },
      items: <String>['Sân 5', 'Sân 7']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: TextStyle(fontSize: 20),),
        );
      }).toList(),
    );
  }

  Widget _formPadding(String txt, String subtxt){
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$txt: ', style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.8) , fontWeight: FontWeight.w400),),
          Expanded(
            child: Container(
              // margin: EdgeInsets.only(right: 5),
              // width: size.width * 0.67,
              child: Text('$subtxt', style: TextStyle(fontSize: 20, color: Colors.black54),overflow: TextOverflow.fade,),),
          ),
        ],
      ),
    );
  }
}

