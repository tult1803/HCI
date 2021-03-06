
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/view/details_booking.dart';
import 'package:football_manager/view/final_details_booking.dart';
import 'package:google_fonts/google_fonts.dart';

Widget CategoriesScroller(BuildContext context, String s1, String ss1, String p1, int price1,String s2, String ss2, String p2, int price2, String s3, String ss3, String p3, int price3){
  final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
  return SingleChildScrollView(
    // physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        child: Row(
          children: <Widget>[
            Container(
              width: 300,
              margin: EdgeInsets.only(right: 20),
              // height: categoryHeight - 15,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: FlatButton(
                onPressed: () async{
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsBooking()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "$s1",
                              style: GoogleFonts.capriola(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text('$ss1', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
                          Icon(Icons.star, size: 30, color: Colors.amber,),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Mở cửa: 8h - 22h",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Liên hệ: $p1",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        "Loại sân: 5 - 7",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: [
                          Text(
                            "Giá sân:",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Text('${price1}k - 280k/1h', style: TextStyle(fontSize: 16, color: Colors.black54),),
                        ],
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.watch_later_outlined, size: 15,),
                            Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
                            // Icon(Icons.),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(right: 20),
              // height: categoryHeight - 15,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "$s2",
                              style: GoogleFonts.capriola(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text('$ss2', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
                          Icon(Icons.star, size: 30, color: Colors.amber,),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Mở cửa: 8h - 22h",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        "Liên hệ: $p2",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        "Loại sân: 5 - 7 - 11",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: [
                          Text(
                            "Giá sân:",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Text('${price2}k - 230k - 350k/1h', style: TextStyle(fontSize: 16, color: Colors.black54),),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.watch_later_outlined, size: 15,),
                            Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
                            // Icon(Icons.),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(right: 20),
              // height: categoryHeight - 15,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "$s3",
                            style: GoogleFonts.capriola(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text('$ss3', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
                        Icon(Icons.star, size: 30, color: Colors.amber,),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Mở cửa: 8h - 22h",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Liên hệ: $p3",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),

                    Text(
                      "Loại sân: 5 - 7",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Giá sân:",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Text('${price3}k - 250k/1h', style: TextStyle(fontSize: 16, color: Colors.black54),),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.watch_later_outlined, size: 15,),
                          Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
                          // Icon(Icons.),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget CategoriesScroller1(BuildContext context, String s1, String ss1, String p1, int price1,String s2, String ss2, String p2, int price2, String s3, String ss3, String p3, int price3){
  // final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
  return SingleChildScrollView(
    // physics: BouncingScrollPhysics(),
    scrollDirection: Axis.horizontal,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: FittedBox(
        fit: BoxFit.fill,
        alignment: Alignment.topCenter,
        child: Row(
          children: <Widget>[
            Container(
              width: 300,
              margin: EdgeInsets.only(right: 20),
              // height: categoryHeight - 15,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: FlatButton(
                onPressed: () async{
                  FinalDetailsBookingState.downPrice = '20';
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsBooking()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "$s1",
                              style: GoogleFonts.capriola(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text('$ss1', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
                          Icon(Icons.star, size: 30, color: Colors.amber,),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Mở cửa: 8h - 22h",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Liên hệ: $p1",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Loại sân: 5",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Giá sân:",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Row(
                            children: [
                              Text('${price1}k/1h', style: TextStyle(fontSize: 16, color: Colors.black54, decoration: TextDecoration.lineThrough	), ),
                              Text('    ${80}k/1h', style: GoogleFonts.aladin(fontSize: 20, color: Colors.black, decoration: TextDecoration.none	), ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.watch_later_outlined, size: 15,),
                            Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
                            // Icon(Icons.),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(right: 20),
              // height: categoryHeight - 15,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "$s2",
                              style: GoogleFonts.capriola(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text('$ss2', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
                          Icon(Icons.star, size: 30, color: Colors.amber,),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Mở cửa: 8h - 22h",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Liên hệ: $p2",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Text(
                        "Loại sân: 7",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        children: [
                          Text(
                            "Giá sân:",
                            style: TextStyle(fontSize: 16, color: Colors.black54),
                          ),
                          Row(
                            children: [
                              Text('${price2}k/1h', style: TextStyle(fontSize: 16, color: Colors.black54,decoration: TextDecoration.lineThrough),),
                              Text('     ${price2 - 30}k/1h', style: GoogleFonts.aladin(fontSize: 20, color: Colors.black,decoration: TextDecoration.none),),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.watch_later_outlined, size: 15,),
                            Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
                            // Icon(Icons.),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(right: 20),
              // height: categoryHeight - 15,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,width: 0.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "$s3",
                            style: GoogleFonts.capriola(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text('$ss3', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
                        Icon(Icons.star, size: 30, color: Colors.amber,),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Mở cửa: 8h - 22h",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Liên hệ: $p3",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Loại sân: 7",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Giá sân:",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Row(
                          children: [
                            Text('${price3}k/1h', style: TextStyle(fontSize: 16, color: Colors.black54,decoration: TextDecoration.lineThrough	),),
                            Text('      ${price3 - 20}k/1h', style: GoogleFonts.aladin(fontSize: 20, color: Colors.black,decoration: TextDecoration.none	),),
                          ],
                        ),


                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.watch_later_outlined, size: 15,),
                          Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
                          // Icon(Icons.),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget slideShow(){
  List imgList = [
    'images/qc01.jpg', // giữ
    'images/qc02.jpg',
    'images/qc03.png',
    'images/qc04.jpg', // giữ
  ];
  return CarouselSlider(
    options: CarouselOptions(
      height: 200,
      initialPage: 0,
      viewportFraction: 0.9,
      // enlargeCenterPage: true,

      autoPlay: true,
      autoPlayInterval: Duration(seconds: 5),
      autoPlayAnimationDuration: Duration(milliseconds: 3000),
      // onPageChanged: (index, reason) {
      //   setState(() {
      //     _current = index;
      //   });
      // },
    ),
    items: imgList.map((e) {
      // print('$e');
      return Builder(
        builder: (context) {
          return Container(
            width:  350,
            margin: EdgeInsets.symmetric(horizontal: 0),
            child: Image(image: AssetImage(e),fit: BoxFit.fill,),
          );
        },
      );
    }).toList(),
  );
}

//
// Widget CategoriesScroller(BuildContext context, String s1, String ss1, String p1, int price1,String s2, String ss2, String p2, int price2, String s3, String ss3, String p3, int price3){
//   final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;
//   return SingleChildScrollView(
//     // physics: BouncingScrollPhysics(),
//     scrollDirection: Axis.horizontal,
//     child: Container(
//       margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       child: FittedBox(
//         fit: BoxFit.fill,
//         alignment: Alignment.topCenter,
//         child: Row(
//           children: <Widget>[
//             Container(
//               width: 300,
//               margin: EdgeInsets.only(right: 20),
//               height: categoryHeight - 15,
//               decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               child: FlatButton(
//                 onPressed: () async{
//                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsBooking()));
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               "$s1",
//                               style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Text('$ss1', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
//                           Icon(Icons.star_border, size: 30,),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Mở cửa: 8h - 22h",
//                         style: TextStyle(fontSize: 16, color: Colors.black54),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Liên hệ: $p1",
//                         style: TextStyle(fontSize: 16, color: Colors.black54),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Giá sân:",
//                             style: TextStyle(fontSize: 16, color: Colors.black54),
//                           ),
//                           Text('${price1}k/1h', style: TextStyle(fontSize: 16, color: Colors.black54),),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Sức chứa: 16",
//                         style: TextStyle(fontSize: 16, color: Colors.black54),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         // margin: EdgeInsets.only(left: 30),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Icon(Icons.watch_later_outlined, size: 15,),
//                             Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
//                             // Icon(Icons.),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               width: 300,
//               margin: EdgeInsets.only(right: 20),
//               height: categoryHeight - 15,
//               decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Text(
//                               "$s2",
//                               style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           Text('$ss2', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
//                           Icon(Icons.star_border, size: 30,),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Mở cửa: 8h - 22h",
//                         style: TextStyle(fontSize: 16, color: Colors.black54),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Liên hệ: $p2",
//                         style: TextStyle(fontSize: 16, color: Colors.black54),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "Giá sân:",
//                             style: TextStyle(fontSize: 16, color: Colors.black54),
//                           ),
//                           Text('${price2}k/1h', style: TextStyle(fontSize: 16, color: Colors.black54),),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "Sức chứa: 16",
//                         style: TextStyle(fontSize: 16, color: Colors.black54),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Container(
//                         // margin: EdgeInsets.only(left: 30),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Icon(Icons.watch_later_outlined, size: 15,),
//                             Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
//                             // Icon(Icons.),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               width: 300,
//               margin: EdgeInsets.only(right: 20),
//               height: categoryHeight - 15,
//               decoration: BoxDecoration(color: Colors.white70, borderRadius: BorderRadius.all(Radius.circular(20.0))),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             "$s3",
//                             style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Text('$ss3', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
//                         Icon(Icons.star_border, size: 30,),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Mở cửa: 8h - 22h",
//                       style: TextStyle(fontSize: 16, color: Colors.black54),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Liên hệ: $p3",
//                       style: TextStyle(fontSize: 16, color: Colors.black54),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           "Giá sân:",
//                           style: TextStyle(fontSize: 16, color: Colors.black54),
//                         ),
//                         Text('${price3}k/1h', style: TextStyle(fontSize: 16, color: Colors.black54),),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Sức chứa: 16",
//                       style: TextStyle(fontSize: 16, color: Colors.black54),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       // margin: EdgeInsets.only(left: 30),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Icon(Icons.watch_later_outlined, size: 15,),
//                           Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
//                           // Icon(Icons.),
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }