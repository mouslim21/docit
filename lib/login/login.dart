//
//import 'package:flutter/material.dart';
//import 'package:projet2cp/login/singup.dart';
//
//import '../main.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//
//import 'first page.dart';
//
//
//class login extends StatefulWidget {
//  @override
//  _loginState createState() => _loginState();
//}
//
//class _loginState extends State<login> {
//
//  log(String email , String Password) async{
//    FirebaseAuth _auth = FirebaseAuth.instance;
//
//    try{
//      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: Password);
//      FirebaseUser user = result.user;
//
//      return user;
//    }catch(e){
//      print(e);
//      return null;
//    }
//  }
//  TextEditingController _email = TextEditingController();
//  TextEditingController _password = TextEditingController();
//  Color cursorcolor =  Colors.blueGrey.shade600;
//  Color hintcolor = Color(0xff5097a4);
//  @override
//  Widget build(BuildContext context) {
//
//
//    return Scaffold(
//      backgroundColor: Colors.white,
//
//      body: SingleChildScrollView(
//        child: Container(
//          height: MediaQuery.of(context).size.height,
//          width: MediaQuery.of(context).size.width,
import 'package:docme/login/singup.dart';
////          decoration: BoxDecoration(
////            image: DecorationImage(image: AssetImage("images/login.png"),fit:   BoxFit.fill ),
////          ),
//          child: Stack(
//            children: <Widget>[
//              Positioned(
//                top: 10,
//                child: Container(
//                  height: 250,
//                  width: MediaQuery.of(context).size.width,
//                  decoration: BoxDecoration(
//                    image: DecorationImage(image: AssetImage("images/login0.jpg"), fit: BoxFit.fill),
//                  ),
//                ),
//              ),
////              Positioned(
////                top: 60,
////                child: Container(
////                  height: MediaQuery.of(context).size.height,
////                  width: MediaQuery.of(context).size.width,
////                  decoration: BoxDecoration(
////                    image: DecorationImage(image: AssetImage("images/login1.jpg"), ),
////                  ),
////                ),
////              ),
//              Positioned(
//                top: MediaQuery.of(context).size.height/3+32,
//                left: 20,
//                right: 20,
//                child:  TextField(
//                  onChanged: (_email){
//                    setState(() {
//                      hintcolor = Color(0xff5097a4);
//                      cursorcolor = Colors.blueGrey.shade600;
//                    });
//                  },
//                  onTap: (){
//                    setState(() {
//                      hintcolor = Color(0xff5097a4);
//                      cursorcolor = Colors.blueGrey.shade600;
//                    });
//                  },
//                  keyboardType: TextInputType.emailAddress,
//                  cursorColor: cursorcolor ,
//                  controller: _email,
//                  decoration: InputDecoration(
//                    icon: Icon(Icons.email,color: Color(0xff5097a4),),
//                    //                    disabledBorder: OutlineInputBorder(
////                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
////                        borderSide: BorderSide(color: Color(0xff5097a4))),
////                    border: OutlineInputBorder(
////                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
////                        borderSide: BorderSide(color: Color(0xff5097a4))),
//                    labelText: "Email",
//                    labelStyle: TextStyle(color:hintcolor,fontSize: 16),
//
//                  ),
//                ),
//              ),
//              Positioned(
//                top: MediaQuery.of(context).size.height/3+92,
//                left: 20,
//                right: 20,
//                child:  TextField(
//                  onChanged: (_email){
//                    setState(() {
//                      hintcolor = Color(0xff5097a4);
//                      cursorcolor = Colors.blueGrey.shade600;
//                    });
//                  },
//                  onTap: (){
//                    setState(() {
//                      hintcolor = Color(0xff5097a4);
//                      cursorcolor = Colors.blueGrey.shade600;
//                    });
//                  },
//                  obscureText: true,
//                  cursorColor: cursorcolor ,
//                  controller: _password,
//                  decoration: InputDecoration(
//                    icon: Icon(Icons.lock,color: Color(0xff5097a4),),
////                    disabledBorder: OutlineInputBorder(
////                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
////                        borderSide: BorderSide(color: Colors.black)),
////                    border: OutlineInputBorder(
////                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
////                        borderSide: BorderSide(color: Colors.black)),
//                    labelText: "Password",
//                    labelStyle: TextStyle(color: hintcolor,fontSize: 16),
//
//                  ),
//                ),
//              ),
//              Positioned(
//                top: MediaQuery.of(context).size.height/3 +162,
//                left: 28,
//                right: 10,
//                child: Row(
//                  children: <Widget>[
//                    Text("Forget Password ?",style: TextStyle(color: Colors.blueGrey.shade400,fontSize: 20),),
//                    GestureDetector(
//                      onTap: () async{
//                        final email = _email.text.toString().trim();
//                        final password = _password.text.toString().trim();
//
//                        FirebaseUser user = await log(email , password);
//                        if(user != null){
//                          Navigator.push(context, MaterialPageRoute(builder: (context)  {
//                            return Myapp();
//                          }));
//                        }else{
//                          setState(() {
//                            print("pfffffff");
//                            hintcolor = Colors.red.shade400;
//                            cursorcolor = Colors.red.shade400;
//                          });
//                        }
//                      },
//                      child: Container(
//                        margin: EdgeInsets.only(top:8,left: 40),
//                        child: Text("Login",style: TextStyle(fontSize: 18,color: Colors.white),),
//                        padding:  EdgeInsets.only(left: 22,right: 24,top: 9,bottom: 9),
//                        decoration: BoxDecoration(
//                            color: Color(0xff5097a4),
//                            border: Border.all(color:Color(0xff5097a4),width: 1 ),
//                            borderRadius: BorderRadius.circular(40)
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//              Positioned(
//                top: MediaQuery.of(context).size.height/2 + 102,
//                left: MediaQuery.of(context).size.width/6,
//                right: MediaQuery.of(context).size.width/6,
//                child: Row(
//                  children: <Widget>[
//                    Container(width: 57,color: Colors.blueGrey.shade100,height: 2,),
//                    Container(child: Text("or connect with",style: TextStyle(color: Colors.blueGrey.shade700),),margin: EdgeInsets.symmetric(vertical: 8,horizontal: 14),),
//                    Container(width: 57,color: Colors.blueGrey.shade100,height: 2,),
//                  ],
//                ),
//              ),
//              Positioned(
//                top: MediaQuery.of(context).size.height/2 + 146,
//                left: MediaQuery.of(context).size.width/5+20,
//                right: MediaQuery.of(context).size.width/6,
//                child: Row(
//                  children: <Widget>[
//                    Container(
//                      margin: EdgeInsets.symmetric(horizontal: 8),
//                      height: 45,
//                      width: 45,
//                      decoration: BoxDecoration(
//                          image: DecorationImage(image: AssetImage("images/phone.png"),fit: BoxFit.fill)
//                      ),
//                    ),
//                    Container(
//                      margin: EdgeInsets.symmetric(horizontal: 6),
//                      height: 45,
//                      width: 45,
//                      decoration: BoxDecoration(
//                          image: DecorationImage(image: AssetImage("images/facebook.jpg"),)
//                      ),
//                    ),
//                    Container(
//                      margin: EdgeInsets.symmetric(horizontal: 8),
//                      height: 45,
//                      width: 45,
//                      decoration: BoxDecoration(
//                          image: DecorationImage(image: AssetImage("images/google.png",),)
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              Positioned(
//                top: MediaQuery.of(context).size.height-150,
//                left: MediaQuery.of(context).size.width-290,
//                child: GestureDetector(
//                  onTap: (){
//                    Navigator.push(context, SlideRightRoute( widget: signup()
//                    ));
//                  },
//                  child: Container(
//                    margin: EdgeInsets.only(top: 5,left: 2,right: 10,bottom: 15),
//                    padding:  EdgeInsets.only(left: 15,right: 8,top: 9,bottom: 9),
//                    decoration: BoxDecoration(
//                        color: Color(0xff5097a4),
//                        border: Border.all(color:Color(0xff5097a4),width: 1 ),
//                        borderRadius: BorderRadius.circular(40)
//                    ),
//                    child: Row(
//
//                      children: <Widget>[
//                        Text("      Sing Up       ",style: TextStyle(fontSize: 22,color: Colors.white),),
//                      ],
//                    ),
//                  ),
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class SlideRightRoute extends PageRouteBuilder {
//  final Widget widget;
//  SlideRightRoute({this.widget})
//      : super(
//      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
//        return widget;
//      },
//      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
//        return new SlideTransition(
//          position: new Tween<Offset>(
//            begin: const Offset(0.0, -1.0),
//            end: Offset.zero,
//          ).animate(animation),
//          child: child,
//        );
//      }
//  );
//}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:docme/login/singup.dart';

import '../main.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

//import 'first page.dart';
import 'forgetpassword.dart';


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
//
//  log(String email , String Password) async{
//    FirebaseAuth _auth = FirebaseAuth.instance;
//
//    try{
//      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: Password);
//      FirebaseUser user = result.user;
//
//      return user;
//    }catch(e){
//      print(e);
//      return null;
//    }
//  }
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  Color cursorcolor =  Colors.grey;
  Color hintcolor = Color(0xff2260bf);


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
//          decoration: BoxDecoration(
//            image: DecorationImage(image: AssetImage("images/login0.jpg"),fit:   BoxFit.fill ),
//          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 10,
                child: Container(
                  height: 280,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/login.png"), fit: BoxFit.fill),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/3+32,
                left: 20,
                right: 20,
                child:  TextField(
                  onChanged: (_email){
                    setState(() {
                      hintcolor = Color(0xff2260bf);
                      cursorcolor = Colors.grey.shade600;
                    });
                  },
                  onTap: (){
                    setState(() {
                      hintcolor = Color(0xff2260bf);
                      cursorcolor = Colors.blueGrey.shade600;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: cursorcolor ,
                  controller: _email,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email,color: Color(0xff2260bf),),
                    labelText: "Email",
                    //labelStyle: TextStyle(color:hintcolor,fontSize: 16),

                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/3+92,
                left: 20,
                right: 20,
                child:  TextField(
                  onChanged: (_email){
                    setState(() {
                      hintcolor = Color(0xff2260bf);
                      cursorcolor = Colors.blueGrey.shade600;
                    });
                  },
                  onTap: (){
                    setState(() {
                      hintcolor = Color(0xff2260bf);
                      cursorcolor = Colors.blueGrey.shade600;
                    });
                  },
                  obscureText: true,
                  cursorColor: cursorcolor ,
                  controller: _password,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock,color: Color(0xff2260bf),),
                    labelText: "Password",
                   // labelStyle: TextStyle(color: hintcolor,fontSize: 16),

                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/3 +162,
                left: 28,
                right: 10,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      padding:  EdgeInsets.only(left: 2,right: 30,top: 9,bottom: 9),
                      child: Row(
                        children:<Widget>[


                          FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0)),
                            color: Colors.white,

                            child:Text("Forget Password ?",style: TextStyle(color: Colors.blueGrey.shade400,fontSize: 14),),
                           /* onPressed: () {
                               Navigator.push(context, SlideRightRoute( widget: ForgotPassword()
                              )
                              );
                            },*/
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async{
                        final email = _email.text.toString().trim();
                        final password = _password.text.toString().trim();

                       /* FirebaseUser user = await log(email , password);
                        if(user != null){
                          Navigator.push(context, MaterialPageRoute(builder: (context)  {
                            return Myapp();
                          }));
                        }else{
                          setState(() {
                            print("Doesn't work ");
                            hintcolor = Colors.red.shade400;
                            cursorcolor = Colors.red.shade400;
                          });
                        }*/
                      },
                      child: Container(
                        margin: EdgeInsets.only(top:8,left: 10),
                        child: Text("Sign In",style: TextStyle(fontSize: 18,color: Color(0xff2260bf)),),
                        padding:  EdgeInsets.only(left: 22,right: 24,top: 9,bottom: 9),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color:Color(0xff2260bf),width: 1 ),
                            borderRadius: BorderRadius.circular(40)
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/2 + 114,
                left: MediaQuery.of(context).size.width/6,
                right: MediaQuery.of(context).size.width/6,
                child: Row(
                  children: <Widget>[
                    Container(width: 57,color: Colors.blueGrey.shade100,height: 2,),
                    Container(child: Text("or connect with",style: TextStyle(color: Colors.blueGrey.shade700),),margin: EdgeInsets.symmetric(vertical: 8,horizontal: 14),),
                    Container(width: 57,color: Colors.blueGrey.shade100,height: 2,),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height/2 + 151,
                left: MediaQuery.of(context).size.width/5+2,
                right: MediaQuery.of(context).size.width/6 -30,
                child:   Row(

                  children: <Widget>[
                    Expanded(
                      child: Container(

                        margin: EdgeInsets.symmetric(horizontal: 1),
                        padding:  EdgeInsets.only(left: 1,right: 34,top: 9,bottom: 9),
                        child: Row(
                          children:<Widget>[

                     Expanded(child: Container()),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                           // color: Color(0xff2260bf),
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                                //colorFilter:  ColorFilter.mode( Color(0xff2260bf), BlendMode.dstOut),
                              image: AssetImage(
                                "images/call.png",
                              //  fit: BoxFit.fill,
                              )
                            )
                          ),

                        ),
                      ),
                            Expanded(child: Container()),
                            Expanded(
                              flex: 2,
            child: Container(
              height: 61,
              width: 59,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage(
                        "images/goo.png",
                        //  fit: BoxFit.fill,
                      )
                  )
              ),

            ),
          ),
                            Expanded(child: Container()),
                          ],
                ),
                      ),
                    ),

                  ],
                )        ,

              ),
              Positioned(
                top: MediaQuery.of(context).size.height-130,
                left: MediaQuery.of(context).size.width-275,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, SlideRightRoute( widget: signup()
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 58,left: 92,right: 20,bottom: 5),
                    padding:  EdgeInsets.only(left: 15,right: 8,top: 9,bottom: 9),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color:Color(0xff2260bf),width: 1 ),
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: Row(

                      children: <Widget>[
                        Text("  Sing Up   ",style: TextStyle(fontSize: 22,color: Color(0xff2260bf)),),
                        Icon(Icons.arrow_downward,color: Color(0xff2260bf),)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget widget;
  SlideRightRoute({this.widget})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return new SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }
  );
}
