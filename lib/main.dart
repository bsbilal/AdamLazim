import 'package:flutter/material.dart';
import 'Intro.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adam Lazım',
        theme: ThemeData(fontFamily: 'Poppins'),
      home: IntroPage(),
        debugShowCheckedModeBanner: false
    );
  }
}
