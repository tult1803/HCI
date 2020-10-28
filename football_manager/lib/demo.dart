import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';

class Demo extends StatefulWidget {
  @override
  DemoState createState() => DemoState();
}

class DemoState extends State<Demo> {
  // int _current = 0;
  List imgList = [
        'images/qc01.jpg',
        'images/qc02.jpg',
        'images/qc03.png',
        'images/qc04.jpg',
  ];

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

          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider(
                    options: CarouselOptions(
                      height: 150,
                      initialPage: 2,
                      viewportFraction: 0.4,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
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
                            width:  250,
                            margin: EdgeInsets.symmetric(horizontal: 0),
                            child: Image(image: AssetImage(e),fit: BoxFit.fill,),
                          );
                        },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ));
  }
}
