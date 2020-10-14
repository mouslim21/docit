import 'package:docme/login/login.dart';
import 'package:flutter/material.dart';
import 'contact_us.dart';
import 'FAQ.dart';
import 'about_inner_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class About_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: ListView(
        children: <Widget>[
          Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade800,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        border: Border.all(color: Colors.black12)),
                    height: 140,
                  ),
                  SizedBox(
                    height: 150,
                  ),
                  new About_us_card(
                    txt: "Déconnexion",
                    icon: Icons.highlight_off,
                  ),
                  new About_us_card(
                    txt: " Faq  ",
                    icon: Icons.question_answer,
                  ),
                  new About_us_card(
                    txt: " Contact  ",
                    icon: Icons.contact_phone,
                  ),
                ],
              ),
              _buildHeader(context),
            ],
          )
        ],
      ),
    );
  }
}

Container _buildHeader(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 50.0, right: 20, left: 20),
    height: 240.0,
    child: Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 40.0, bottom: 10.0),
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 5.0,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: Text(
                    "Nous soutenir ? ",
                    style: GoogleFonts.slabo27px(fontSize: 20,fontWeight: FontWeight.bold),

                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                 Center(
                   child: Row(
                     children: <Widget>[
                       SizedBox(height: 90,),
//                       SizedBox(width: 15,),
                     SizedBox(width: 45,),
                       Expanded(
                         child: FlatButton(
                           child: Container(
                             padding: EdgeInsets.only(right: 10,left: 10),
                             height: 60,
                             width: 60,
                             child: Image(image: AssetImage("images/play.png")),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               color: Colors.white,
                               boxShadow: [BoxShadow(
                                 color:Colors.blueGrey.shade800,
                                 blurRadius: 1,
                                 spreadRadius: 0.1
                               )],
//                               image: DecorationImage(
//                                   image:
//                                   AssetImage("images/ins.png"))
                             ),
                           ),
                         ),
                       ),
                       //SizedBox(width: 35,),
                       Expanded(
                         child: FlatButton(
                           child: Container(
                             padding: EdgeInsets.only(right: 10,left: 10),
                             height: 60,
                             width: 60,
                             child: Image(image: AssetImage("images/app.png")),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(12),
                               color: Colors.white,
                               boxShadow: [BoxShadow(
                                   color:Colors.blueGrey.shade800,
                                   blurRadius: 1,
                                   spreadRadius: 0.1
                               )],
//                               image: DecorationImage(
//                                   image:
//                                   AssetImage("images/ins.png"))
                             ),
                           ),
                         ),
                       ),
                       SizedBox(width: 45,),
                     ],
                   ),
                 ),
//                Center(
//                  child: Text(
//                      "Zakria Bouchelaghem\nMohammed Nasri\nHamza Korbaa\nMouslim Messaoudi\nZkaria Chergui ",
//                    style: GoogleFonts.asap(fontSize: 16,fontWeight: FontWeight.w400),
//
//                  ),
//                ),
                SizedBox(
                  height: 0.0,
                ),
                Container(
                  height: 2.0,
                  margin: EdgeInsets.only(left: 2, right: 2),
                  child: Text(
                    "       "
                    "                                                                            ",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Material(
              elevation: 5.0,
              shape: CircleBorder(),
              child: CircleAvatar(
                radius: 40.0,
                
                backgroundImage: AssetImage("images/logo.png",),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class About_us_card extends StatelessWidget {
  About_us_card({this.icon, this.txt});
  IconData icon;
  String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.blue.shade800,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          txt,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        ),
        onTap: ()async {
          if (icon == Icons.contact_phone) {
            Route route = MaterialPageRoute(builder: (context) => Contact());
            Navigator.push(context, route);
          }
          if (icon == Icons.question_answer) {
            Route route =
            MaterialPageRoute(builder: (context) => Aboutus_Inner());
            Navigator.push(context, route);
          }
          if (icon == Icons.highlight_off) {
            // clearing shared prefrenses data
            Route route =
            MaterialPageRoute(builder: (context) => LoginPage());
            Navigator.pushReplacement(context, route);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('email');
              print("hellow world");

           //signout
          }
        },
      ),
    );
  }
}
