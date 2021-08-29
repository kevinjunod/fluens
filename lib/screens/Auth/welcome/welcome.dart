import 'package:flutter/material.dart';
// import 'package:influencrot_flutter/constants.dart';
import 'package:influencrot_flutter/screens/Auth/login/login.dart';
import 'package:splashscreen/splashscreen.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage();
  @override
  _WelcomePageState createState() => new _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Future<Widget> loadFromFuture() async {
    return Future.value(
      new Login(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new Login(),
      title: new Text(
        'Fluens.id',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),
      ),
      image: new Image.asset(
        'assets/images/fluens.jpeg',
      ),
      backgroundColor: Color(0xffFEB612),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      useLoader: false,
    );
  }
}
