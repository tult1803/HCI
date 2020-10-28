import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:football_manager/presenter/presenter_news.dart';
import 'package:football_manager/url/url.dart';
import 'package:football_manager/view/details_news.dart';
import 'package:google_fonts/google_fonts.dart';

import 'booking.dart';

class NewsPage extends StatefulWidget {
  @override
  NewsPageState createState() => NewsPageState();
}

class NewsPageState extends State<NewsPage> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;

  // final CategoriesScroller categoriesScroller = CategoriesScroller();
  static String tappedNews = '';
  static String tappedTime = '';
  static String tappedSales = '';

  @override
  void initState() {
    // TODO: implement initState
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return Container(
      color: Colors.white,
      child: Container(
        child: Column(
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 2, 177, 79),
              ),
              // width: size.width,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                            // color: Colors.blue,
                            child: Row(
                          children: [
                            _conHeader(
                                context,
                                'images/iconDatSan.png',
                                'Đặt sân',
                                Icon(
                                  Icons.add_chart,
                                  size: 30,
                                )),
                            _conHeader(
                                context,
                                'images/iconGanNhat.png',
                                'Gần nhất',
                                Icon(
                                  Icons.location_pin, color: Colors.redAccent,
                                  size: 30,
                                )),
                            _conHeader(
                                context,
                                'images/iconDatSan.png',
                                'Giá tốt',
                                Icon(
                                  Icons.monetization_on_outlined, color: Color.fromARGB(255, 2, 177, 79),
                                  size: 30,
                                )),
                            _conHeader(
                                context,
                                'images/iconDatSan.png',
                                'Đánh giá',
                                Icon(
                                  Icons.star, color: Colors.amber,
                                  size: 30,
                                )),
                          ],
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(
                  left: 5,
                  top: 5,
                  right: 5,
                ),
                children: [
                  Container(
                      decoration: BoxDecoration(
                        // border: Border,
                      ),
                      child: slideShow()
            ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 0),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.monetization_on_outlined,
                                  color: Color.fromARGB(255, 2, 177, 79),
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Giá tốt nhất',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                      color: Color.fromARGB(255, 23, 22, 22)),
                                ),
                              ],
                            )),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: closeTopContainer ? 0 : 1,
                          child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: size.width,
                              alignment: Alignment.topCenter,
                              height:
                                  closeTopContainer ? 0 : (categoryHeight - 40),
                              child: CategoriesScroller1(
                                  context,
                                  'Sân Phúc Lộc',
                                  '4.0',
                                  '0906534119 (A.Tuấn)',
                                  100,
                                  'Sân Nam Lý',
                                  '4.5',
                                  '0956721329 (A.Tú)',
                                  130,
                                  'Sân Tiến Phát',
                                  '3.5',
                                  '0978999999(A.Đạt)',
                                  110)),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      // color: Colors.black12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Đánh giá cao',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.none,
                                        color: Color.fromARGB(255, 23, 22, 22)),
                                  ),
                                ],
                              )),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: closeTopContainer ? 0 : 1,
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: size.width,
                                alignment: Alignment.topCenter,
                                height: closeTopContainer
                                    ? 0
                                    : (categoryHeight - 50),
                                child: CategoriesScroller(
                                    context,
                                    'Sân Hiệp Phú',
                                    '5.0',
                                    '0907777777 (A.Dũng)',
                                    120,
                                    'Sân Phúc Lộc',
                                    '4.0',
                                    '0906534119 (A.Tuấn)',
                                    100,
                                    'Sân Tiến Phát',
                                    '3.5',
                                    '0978999999(A.Đạt)',
                                    110)),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(left: 0),
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_pin,
                                    color: Colors.redAccent,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Gần nhất',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.none,
                                        color: Color.fromARGB(255, 23, 22, 22)),
                                  ),
                                ],
                              )),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 200),
                            opacity: closeTopContainer ? 0 : 1,
                            child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: size.width,
                                alignment: Alignment.topCenter,
                                height: closeTopContainer
                                    ? 0
                                    : (categoryHeight - 40),
                                child: CategoriesScroller(
                                    context,
                                    'Sân Kaly',
                                    '4.5',
                                    '0901234567 (A.Nguyên)',
                                    100,
                                    'Sân Hiệp Phú',
                                    '5.0',
                                    '0907777777 (A.Dũng)',
                                    120,
                                    'Sân Tiến Phát',
                                    '3.5',
                                    '0978999999(A.Đạt)',
                                    110)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _conHeader(
      BuildContext context, String urlImg, String txt, Icon icon) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        // color: Colors.white10,
        width: (size.width - 40) / 4,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => BookingPage()));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(image: AssetImage(urlImg),height: 50,),
              icon,
              SizedBox(
                height: 10,
              ),
              Text(
                txt,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
//   Widget tintuc(String time, String soccer_field, int sale, double start , int timeToCome, double far){
//     return Card(
//       margin: EdgeInsets.only(left: 10, right: 10,top: 10),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Container(
//           height: 110,
//           decoration: BoxDecoration(
//             color: Colors.white70,
//             border: Border.all(color: Colors.black54),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child:  FlatButton(
//             onPressed: () {
//               setState(() {
//                 tappedNews = soccer_field;
//                 tappedTime = time;
//                 tappedSales = sale.toString();
//               });
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsNews()));
//             },
//             child: Row(
//               children: [
//                 Container(
//                   width: 80,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Icon(Icons.attach_money, size: 50, color: Colors.red,),
// //                    Padding(
// //                      padding:  EdgeInsets.only(top:8.0),
// //                      child: Text("$sale%", style: TextStyle(
// //                        fontSize: 20,
// //                        color: Colors.red,
// //                        fontWeight: FontWeight.w700,
// //                      ),),
// //                    )
//                     ],
//                   ),
//                 ),
//                 Expanded(child: Container(
// //                    color: Colors.redAccent,
// //                  padding: EdgeInsets.only(left: 20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ListTile(
//                         title: Text("Sân bóng ${soccer_field}",style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w700,
//                         ),),
//                         subtitle: Row(
//                           children: [
//                             Text('$time  ',style: TextStyle(
//                               fontSize: 20,
//                             ),),
//                             Text('$start' , style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
//                             Icon(Icons.star ,color: Colors.black,),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(left: 15),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Icon(Icons.watch_later_outlined, size: 15,),
//                             Text('15p - 4km' , style: TextStyle(color: Colors.black, fontSize: 15),),
//                             // Icon(Icons.),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 10,),
//                     ],
//                   ),
//                 )),
//                 Container(
//                   width: 80,
//                   child: Text('$sale%', style: GoogleFonts.zeyada(fontSize: 50, color: Colors.red, fontWeight: FontWeight.w600),),
//                 )
//               ],),
//           )
//       ),
//     );
//   }
}
