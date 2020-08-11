import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'page_model.dart';
import 'package:docme/login/login.dart';

import 'fancy_on_boarding.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //Add Route to the main Page.
      routes: {'/login': (context) => LoginPage()},
      title: 'Fancy OnBoarding Demo',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Nunito'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Create a list of PageModel to be set on the onBoarding Screens.
  final pageList = [
    PageModel(
        color: Colors.blue.shade800.withOpacity(0.8),
        heroAssetPath: 'images/on1.png',
        title: Text('Doctors',//Hotels
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white70,
              fontSize: 34.0,
            )),
        body: Text('Most of doctors in Algeria are  here for you ',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
            )),
        iconAssetPath: 'images/png/key.png'),
    PageModel(
        color: Color(0xff17DaaF).withOpacity(0.6),
        heroAssetPath: 'images/on2.png',
        title: Text('Specialties',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white70,
              fontSize: 34.0,
            )),
        body: Text(
            'We carefully verify all specialities before adding them into the app',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18.0,
            )),
        iconAssetPath: 'images/png/wallet.png'),
    PageModel(
      color: Colors.blueGrey.shade400.withOpacity(0.8),
      heroAssetPath: 'images/on3.png',
      title: Text('States',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white70,
            fontSize: 34.0,
          )),
      body: Text('All  states of our country are here in our app for you',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18.0,
          )),
      iconAssetPath: 'images/png/shopping_cart.png',
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/login'),
        onSkipButtonPressed: () =>
            Navigator.of(context).pushReplacementNamed('/login'),
      ),
    );
  }
}