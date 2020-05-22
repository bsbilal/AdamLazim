import 'package:flutter/material.dart';

class eventDetailMain extends StatefulWidget {
  @override
  _eventDetailMainState createState() => _eventDetailMainState();
}

class _eventDetailMainState extends State<eventDetailMain> {
  @override
  Widget build(BuildContext context) {
    double dialogKenarlik = MediaQuery.of(context).size.width / 8;
    return   Container(
        margin: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(150 , 153, 51, 102),
                borderRadius: const BorderRadius.all(Radius.circular(20)
                ),
              ),
              margin: EdgeInsets.only(right: 2,left: 2,bottom: 10,),
              height:  MediaQuery.of(context)
                  .size
                  .height/15,
              width: MediaQuery.of(context)
        .size
        .width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Center text',
                    style: TextStyle(color: Colors.white,fontSize: 22),
                  )
                ],
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(20)
                ),
                border: Border.all(color: Colors.white),


              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 4),
                      child: Text('Tarih',style: TextStyle(fontWeight: FontWeight.bold,color:  _getLabelColors(),fontSize: 18,fontStyle: FontStyle.italic),),


                    ),


                  ),
                  Expanded(
                    child: Container(
                      child: Text('20/12/2020'),


                    ),


                  )

                ],
              ),),

            Container(
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.all(Radius.circular(20)
                ),
                border: Border.all(color: Colors.white),


              ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Text('Düzenleyen',style: TextStyle(fontWeight:FontWeight.bold,color:  _getLabelColors(),fontSize: 18,fontStyle: FontStyle.italic),),


                      ),


                    ),
                    Expanded(
                      child: Container(
                        child: Text('Ahmsxsdd dasdsadsa'),


                      ),


                    )

                  ],
        ),),
            Container(
              child: Text('Adres',style: TextStyle(color: _getLabelColors(),fontSize: 20),),
            ),
            Container(

              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: SingleChildScrollView(
                child: TextField(
                  readOnly: true,
                  decoration: new InputDecoration(
hintText:  "1234567890112345689101234567890  max 50 length",

                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide())),
                  maxLines: 2
                ),
              ),
            ),
            Container(
              child: Text('Etkinlik Detayı',style: TextStyle(color: _getLabelColors(),fontSize: 20),),
            ),
            Container(

              decoration: BoxDecoration(),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: SingleChildScrollView(
                child: TextField(
                  readOnly: true,
                  decoration: new InputDecoration(
                      hintText:  " max 100 lengt",

                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
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
                              'İptal Et',
                              style: TextStyle(
                                  color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {

                            }),
                      )),
                ),
              ],


            )

          ],
        ));

  }

  Color _getLabelColors()
  {
    return Color.fromARGB(250, 51, 102, 153);

  }
}
