import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class userCommentsMain extends StatefulWidget {
  @override
  _userCommentsMainState createState() => _userCommentsMainState();
}

class _userCommentsMainState extends State<userCommentsMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width / 1.35,
                  height: 50,
                  color: Colors.teal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Yorumlarım',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )
                    ],
                  ),
                )),
            Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      GestureDetector(
                        onTap: () {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50.0))),
                                    child: commentDetail());
                              });
                        },
                        child: Container(
                            child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                                child: ClipOval(
                              child: Image.network(
                                'https://i.picsum.photos/id/10/2500/1667.jpg',
                                height: 40,
                                width: 40,
                                fit: BoxFit.cover,
                              ),
                            )),
                            Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      left: 4, bottom: 10, top: 8),
                                  child: Text(
                                    'KAPKACAK2912',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  padding: EdgeInsets.only(right: 8),
                                  child: Text('20/10/2020'),
                                )
                              ],
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Container(
                                    width: 100,
                                    child: TextField(
                                      readOnly: true,
                                      onTap: () {
                                        return showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Dialog(
                                                  child: commentDetail());
                                            });
                                      },
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText:
                                              'Lorem ipsum dolor sit amet, quo tantas constituam'),
                                    )),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Text('3/5'))
                          ],
                        )),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                children: <Widget>[],
                              ),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.stars),
                        title: Text('Mesajlarım3'),
                      ),
                      ListTile(
                        leading: Icon(Icons.stars),
                        title: Text('Mesajlarım3'),
                      ),
                      ListTile(
                        leading: Icon(Icons.stars),
                        title: Text('Mesajlarım3'),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }

  Widget commentDetail() {
    return Container(
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                child: ClipOval(
              child: Image.network(
                'https://i.picsum.photos/id/10/2500/1667.jpg',
                height: 75,
                width: 75,
                fit: BoxFit.cover,
              ),
            )),
            Container(
              child: Text('Mfkafdmskflsad'),
            ),
            Container(
              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: TextField(
                enabled: false,
                decoration: new InputDecoration(
                    labelText: "Üye Yorumu",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide())),
                maxLines: 2,
                maxLength: 128,
                maxLengthEnforced: true,
              ),
            ),
          ],
        ));
  }
}
