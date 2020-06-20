import 'package:flutter/material.dart';
import 'contact_us.dart';
import 'FAQ.dart';
import 'about_inner_page.dart';

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
                        color: Color(0xff5097a4),
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
                    txt: " About Us  ",
                    icon: Icons.info,
                  ),
                  new About_us_card(
                    txt: " FAQ  ",
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
                Text(
                  "FTW Team",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                    "           Mouslim | Mohamed | Zakria*2 | Hamza           "),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  height: 40.0,
                  margin: EdgeInsets.only(left: 2, right: 2),
                  child: Text(
                    "      here ,you will obtain  more informatoin,\n  "
                    "just click and see other information:                                                                            ",
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
                
                backgroundImage: AssetImage("images/loho.png",),
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
        color: Color(0xff5097a4),
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
        onTap: () {
          if (icon == Icons.contact_phone) {
            Route route = MaterialPageRoute(builder: (context) => Contact());
            Navigator.push(context, route);
          }
          if (icon == Icons.question_answer) {
            Route route = MaterialPageRoute(
                builder: (context) => FoldingCellSimpleDemo());
            Navigator.push(context, route);
          }
          if (icon == Icons.info) {
            Route route =
                MaterialPageRoute(builder: (context) => Aboutus_Inner());
            Navigator.push(context, route);
          }
        },
      ),
    );
  }
}
