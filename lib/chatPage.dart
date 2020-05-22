import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPageMain extends StatefulWidget {
  ChatPageMain({Key key, this.title}) : super(key: key);
  final int title;

  @override
  _ChatPageMainState createState() => _ChatPageMainState();
}

class _ChatPageMainState extends State<ChatPageMain> {
  @override
  Widget build(BuildContext context) {
    final ScreenWidth = MediaQuery.of(context).size.width;

    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    double px = 1 / pixelRatio;

    BubbleStyle styleSomebody = BubbleStyle(
      nip: BubbleNip.leftTop,
      color: Colors.white,
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, right: 50.0),
      alignment: Alignment.topLeft,
    );
    BubbleStyle styleMe = BubbleStyle(
      nip: BubbleNip.rightTop,
      color: Color.fromARGB(255, 225, 255, 199),
      elevation: 1 * px,
      margin: BubbleEdges.only(top: 8.0, left: 50.0),
      alignment: Alignment.topRight,
    );

    TextEditingController NewMessageTEC = new TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: Text('${widget.title.toString()}'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                color: Colors.yellow.withAlpha(64),
                child: ListView(
                  padding: EdgeInsets.all(8.0),
                  children: [
                    Bubble(
                      alignment: Alignment.center,
                      color: Color.fromARGB(255, 212, 234, 244),
                      elevation: 1 * px,
                      margin: BubbleEdges.only(top: 8.0),
                      child: Text('TODAY', style: TextStyle(fontSize: 10)),
                    ),
                    Bubble(
                      style: styleSomebody,
                      child: Text(
                          'Hi Jason. Sorry to bother you. I have a queston for you.'),
                    ),
                    Bubble(
                      style: styleMe,
                      child: Text('Whats\'up?'),
                    ),
                    Bubble(
                      style: styleSomebody,
                      child:
                          Text('I\'ve been having a problem with my computer.'),
                    ),
                    Bubble(
                      style: styleSomebody,
                      margin: BubbleEdges.only(top: 2.0),
                      nip: BubbleNip.no,
                      child: Text('Can you help me?'),
                    ),
                    Bubble(
                      style: styleMe,
                      child: Text('Ok'),
                    ),
                    Bubble(
                      style: styleMe,
                      nip: BubbleNip.no,
                      margin: BubbleEdges.only(top: 2.0),
                      child: Text('What\'s the problem?'),
                    ),
                  ],
                ),
              ),
            ),


            Container(
              color: Colors.yellow.withAlpha(64),
              child: Row(
                children: <Widget>[
                  Container(
                    width: (ScreenWidth / 9) * 5,
                    margin: EdgeInsets.only(
                        right: ScreenWidth / 50,
                        left: ScreenWidth / 30,
                        bottom: 10),
                    child: TextField(
                      controller: NewMessageTEC,
                      maxLines: 1,
                      maxLengthEnforced: true,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'Type something',
                        filled: true,
                        fillColor: Color(0xFFDBEDFF),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: (ScreenWidth / 8) * 1,
                    margin: EdgeInsets.only(bottom: 10,),
                    child: (IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send,size: 30,),
                      color: Colors.cyan,
                    )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
