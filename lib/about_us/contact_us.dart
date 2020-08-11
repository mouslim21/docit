import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_us.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Contact ",
          style: TextStyle(color: Colors.white),
        ),
        leading: FlatButton(
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) => About_us());
            Navigator.pop(context, route);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
        ),
        backgroundColor: Colors.blue.shade800,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Image(
            image: AssetImage("images/ph1.png"),
            height: 305,
          ),
          new Container2(
            margtop: 22,
            margbottom: 15,
            icon: Icons.phone,
            str: "      +213 789456123",
          ),
          Container2(
            margtop: 20,
            margbottom: 16,
            icon: Icons.mail,
            str: "     ftxteal@gmail.com ",
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 6, bottom: 2, left: 50, right: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: <Widget>[
                new Expnded2(img: "images/insta.png"),
                Expnded2(
                  img: "images/linkdin.png",
                ),
                Expnded2(
                  img: "images/fb.png",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Container2 extends StatelessWidget {
  double margtop, margbottom;
  IconData icon;
  String str;
  Container2({this.icon, this.margbottom, this.margtop, this.str});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(
          top: margtop, bottom: margbottom, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.blue.shade800,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
          ),
          Text(
            str,
            style: TextStyle(color: Colors.grey.shade200, fontSize: 18),
          )
        ],
      ),
    );
  }
}

class Expnded2 extends StatelessWidget {
  String img;
  Expnded2({this.img});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: FlatButton(
          splashColor: Colors.white,
          onPressed: ()async{
            if(img =="images/insta.png"){

                var url = 'https://www.instagram.com/';
                print("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj");
                if (await canLaunch(url)) {
                  await launch(
                    url,
                    universalLinksOnly: true,
                  );
                } else {
                  throw 'There was a problem to open the url: $url';
                }
            };
            if(img =="images/fb.png"){
    var url = 'https://facebook.com';

    if (await canLaunch(url)) {
    await launch(
    url,
    universalLinksOnly: true,
    );
    } else {
    throw 'There was a problem to open the url: $url';
    }
    String fbProtocolUrl;
//    if (Platform.isIOS) {
//    fbProtocolUrl = snaapshoot.data['fb'];
//    } else {
//    fbProtocolUrl = snaapshoot.data['fb'];
//    }

    String fallbackUrl = 'https://www.facebook.com/page_name';

    try {
    bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

    if (!launched) {
    await launch(fallbackUrl, forceSafariVC: false);
    }
    } catch (e) {
    await launch(fallbackUrl, forceSafariVC: false);
            }};
            debugPrint("hhhh");
          },
          child: ClipRect(
            child: Image(
              image: AssetImage(img),
              height: 42,
            ),
          ),
        ),
      ),
    );
  }
}
