import 'package:adam_lazim_v03/login.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';


class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}


class _IntroPageState extends State<IntroPage> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Yalnız mısın?",
        description: "Bir şeyler mi yapalım diyorsun ?",
        pathImage: "assets/ball.gif",
        backgroundColor: Colors.teal,
      ),
    );
    slides.add(
      new Slide(
        title: "Birisi mi lazım?",
        description: "Tek başına keyfi çıkmıyor mu ?",
        pathImage: "assets/dive.gif",
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      new Slide(
        title: "Adam Lazım",
        description:
        "Uygulamana hoş geldin !",
        pathImage: "assets/photo3.gif",
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginMain()),
    );  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}