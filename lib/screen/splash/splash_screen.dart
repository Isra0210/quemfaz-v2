import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:quemfaz/screen/Home/home_settings_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 150,
      duration: 2000,
      splash: Container(
        alignment: Alignment.center,
        child: Container(
          height: 150,
          child: Image.asset("assets/new-logo.png", height: 150.0),
        ),
      ),
      nextScreen: HomeSettingScreen(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
