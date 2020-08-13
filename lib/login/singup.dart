import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../main.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  sign(String name, String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      UserUpdateInfo info = UserUpdateInfo();
      info.displayName = name;
      user.updateProfile(info);
      await user.sendEmailVerification();
      return true;
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          setState(() {
            bordemail = Colors.red[100];
            iconEmail = Colors.red[200];
            print("This compte existe ${e.code}");
          });
        }
      }
      setState(() {
        bordemail = Colors.red[100];
        iconEmail = Colors.red[200];
        print("This compte existe ${e.code}");
      });
      return false;
    }
  }

  String hinttext = "Enterz l'Email ";

  Color bordname = Colors.white;
  Color bordemail = Colors.white;
  Color bordercolorpw = Colors.white;

  Color iconName = Colors.grey;
  Color iconColorPw = Colors.grey;
  Color iconEmail = Colors.grey;

  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _password2 = TextEditingController();
  TextEditingController _email = TextEditingController();
  // void initState() {
  //   SystemChrome.setEnabledSystemUIOverlays([]);
  //   super.initState();

  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: ColorFilter.srgbToLinearGamma(),
                      image: AssetImage("images/signup.png"),
                      fit: BoxFit.fill),
                  borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(90)),
                ),
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "images/logo.png",
                            width: 55,
                            height: 55,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Bienvenue à Doc it",
                              style: TextStyle(
                                  fontSize: 25,
                                  letterSpacing: .6,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.95,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                            width: 2,
                            color: bordname,
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        onChanged: (_name) {
                          setState(() {
                            bordname = Colors.white;
                            iconName = Colors.grey;
                            bordemail = Colors.white;
                            iconEmail = Colors.grey;
                            bordercolorpw = Colors.white;
                            iconColorPw = Colors.grey;
                          });
                        },
                        onTap: () {
                          setState(() {
                            bordname = Colors.white;
                            iconName = Colors.grey;
                            bordemail = Colors.white;
                            iconEmail = Colors.grey;
                            bordercolorpw = Colors.white;
                            iconColorPw = Colors.grey;
                          });
                        },
                        cursorColor: iconName,
                        controller: _name,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            color: iconName,
                          ),
                          hintText: 'Saisissez votre nom ',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                            width: 2,
                            color: bordemail,
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        onChanged: (_email) {
                          setState(() {
                            bordname = Colors.white;
                            iconName = Colors.grey;
                            bordemail = Colors.white;
                            iconEmail = Colors.grey;
                            bordercolorpw = Colors.white;
                            iconColorPw = Colors.grey;
                          });
                        },
                        onTap: () {
                          setState(() {
                            bordname = Colors.white;
                            iconName = Colors.grey;
                            bordemail = Colors.white;
                            iconEmail = Colors.grey;
                            bordercolorpw = Colors.white;
                            iconColorPw = Colors.grey;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: iconEmail,
                        controller: _email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.email,
                            color: iconEmail,
                          ),
                          hintText: hinttext,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                            width: 2,
                            color: bordercolorpw,
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        onChanged: (_password) {
                          setState(() {
                            bordname = Colors.white;
                            iconName = Colors.grey;
                            bordemail = Colors.white;
                            iconEmail = Colors.grey;
                            bordercolorpw = Colors.white;
                            iconColorPw = Colors.grey;
                          });
                        },
                        onTap: () {
                          setState(() {
                            bordname = Colors.white;
                            iconName = Colors.grey;
                            bordemail = Colors.white;
                            iconEmail = Colors.grey;
                            bordercolorpw = Colors.white;
                            iconColorPw = Colors.grey;
                          });
                        },
                        cursorColor: bordercolorpw,
                        obscureText: true,
                        controller: _password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.vpn_key,
                            color: iconColorPw,
                          ),
                          hintText: 'Entrer le mot de passe',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 45,
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          border: Border.all(
                            width: 2,
                            color: bordercolorpw,
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 5)
                          ]),
                      child: TextField(
                        onChanged: (_password2) {
                          setState(() {
                            bordname = Colors.white;
                            iconName = Colors.grey;
                            bordemail = Colors.white;
                            iconEmail = Colors.grey;
                            bordercolorpw = Colors.white;
                            iconColorPw = Colors.grey;
                          });
                        },
                        onTap: () {
                          setState(() {
                            bordname = Colors.white;
                            iconName = Colors.grey;
                            bordemail = Colors.white;
                            iconEmail = Colors.grey;
                            bordercolorpw = Colors.white;
                            iconColorPw = Colors.grey;
                          });
                        },
                        obscureText: true,
                        cursorColor: bordercolorpw,
                        controller: _password2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.vpn_key,
                            color: iconColorPw,
                          ),
                          hintText: 'Confirmez le mot de passe',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, right: 32),
                          child: Text(
                            'Avez-vous un compte?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final email = _email.text.toString().trim();
                        final password = _password.text.toString().trim();
                        final password2 = _password2.text.toString().trim();
                        final name = _name.text.toString().trim();
                        bool result = false;
                        if (password == password2 &&
                            name.length > 3 &&
                            password.length > 7) {
                          result = await sign(name, email, password);
                        } else {
                          setState(() {
                            bordercolorpw = Colors.red[100];
                            iconColorPw = Colors.red[200];
                          });
                        }
                        if (name.length < 3) {
                          bordname = Colors.red[100];
                          iconName = Colors.red[200];
                        }
                        if (email == null || email == "") {
                          bordemail = Colors.red[100];
                          iconEmail = Colors.red[200];
                        }
                        if (result) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return Myapp();
                              }));
                        }

                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.blue[900], Colors.blue[800]],
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            'S\'insrire'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}








//import 'package:flutter/material.dart';
////import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/services.dart';
//import 'package:flare_flutter/flare_actor.dart';
//
//
//import '../main.dart';
//
//
//class signup extends StatefulWidget {
//  @override
//  _signupState createState() => _signupState();
//}
//
//class _signupState extends State<signup> {
//
//
//  /*sign(String name,String email,String password  ) async{
//    FirebaseAuth auth = FirebaseAuth.instance;
//    try{
//
//      AuthResult result = await auth.createUserWithEmailAndPassword(email: email, password: password);
//      FirebaseUser user = result.user;
//
//      UserUpdateInfo info = UserUpdateInfo();
//      info.displayName = name;
//      user.updateProfile(info);
//      await user.sendEmailVerification();
//      return true;
//    }catch(e){
//      if(e is PlatformException) {
//        if(e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
//          setState(() {
//            hintemail = Colors.red.shade600;
//            hintemail2 = Colors.red.shade600;
//            print("This compte existe $e");
//          });
//        }
//      };
//      return false;
//    }
//  }*/
//  String hinttext = "Enter Email ";
//  Color hintname  = Colors.grey;
//
//  Color hintemail = Colors.grey;
//  Color hintemail2 = Colors.grey;
//  Color hintpassword = Colors.grey;
//
//  String _searchText = null;
//  TextEditingController _name = TextEditingController();
//  TextEditingController _password = TextEditingController();
//
//
//  TextEditingController _email = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//      backgroundColor: Colors.white,
//
//      body: SingleChildScrollView(
//        child: Container(
//          child: Column(
//              children: <Widget>
//              [
//                Container(
//                  height: MediaQuery.of(context).size.height,
//                  width: MediaQuery.of(context).size.width,
//                  decoration: BoxDecoration(
//                    image: DecorationImage(image: AssetImage("images/signup.png"),fit:   BoxFit.fill,),
//                  ),
//                  child: Stack(
//                    children: <Widget>[
//                      Positioned(
//                        top: MediaQuery.of(context).size.height/3+60,
//                        left: 20,
//                        right: 20,
//                        child:  TextField(
//                          onChanged: (_name){
//                            setState(() {
//                              hintname = Color(0xff37c837);
//                              hintemail = Color(0xff37c837);
//                              hintpassword = Color(0xff37c837);
//
//                            });
//                          },
//                          onTap: (){
//                            setState(() {
//                              //hintname = Color(0xff5097a4);
//                              hintname = Color(0xff37c837);
//                              hintemail = Color(0xff37c837);
//                              hintpassword = Color(0xff37c837);                            });
//                          },
//                          cursorColor: hintname,
//                          controller: _name,
//                          decoration: InputDecoration(
//                            labelText: "Enter UserName",
//                            hintText: "Enter UserName",
//                            labelStyle: TextStyle(color: hintname),
//
//                          ),
//                        ),
//                      ),
//                      Positioned(
//                        top: MediaQuery.of(context).size.height/3+126,
//                        left: 20,
//                        right: 20,
//                        child:  TextField(
//                          onChanged: (_email){
//                            setState(() {
//                              hintname = Color(0xff37c837);
//                              hintemail = Color(0xff37c837);
//                              hintemail2 = Colors.grey;
//                              hintpassword = Color(0xff37c837);                            });
//                          },
//                          onTap: (){
//                            setState(() {
//                              hintname = Color(0xff37c837);
//                              hintemail = Color(0xff37c837);
//                              hintemail2 = Colors.grey;
//                              hintpassword = Color(0xff37c837);                            });
//                          },
//                          keyboardType: TextInputType.emailAddress,
//                          cursorColor: hintemail,
//                          controller: _email,
//                          decoration: InputDecoration(
//                            labelText: hinttext,
//                            labelStyle: TextStyle(color: hintemail),
//                            hintText: hinttext,
//                            hintStyle: TextStyle(color: hintemail2),
//
//
//                          ),
//                        ),
//                      ),
//
//                      Positioned(
//                        top: MediaQuery.of(context).size.height/3+186,
//                        left: 20,
//                        right: 20,
//                        child:  TextField(
//                          onChanged: (_password){
//                            setState(() {
//                              hintname = Color(0xff37c837);
//                              hintemail = Color(0xff37c837);
//                              hintpassword = Color(0xff37c837);                            });
//                          },
//                          onTap: (){
//                            setState(() {
//                              hintname = Color(0xff37c837);
//                              hintemail = Color(0xff37c837);
//                              hintpassword = Color(0xff37c837);                            });
//                          },
//                          cursorColor: hintpassword,
//                          obscureText: true,
//                          controller: _password,
//                          decoration: InputDecoration(
//                            labelText: "Enter Password",
//                            hintText: "Enter Password ",
//                            labelStyle: TextStyle(color: hintpassword),
//
//                          ),
//                        ),
//                      ),
//                      Positioned(
//                        top: MediaQuery.of(context).size.height/3+244,
//                        left: 20,
//                        right: 20,
//                        child:  TextField(
//                          onChanged: (_password2){
//                            setState(() {
//                              hintname = Color(0xff37c837);
//                              hintemail = Color(0xff37c837);
//                              hintpassword = Color(0xff37c837);                            });
//                          },
//                          onTap: (){
//                            setState(() {
//                              hintname = Color(0xff37c837);
//                              hintemail = Color(0xff37c837);
//                              hintpassword = Color(0xff37c837);                            });
//                          },
//                          obscureText: true,
//                          cursorColor: hintpassword,
//                          controller: _password,
//                          decoration: InputDecoration(
//                            labelText: "Confirm password...",
//                            labelStyle: TextStyle(color: hintpassword),
//                            hintText: "Confirm password... ",
//
//                          ),
//                        ),
//                      ),
//
//                      Positioned(
//                        top: MediaQuery.of(context).size.height-142,
//                        left: 28,
//                        right: 10,
//                        child: Row(
//                          children: <Widget>[
//                            InkWell(
//                                onTap: (){
//                                  Navigator.pop(context);
//                                },
//                                child: Text("Do you have an accounte?",style: TextStyle(color: Colors.blueGrey.shade400,fontSize: 16),)),
//                            GestureDetector(
//                              onTap: ()async{
//                                final email = _email.text.toString().trim();
//                                final password = _password.text.toString().trim();
//                                final password2 = _password.text.toString().trim();
//                                final name = _name.text.toString().trim();
////                                bool result =false;
////                                if(password == password2 && name.length > 3 && password.length >7   ){
////                                  result = await sign(name , email , password);
////                                }else{
////                                  setState(() {
////                                    hintpassword = Colors.red.shade600;
////                                  });
////                                }
////                                if(name.length < 3 ){
////                                  hintname = Colors.red.shade600;
////
////                                }
////                                if(email ==null || email ==""){
////                                  hintemail = Colors.red.shade600;
////
////                                }
//                                //if(result){
//                                  Navigator.push(context, MaterialPageRoute(builder: (context)  {
//                                    return flare();
//                                  }));
//                                //};
//                              },
//                              child: Container(
//                                margin: EdgeInsets.only(top: 8,left: 22),
//                                child: Text("Sign Up",style: TextStyle(fontSize: 18,color: Colors.white),),
//                                padding:  EdgeInsets.only(left: 22,right: 24,top: 9,bottom: 9),
//                                decoration: BoxDecoration(
//                                    color: Color(0xff00d4aa),
//                                    border: Border.all(color:Color(0xff00d4aa),width: 1 ),
//                                    borderRadius: BorderRadius.circular(40)
//                                ),
//                              ),
//                            )
//                          ],
//                        ),
//                      ),
//                    ],
//                  ),
//                ),]
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class flare extends StatefulWidget {
//
//  @override
//  _flareState createState() => _flareState();
//}
//
//class _flareState extends State<flare> {
//  bool _showAnimation = true;
//
//  @override
//  void initState() {
//    Future.delayed(Duration(seconds: 0), () {
//      setState(() {
//        _showAnimation = true;
//      });
//    });
//    Future.delayed(Duration(seconds: 3), () {
//      setState(() {
//        _showAnimation = false;
//      });
//    });
//    super.initState();
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    if(_showAnimation){
//      return  Scaffold(
//        backgroundColor: Colors.white,
//
//        body: Center(child: FlareActor("images/Success Check.flr", alignment:Alignment.center,
//          fit:BoxFit.contain,
//          animation: 'Untitled',
//          snapToEnd: false,
//
//        ),
//
//        ),
//      );
//    }
//    Navigator.push(context, MaterialPageRoute(builder: (context)=>Myapp()));
//    return Container(color: Colors.white,);
//  }}
