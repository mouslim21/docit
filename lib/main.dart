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
import 'login/authservice.dart';
import 'login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


 Future<void> main()async{
   WidgetsFlutterBinding.ensureInitialized();
   SharedPreferences prefs = await SharedPreferences.getInstance();
   var onb = prefs.getString('onb');
   var email = prefs.getString('email');
   var isnew = prefs.getBool("isnew");
   prefs.setBool('isnew', true);
   print(email);
   runApp(MaterialApp(
     color: Colors.blue.shade800,
     home:onb==null? Onboarding():(email == null ? LoginPage() : Myapp()) ,
   ));
 }


class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // debugShowCheckedModeBanner: false,
      //theme: ThemeData(primarySwatch: Colors.blue.shade800, fontFamily: 'Nunito'),
      home: AuthService().handleAuth(),
      //Myapp(),
    );
  }
}


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
        height: 58,
        buttonBackgroundColor: Colors.blue.shade900,
        backgroundColor: Colors.grey[200],
        items: <Widget>[
          Icon(Icons.favorite_border),
          Icon(Icons.home),
          Icon(Icons.settings)
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

