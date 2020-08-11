import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authservice.dart';

class Phonevirifie extends StatefulWidget {
  @override
  _PhonevirifieState createState() => _PhonevirifieState();
}

class _PhonevirifieState extends State<Phonevirifie> {
  final formKey = new GlobalKey<FormState>();

  String phoneNo, verificationId, smsCode;

  bool codeSent = false;

  String textSW() {
    String text;
    setState(() {
      codeSent
          ? text =
              "We sent a 6-digit code to your mobile number  . Enter that code to end the registration "
          : text = "Enter your phone number to continue the proccess ";
    });
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: formKey,
          child: SingleChildScrollView(
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 10,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "images/logo.png",
                          width: 55,
                          height: 55,
                        ),
                        SizedBox(width :20.0),
                        Text(" Doc it",
                            style: TextStyle(
                                fontSize: 25,
                                letterSpacing: .6,
                                fontWeight: FontWeight.bold)),
                        
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter: ColorFilter.srgbToLinearGamma(),
                        image: AssetImage("images/verify.png"),
                        fit: BoxFit.fill),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90)),
                      
                  ),
                  alignment: Alignment.topLeft,
                  
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    textSW(),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintText: 'Enter phone number',
                          icon: Icon(
                            Icons.phone,
                            color: Colors.grey,
                          )),
                      onChanged: (val) {
                        setState(() {
                          this.phoneNo = val;
                        });
                      },
                    )),
                codeSent
                    ? Padding(
                        padding: EdgeInsets.only(left: 25.0, right: 25.0),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              hintText: 'Enter OTP',
                              icon: Icon(
                                Icons.sms_failed,
                                color: Colors.grey,
                              )),
                          onChanged: (val) {
                            setState(() {
                              this.smsCode = val;
                            });
                          },
                        ))
                    : Container(),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: RaisedButton(
                        child: Center(
                            child: codeSent ? Text('Login') : Text('Verify')),
                        onPressed: () {
                          codeSent
                              ? AuthService()
                                  .signInWithOTP(smsCode, verificationId)
                              : verifyPhone(phoneNo);
                        }))
              ],
            ),
          )),
    );
  }

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}
