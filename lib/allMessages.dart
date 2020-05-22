import 'package:flutter/material.dart';
import 'chatPage.dart';

class MessagesMain extends StatefulWidget {
  @override
  _MessagesMainState createState() => _MessagesMainState();
}

class _MessagesMainState extends State<MessagesMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Mesajlarım'),
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
                  onTap: () {
                    return (showDialog(

                        context: context,
                        builder: (context) {
                          return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),

                              child: ChatPageMain(title: 3));
                        }));
                  },
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Mesajlarım1'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Mesajlarım2'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Mesajlarım3'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Mesajlarım3'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Mesajlarım3'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Mesajlarım3'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Mesajlarım3'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Mesajlarım3'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Mesajlarım3'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Mesajlarım3'),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Mesajlarım3'),
                  ),
                ),
              ],
            )),
          ),
          Container(
              child: Column(
            children: <Widget>[
              Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: TextField(
                    enabled: false,
                    maxLines: 4,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText:
                          'Mesajlaşma etkinlik saatinden 15 dakika sonraya kadar yapılabilir.'
                          ' Mesajlar etkinlik saatinden 120 dakika sonra arşivlenir.',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ))
            ],
          ))
        ],
      ),
    );
  }
}
