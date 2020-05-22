import 'package:flutter/material.dart';
import 'chatPage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'eventDetail.dart';

class activeEventsMain extends StatefulWidget {
  @override
  eventsMainState createState() => eventsMainState();
}

class eventsMainState extends State<activeEventsMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(250, 51, 102, 153),
        automaticallyImplyLeading: false,
        title: Text('Etkinliklerim'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
                child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                GestureDetector(
                  child: returnEtkinlik(),
                ),
                GestureDetector(
                  child: returnEtkinlik(),
                ),
                GestureDetector(
                  child: returnEtkinlik(),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }

  TextStyle getJoinText(String val) {
    if (val == "DÜZENLEYEN")
      return TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 20);
    else
      return TextStyle(
          color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 20);
  }

  GestureDetector returnEtkinlik() {
    return GestureDetector(
      onTap: () {
        return (showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(20.0))),
                backgroundColor: Colors.white70 ,

                  child: eventDetailMain());
            }));
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 6,
        margin: EdgeInsets.only(right: 6, top: 6, left: 6, bottom: 2),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: new BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.lightGreen),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(
                Icons.accessibility_new,
                color: Colors.lightBlue,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Text(
                        '02/32/2332',
                        style: TextStyle(fontSize: 18, color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(children: <Widget>[
                Expanded(
                  child: Container(
                      child: Text('Merhaba pa1damsmksam',
                          overflow: TextOverflow.fade)),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
