
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:docme/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class AuthService {
  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Myapp();
          } else {
            return LoginPage();
          }
        });
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //SignIn
  signIn(AuthCredential authCreds, BuildContext context) {
    FirebaseAuth.instance.signInWithCredential(authCreds).then((AuthResult result)async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email',"_email.text.toString().trim()" );
    Navigator.pushReplacement(context , MaterialPageRoute(builder: (context) { return myapp();}));
        
    } ).catchError((e){
        print(e);
    });                  
    
  }

  signInWithOTP(smsCode,verId ,BuildContext context) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    
    signIn(authCreds,context);
  }
}
