import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/url/url.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email ='', displayName = '';
  Widget _getInfo() {
    return Positioned(
      top: 25,
      child: Container(
        margin: const EdgeInsets.all(20),
        // height: 240,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Thông tin cá nhân:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Image.asset('images/logo.png'),
                  ),
                  Expanded(child: Center(child: Text("$displayName", style: GoogleFonts.happyMonkey(),overflow: TextOverflow.clip,))),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Email:"),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(child: Text("$email", overflow: TextOverflow.fade,))
                ],
              ),

              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("SĐT:"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Text("0908000123", overflow: TextOverflow.fade,)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Địa chỉ:"),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(child: Text("Lô E2a-7, Đường D1, Khu Công Nghệ Cao", overflow: TextOverflow.fade,)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Quận/Huyện:"),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Quận 9"),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Thành phố:"),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Hồ Chí Minh"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _userAdress() {
  //   return Positioned(
  //     top: 280,
  //     child: Container(
  //       margin: EdgeInsets.all(20),
  //       height: 215,
  //       width: MediaQuery.of(context).size.width * 0.90,
  //       decoration: BoxDecoration(
  //           color: Colors.white, borderRadius: BorderRadius.circular(20)),
  //       child: Container(
  //         padding: EdgeInsets.all(20),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: <Widget>[
  //             Text(
  //               "Địa chỉ cá nhân :",
  //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Text("SĐT:"),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Expanded(child: Text("0908000123", overflow: TextOverflow.fade,)),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Text("Địa chỉ:"),
  //                 SizedBox(
  //                   width: 5,
  //                 ),
  //                 Expanded(child: Text("Lô E2a-7, Đường D1, Khu Công Nghệ Cao", overflow: TextOverflow.fade,)),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Text("Quận:"),
  //                 SizedBox(
  //                   width: 5,
  //                 ),
  //                 Text("Quận 9"),
  //               ],
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Text("Thành phố:"),
  //                 SizedBox(
  //                   width: 5,
  //                 ),
  //                 Text("Hồ Chí Minh"),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _btnLogout() {
    return Positioned(
      top: 450,
      child: Container(
        margin: EdgeInsets.all(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 1.4 * (MediaQuery.of(context).size.height / 20),
              width: 5 * (MediaQuery.of(context).size.width / 10),
              margin: EdgeInsets.only(bottom: 20),
              child: RaisedButton(
                elevation: 5.0,
                color: Color.fromARGB(255, 2, 177, 79),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () async{
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setString('checkLogin', 'false');
                   signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
                },
                child: Text(
                  "Đăng xuất",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.5,
                    fontSize: MediaQuery.of(context).size.height / 40,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProfile();
  }

  void _getProfile() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email');
      displayName = prefs.getString('displayName');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     image: DecorationImage(
      //         fit: BoxFit.fill,
      //         image: AssetImage(url_imgbackground_welcome))
      // ),


      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            _getInfo(),
            // _userAdress(),
            _btnLogout(),
          ],
        ),
      ),
    );
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();

    print("User Signed Out");
  }
}
