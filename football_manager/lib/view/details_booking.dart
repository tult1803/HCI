
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
  String tapped, days;
  String address, startTime ='', endTime='';
  String phone, discount = '-----', discountCheck;
  String timeOpen;
  String admin;
  String price;
  String note = 'Bạn chỉ được đặt sân ngoài khung giờ trên. Thân chào, quyết thắng và thân ái !!!';
  String noteB = 'Nếu đặt sân dưới 1h thì tiền sẽ tính 1h. Thân chào, quyết thắng và thân ái !!!';
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
     if(BookingPageState.day == ''){
       DateTime dateTime = DateTime.now();
       days = '${dateTime.day}-${dateTime.month}-${dateTime.year}';
     }else {
       days = BookingPageState.day;
     }
    });
  }

  void _checkTapped(){
    if(tapped == 'Sân bóng SWD'){
      setState(() {
         address = '67 Đường số 447, Tăng Nhơn Phú A, Quận 9, TP.HCM';
         phone = '0956721329';
         timeOpen = '8h - 22h';
         admin = 'A.Tú';
         price = '130k';
         _widget = columSWD();
      });
    }else if(tapped == 'Sân bóng HCI'){
      setState(() {
        address = '442 Lê Văn Việt, Tăng Nhơn Phú A, Quận 9, TP.HCM';
        phone = '0906534119';
        timeOpen = '8h - 22h';
        admin = 'A.Tuấn';
        price = '100k';
        _widget = columHCI();
      });
    }else if(tapped == 'Sân bóng PRM'){
      setState(() {
        address = '6 Đường số 51, Hiệp Bình Chánh, Thủ Đức, TP.HCM';
        phone = '0978999999';
        timeOpen = '8h - 22h';
        admin = 'A.Đạt';
        price = '110k';
        _widget = columPRM();
      });
    }else if(tapped == 'Sân bóng ACC'){
      setState(() {
        address = '225 Nam Hòa, Phước Long A, Quận 9, TP.HCM';
        phone = '0907777777';
        timeOpen = '8h - 22h';
        admin = 'A.Dũng';
        price = '120k';
        _widget = columACC();
      });
    }else if(tapped == 'Sân bóng ISC'){
      setState(() {
        address = '9 Hém 445, Phước Long B, Quận 9, TP.HCM';
        phone = '0901234567';
        timeOpen = '8h - 22h';
        admin = 'A.Nguyên';
        price = '100k';
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

                       Padding(
                         padding: const EdgeInsets.only(top: 10, left: 20),
                         child: Row(
                           children: [
                             Text('Giá sân: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                             Text('$price/1h', style: TextStyle(fontSize: 20, color: Colors.black54),),
                           ],
                         ),
                       ),

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
                       SizedBox(height: 20,),
                     ],
                   ))),

            Card(
              color: Colors.white70,
              child: Container(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text('Đặt Sân', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),)),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Row(
                        children: [
                          Text('Ngày đặt: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                          Text('$days', style: TextStyle(fontSize: 20, color: Colors.black54),),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Row(
                        children: [
                          Text('Giờ nhận: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                          Text('$startTime', style: TextStyle(fontSize: 20, color: Colors.black54),),
                          Expanded(child: Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                icon: Icon(Icons.timer_outlined, size: 25,),
                                onPressed: () {
                                  DatePicker.showTime12hPicker(context, showTitleActions: true, onConfirm: (date) {
                                    String  fDate= '$date';
                                    print('Start Time ${fDate}');
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
                          Text('Giờ trả: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                          Text('$endTime', style: TextStyle(fontSize: 20, color: Colors.black54),),
                          Expanded(child: Container(
                            alignment: Alignment.centerLeft,
                            child: IconButton(
                                icon: Icon(Icons.timer_off, size: 25,),
                                onPressed: () {
                                  DatePicker.showTime12hPicker(context, showTitleActions: true, onConfirm: (date1) {
                                    String  fDate= '$date1';
                                    print('End Time ${fDate}');
                                    setState(() {
                                      endTime = '${fDate.substring(10, 16)}';
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
                          Text('Mã giảm giá: ', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),),
                          Text('$discount', style: TextStyle(fontSize: 20, color: Colors.black54),),
                          Expanded(child: Container(
                            alignment: Alignment.centerLeft,
                            child: FlatButton(
                                onPressed: () {
                                  _inputDiscount();
                                },
                                child: Text('Nhập mã', style: TextStyle(color: Colors.blue),))
                          )),
                        ],
                      ),
                    ),

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: FlatButton(
                              height: 50,
                            splashColor: Colors.white30,
                            shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(20)),
                              onPressed: () {

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

  void _inputDiscount() async{
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Mã giảm giá"),
            content: Container(
              height: 60,
              child: _buildIDTF(),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Done",style: TextStyle(color: Colors.green),),
                onPressed: () async {
                  setState(() {
                    discount = discountCheck;
                  });
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

  Widget _buildIDTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(4)
              ),
              boxShadow: [BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0,-1),
                  blurRadius: 0,
                  spreadRadius: 0
              )] ,
              color: Colors.white
          ),
          height: 60.0,
          child: TextField(
            onChanged: (text1) {
              setState(() {
                 discountCheck = text1;
                 print('discountCheck: $discountCheck');
              });
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.monetization_on,
                  color: Colors.blue,
                ),
                hintText: 'Nhập mã giảm giá....'
            ),
          ),
        )
      ],
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
