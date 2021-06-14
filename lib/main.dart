import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quemfaz/screen/splash/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    );
    return MaterialApp(
      title: 'Quem Faz',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Color.fromRGBO(26, 26, 26, 1),
        backgroundColor: Color.fromRGBO(32, 2, 64, 1),
        brightness: Brightness.light,
        accentColor: Color.fromRGBO(26, 26, 26, 1),
        primaryIconTheme: IconThemeData(color: Colors.white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Open Sans',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
