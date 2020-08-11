import 'package:flutter/material.dart';
import 'about_us.dart';

class Aboutus_Inner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text("About Us",
          style: TextStyle(color: Colors.white,fontSize: 18),
        ),
        leading:  FlatButton(
          onPressed: (){
            Route route = MaterialPageRoute(builder: (context)=>About_us());
            Navigator.pop(context,route);
          },
          child: Icon(Icons.arrow_back,color: Colors.white,size: 30,),
        ),
      ),
      body: Container(
        height: 800,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("images/bg.png"),fit: BoxFit.contain),
          color: Colors.grey.shade200,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 7),
          margin: EdgeInsets.only(top: 00,left: 22,right: 22,bottom: 0),
          height: 400,
          width: 600,
          decoration: BoxDecoration(
            color: Colors.white70.withOpacity(0.9),
          ),
          child: ListView(
            children: <Widget>[
              new Text2(str: "this app , the best offline medical app",),
              SizedBox(height: 12,),
              new Text3(
                str: "this app is a result of years of extensive hard work and labor "
                    ".a group of enterprise full of enthuasiam and ict medical field"
                    " expusre standbehind its strong .,"
                    "this app is a result of years of extensive hard work and labor "
                    ".a group of enterprise full of enthuasiam and ict medical field"
                    " expusre standbehind its strong .\n  \n"),
              SizedBox(height: 14,),
              new Text2(str: "this app , the best offline medical app",),
              SizedBox(height: 12,),
              new Text3(
                  str: "this app is a result of years of extensive hard work and labor "
                      ".a group of enterprise full of enthuasiam and ict medical field"
                      " expusre standbehind its strong .,"
                      "this app is a result of years of extensive hard work and labor "
                      ".a group of enterprise full of enthuasiam and ict medical field"
                      " expusre standbehind its strong .\n  \n"),
              SizedBox(height: 14,),
              new Text2(str: "this app , the best offline medical app",),
              SizedBox(height: 12,),
              new Text3(
                  str: "this app is a result of years of extensive hard work and labor "
                      ".a group of enterprise full of enthuasiam and ict medical field"
                      " expusre standbehind its strong .,"
                      "this app is a result of years of extensive hard work and labor "
                      ".a group of enterprise full of enthuasiam and ict medical field"
                      " expusre standbehind its strong .\n  \n"),
              SizedBox(height: 14,),
            ],
          ),
        ),
      ),
    );
  }
}

class Text3 extends StatelessWidget {
  Text3({this.str});
  String str;
  @override
  Widget build(BuildContext context) {
    return Text(str,
    textAlign: TextAlign.left,
    style: TextStyle(
      color: Colors.grey,
      fontSize: 16,
    ),);
  }
}

class Text2 extends StatelessWidget {
  String str;
  Text2({this.str});

  @override
  Widget build(BuildContext context) {
    return Text(str,
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.blueGrey,
    fontSize: 24,
    ),
    );
  }
}
