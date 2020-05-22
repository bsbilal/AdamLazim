import 'package:flutter/material.dart';

class myEventsMain extends StatefulWidget {
  @override
  _myEventsMainState createState() => _myEventsMainState();
}

class _myEventsMainState extends State<myEventsMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        title: Text('Aktif Etkinliklerim'),
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

                    GestureDetector(child: returnEtkinlik(),),
                    GestureDetector(child: returnEtkinlik(),),
                    GestureDetector(child: returnEtkinlik(),)

                  ],
                )),
          ),
        ],
      ),
    );
  }

  GestureDetector returnEtkinlik(){
    return GestureDetector(
        onTap: () {
          return (showDialog(
              context: context,
              builder: (context) {
                return Dialog();
              }));
        },
        child: Container(
          height: MediaQuery.of(context).size.width / 6,
          margin: EdgeInsets.only(right: 6,top: 6,left: 6,bottom: 2 ),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: new BorderRadius.all(Radius.circular(20)
            ),
            border: Border.all(color: Colors.lightGreen),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.accessibility_new,color: Colors.lightBlue  ,),
                  Container(
                    margin: EdgeInsets.only(right: 20)
                    ,child: Text('02/32/2332',style: TextStyle(fontSize: 18,color: Colors.teal),),
                  ),
                  Expanded(
                    child: Container(
                      child: Text('12345678901234',overflow: TextOverflow.ellipsis, ),
                    ),
                  )
                ],
              ),

            ],
          ),
        ));


  }
}
