import 'package:docme/login/singup.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'Onboarding/routes_pages.dart';
import 'Splash/splash.dart';
import 'favoree/Favorable.dart';
import 'home/home.dart';
import 'about_us/about_us.dart';
import 'about_us/contact_us.dart';
import 'home/profil.dart';
import 'home/map.dart';
import 'login/login.dart';


void main() => runApp(MaterialApp(
  color: Color(0xff5097a4),
  home: Onboarding(),
));


class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  Widget cont=SpecialitiesList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[200] ,
      body: cont,
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        height: 50,
        buttonBackgroundColor: Color(0xff5097a4),
        backgroundColor: Colors.grey[200],
        items: <Widget>[
          Icon(Icons.favorite_border),
          Icon(Icons.home),
          Icon(Icons.contact_phone)
        ],
        onTap: (index){
          setState(() {
            if (index==0){cont = Favorable();}
            if (index==1){cont = SpecialitiesList();}
            if (index== 2){cont =About_us() ;}
          });
        },
      ),
    );
  }
}

