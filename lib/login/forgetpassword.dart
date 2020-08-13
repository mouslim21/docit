import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login.dart';



class ForgotPassword extends StatefulWidget {
  static String tag = "reset-password";
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();

  final databaseReference = Firestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  String email;
  bool loading = false;

  resetPassword() async {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      return;
    } else {
      form.save();
      setState(() {
        loading = true;
      });
      if (email.isNotEmpty) {
        try {
          FirebaseUser user = await auth
              .sendPasswordResetEmail(
            email: email,
          )
              .then((userNew) {
            return null;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LoginPage(),
              ),
                  (Route<dynamic> route) => false);
        } catch (e) {
          print('vvvvvvv $e');
        }
      }
      setState(() {
        loading = false;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    SizedBox(height: 15),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            colorFilter: ColorFilter.srgbToLinearGamma(),
                            image: AssetImage("images/auth.png"),
                            fit: BoxFit.fill),
                        borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90)),
                      ),
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: 25,
                            ),
                            Image.asset(
                              "images/logo.png",
                              width: 55,
                              height: 55,
                            ),
                            Text(" Doc it",
                                style: TextStyle(
                                    fontSize: 25,
                                    letterSpacing: .6,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 20,left:30),
                      child: Container(
                        child: Text(
                          "Pour réinitialiser votre mot de passe, entrez votre e-mail  \n ",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.82,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 45,
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(50)),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.grey,
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 5)
                                ]),
                            child: TextField(
                              onChanged:(_email) {
                                setState(() {
                                  email=_email;
                                });
                              },
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,

                              controller: _email,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.email,
                                  color: Colors.grey,
                                ),
                                hintText: 'Email',
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await resetPassword();
                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width / 1.2,
                              margin: EdgeInsets.only(top: 16),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue[900],
                                      Colors.blue[800]
                                    ],
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                              child: Center(
                                child: Text(
                                  'Envoyer'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),


                    ),
                  ]),
                ))));
  }
}



//import 'package:flutter/material.dart';
//import 'package:projet2cp/style/TextStyle.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:projet2cp/style/round-button.dart';
//
//import 'login.dart';
//
//class ForgotPassword extends StatefulWidget {
//  static String tag = "reset-password";
//  @override
//  _ForgotPasswordState createState() => _ForgotPasswordState();
//}
//
//class _ForgotPasswordState extends State<ForgotPassword> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  final TextEditingController _passwordTextController = TextEditingController();
//
//  FocusNode _focusNode;
//
//  @override
//  void dispose() {
//    super.dispose();
//    _focusNode.dispose();
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    _focusNode = new FocusNode();
//    _focusNode.addListener(_onOnFocusNodeEvent);
//  }
//
//  _onOnFocusNodeEvent() {
//    setState(() {
//      // Re-renders
//    });
//  }
//
//  Color _getBorderColor() {
//    return _focusNode.hasFocus ? primaryDark : border;
//  }
//
//
//  final databaseReference = Firestore.instance;
//  final FirebaseAuth auth = FirebaseAuth.instance;
//
//  String email;
//  bool loading = false;
//
//  resetPassword() async {
//    final FormState form = _formKey.currentState;
//    if (!form.validate()) {
//      return;
//    } else {
//      form.save();
//      setState(() {
//        loading = true;
//      });
//      if (email.isNotEmpty) {
//        try{
//          FirebaseUser user = await auth
//              .sendPasswordResetEmail(email:email,)
//              .then((userNew) {
//            return null;
//          });
//          Navigator.pushAndRemoveUntil(
//              context,
//              MaterialPageRoute(
//                builder: (BuildContext context) => login(),
//              ),
//                  (Route<dynamic> route) => false);
//        }catch(e){
//          print('vvvvvvv $e');
//        }
//      }
//      setState(() {
//        loading = false;
//      });
//      return;
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    Widget emailForm = Container(
//      margin: EdgeInsets.only(bottom: 18.0),
//      child: Row(
//        children: <Widget>[
//          Image.asset("images/user-grey.png", height: 16.0, width: 16.0,),
//          Container(
//            width: screenWidth(context)*0.7,
//            child: TextFormField(
//              style: subtitlePrimaryTextAR(),
//              cursorColor: primaryDark, cursorRadius: Radius.circular(1.0), cursorWidth: 1.0,
//              keyboardType: TextInputType.emailAddress,
//              onSaved: (String value) => email = value,
//              validator: (String value) {
//                if(value.isEmpty)
//                  return 'Please Enter Your Email Id';
//                else
//                  return null;
//              },
//              decoration: InputDecoration(
//                contentPadding: EdgeInsets.only(left: 10.0, right: 0.0, top: 10.0, bottom: 12.0),
//                border: OutlineInputBorder(
//                    borderSide: BorderSide.none
//                ),
//                hintText: "Email Id",
//                hintStyle: subTitleBlackTextAR(),
//              ),
//              focusNode: _focusNode,
//            ),
//          ),
//        ],
//      ),
//      decoration: new BoxDecoration(
//        border: new Border(
//          bottom: BorderSide(color: _getBorderColor(), style: BorderStyle.solid, width: 2.0),
//        ),
//      ),
//    );
//
//    return Scaffold(
//      body: GestureDetector(
//        onTap: () {
//          FocusScope.of(context).requestFocus(new FocusNode());
//        },
//        child: Form(
//          key: _formKey,
//          child: Container(
//            alignment: AlignmentDirectional.center,
//            margin: EdgeInsets.only(top: 50.0),
//            child: ListView(
//              padding: const EdgeInsets.all(16.0),
//              shrinkWrap: true,
//              physics: ScrollPhysics(),
//              children: <Widget>[
//                Image.asset("images/forget password3.png", width: 200.0, height: 180.0, fit: BoxFit.contain,),
//                Container(
//                  alignment: AlignmentDirectional.center,
//                  padding: const EdgeInsets.only(top: 20.0, bottom: 12.0),
//                  child: Text("Forgot Password", style: titleBlackTextAB(),),
//                ),
//                Container(
//                  alignment: AlignmentDirectional.center,
//                  padding: EdgeInsets.symmetric(horizontal: 24.0),
//                  child: Text("Enter Your Email Adresse  \n",
//                    style: subTitleLightBlackTextAR(), textAlign: TextAlign.center,
//                  ),
//
//                ),
//
//
//                Container(
//                  alignment: AlignmentDirectional.topStart,
//                  padding: EdgeInsets.only(left: 16.0, top: 28.0, bottom: 4.0, right: 16.0),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Text("Email", style:TextStyle(color: Colors.blueGrey.shade600,fontSize: 16),),
//                      emailForm,
//                    ],
//                  ),
//                ),
//                RawMaterialButton(
//                  padding: EdgeInsets.symmetric(vertical: 16.0),
//                  onPressed: () async {
//                    await resetPassword();
//                  },
//                  child: RoundButton(title: "SEND", color1: Color(0xff5097a4), color2: Color(0xff5097a4),),
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
