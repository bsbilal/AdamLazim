
import 'package:flutter/material.dart';

class requestDetailMain extends StatefulWidget {
  @override
  _requestDetailMainState createState() => _requestDetailMainState();
}

class _requestDetailMainState extends State<requestDetailMain> {
  @override
  Widget build(BuildContext context) {
    double dialogKenarlik = MediaQuery.of(context).size.width / 8;


    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height / 1.8,
        width: MediaQuery.of(context).size.width ,
        child: Dialog(
          elevation: 20,
          backgroundColor: Colors.white70,
          shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(20.0))),
          child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0)),

              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width / 2,
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ClipOval(
                        child: Image.network(
                          'https://i.picsum.photos/id/10/2500/1667.jpg',
                          height: 75,
                          width: 75,
                          fit: BoxFit.cover,
                        )),
                    Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.purple)),
                        color: Colors.white,
                        onPressed: () {},
                        child: Text(
                          'MEHMET TAKICI text',
                          style: TextStyle(
                              fontSize: 20, color: Colors.purple),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: SingleChildScrollView(
                        child: TextField(
                          readOnly: true,

                          decoration: new InputDecoration(
                              hintText: 'dfsölfşadsölfdösalşfölsdşflşasdöflşasdölşfasşlöfölşdsfaşlöfdaşlösafdslşödfaslöşfdlşöadsfölşdfasşlödflşöafdslşöfsalşöafdlşösdfalöşfdalşö',
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                  borderRadius:
                                  new BorderRadius.circular(
                                      25.0),
                                  borderSide: new BorderSide())),
                          maxLines: 4,

                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Align(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.only(
                                    bottomRight: Radius.circular(
                                        dialogKenarlik),
                                    bottomLeft: Radius.circular(
                                        dialogKenarlik),
                                  ),
                                ),
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    3,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            9.0),
                                        side: BorderSide(
                                            color: Colors.white)),
                                    color: Colors.redAccent,
                                    child: Text(
                                      'Reddet',
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                    onPressed: () {

                                    }),
                              )),
                        ),
                        Expanded(
                          child: Align(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.only(
                                    bottomRight: Radius.circular(
                                        dialogKenarlik),
                                    bottomLeft: Radius.circular(
                                        dialogKenarlik),
                                  ),
                                ),
                                width: MediaQuery.of(context)
                                    .size
                                    .width /
                                    3,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(
                                            9.0),
                                        side: BorderSide(
                                            color: Colors.white)),
                                    color: Colors.green,
                                    child: Text(
                                      'Kabul et',
                                      style: TextStyle(
                                          color: Colors.white),
                                    ),
                                    onPressed: () {

                                    }),
                              )),
                        ),


                      ],


                    )
                  ],
                ),
              )),

        ),
      ),
    );
  }
}
