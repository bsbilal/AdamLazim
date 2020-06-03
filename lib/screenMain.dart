import 'dart:convert';

import 'package:adam_lazim_v03/projectConsts.dart';
import 'package:adam_lazim_v03/register.dart';
import 'package:adam_lazim_v03/requestDetail.dart';
import 'package:adam_lazim_v03/serverMethods.dart';
import 'package:adam_lazim_v03/showOldEvents.dart';
import 'package:adam_lazim_v03/userComments.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'activeEvents.dart';
import 'allMessages.dart';

class MainScreenWidget extends StatefulWidget {

  MainScreenWidget({Key key, this.userID}) : super(key: key);
  final int userID;

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int currentPage = 1;
  DateTime dtBeginSelected = new DateTime.now();
  GlobalKey bottomNavigationKey = GlobalKey();

  TextEditingController eventRequestTEC = new TextEditingController();
  TextEditingController _eventCreateTitleTEC = new TextEditingController();
  TextEditingController _eventDetailTEC = new TextEditingController();

  bool _validate = false;
  bool _validateEventTitle=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [Color.fromARGB(250, 206, 206, 206), Colors.white])),
        child: _getPage(currentPage),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Color.fromARGB(250, 206, 206, 206),
        circleColor: Colors.white,
        textColor: Colors.black,
        activeIconColor: Colors.cyan,
        inactiveIconColor: Colors.indigoAccent,
        initialSelection: 1,
        tabs: [
          TabData(
            iconData: Icons.notifications,
            title: "Gelişmeler",
          ),
          TabData(iconData: Icons.location_on, title: "Harita"),
          TabData(iconData: Icons.person_pin, title: "Profilim")
        ],
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        getRequestForUser(widget.userID, context);
        getMyAllEvents(widget.userID,context);
        return _PageUpdates();

      case 1:
        getRequestForUser(widget.userID, context);
        getMyAllEvents(widget.userID,context);
        return _PageMap();
      case 2:
        getRequestForUser(widget.userID, context);
        getMyAllEvents(widget.userID,context);
        return _PageProfile();
      default:
        return Center(
          child: Text('Bir şeyler yanlış gitti'),
        );
    }
  }

  Widget _PageUpdates() {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 28),
            child: ClipOval(
              child: Image.network(
                'https://i.picsum.photos/id/10/2500/1667.jpg',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            )),
        Container(),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            "Abbbb of Cccdd",
            style: TextStyle(
                color: Colors.indigoAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
      //  Container(margin: EdgeInsets.only(bottom: 8), child: _getUserStars()),
        GestureDetector(
          onTap: () {
            return (showDialog(
                context: context,
                builder: (context) {
                  return Dialog(child: activeEventsMain());
                }));

          },
          child: Container(
            decoration: myBoxDecoration(),
            child: ListTile(
              leading: Icon(
                Icons.event,
                color: Colors.orange,
              ),
              title: Text(
                'Etkinliklerim',
                style: _updatesItemsTextStyle(),
              ),
            ),
          ),
        ),
        GestureDetector(
            onTap: () {
              return (showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(child: MessagesMain());
                  }));
            },
            child: Container(
              decoration: myBoxDecoration(),
              child: ListTile(
                leading: Icon(
                  Icons.message,
                  color: Colors.green,
                ),
                title: Text('Mesajlarım', style: _updatesItemsTextStyle()),
              ),
            )),
        GestureDetector(
            onTap: () {
              return (showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: WaitingActions(),
                    );
                  }));
            },
            child: Container(
                decoration: myBoxDecoration(),
                child: ListTile(
                  leading: Icon(
                    Icons.filter_hdr,
                    color: Colors.blue,
                  ),
                  title: Text('Bekleyen Isteklerim',
                      style: _updatesItemsTextStyle()),
                )))
      ],
    ));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Set<Marker> _createMarker() {

    return _setMarkers(json.decode(getPins())).toSet();
  }

  List<Marker> _setMarkers(var respItems) {
    List <Marker> markers= new List <Marker>();
    // print(jsonResponse);
    print('???');
    print(respItems);
    print('aaa');
    for(var i = 0; i < respItems.length; i++){
      print(respItems[i]);

      markers.add( Marker(
          markerId: MarkerId('${respItems[i]["event_id"]}'),
          position: LatLng(double.parse(respItems[i]["event_latitude"]), double.parse(respItems[i]["event_longitude"])),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              (BitmapDescriptor.hueAzure)),
          infoWindow: InfoWindow(
              title: '${respItems[i]["event_title"]}',
              onTap: () {
                double dialogKenarlik = MediaQuery.of(context).size.width / 8;

                return showDialog(
                    context: context,
                    builder: (context) {

                      return _requestDialog(dialogKenarlik,respItems[i]);
                    });
              })));
    }
    return markers;
  }






  Widget _PageMap() {
    return Center(
        child: Scaffold(
      body: GoogleMap(


         onTap: (latlng){
           _showCreateEventDialog(latlng);
         },
        mapToolbarEnabled: false,
        initialCameraPosition: _kGooglePlex,
        markers: _createMarker(),
      ),
    ));
  }

  Widget _PageProfile() {
    return Center(
        child: Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                    alignment: Alignment.topRight,
                    child: Container(

                      margin: EdgeInsets.only(bottom: 40, right: 20),
                      child: IconButton(
                          color: Colors.teal,
                          icon: Icon(
                            Icons.settings,
                            size: 35,
                          ),
                          onPressed: () {}),
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: 28),
                    child: ClipOval(
                      child: Image.network(
                        'https://i.picsum.photos/id/10/2500/1667.jpg',
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(bottom: 20),

                ),
                  ExpansionTile(
                    leading: Icon(
                      Icons.event,
                      color: Colors.redAccent,
                    ),
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 12,
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //actıgımız etkinlikler
                              GestureDetector(
                                onTap: () {
                                  return (showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                            child: showEventsMain()
                                        );
                                      }));


                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                      const Radius.circular(12.0),
                                    ),
                                    color: Color(0xff9932CC),
                                  ),
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          child: Text(
                                            'Geçmiş Etkinlikleri Görüntüle',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),

                                    ],
                                  )),
                                ),
                              ),
                              //aldıgımız yorumlar

                            ],
                          ),
                        ),
                      )
                    ],
                    title: Text(
                      'Geçmiş Etkinliklerim',
                      style: _updatesItemsTextStyle(),
                    ),

                ),

              ],
            )));
  }

  TextStyle _updatesItemsTextStyle() {
    return TextStyle(fontWeight: FontWeight.bold, color:Color(0xff9932CC),);
  }

  RatingBar _getUserStars() {
    return RatingBar(
      initialRating: 3,
      minRating: 1,
      ignoreGestures: true,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.all(
          Radius.circular(10.0) //         <--- border radius here
          ),
    );
  }

  Widget WaitingActions()
  {

    return SingleChildScrollView(
    child:Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(color:Colors.teal,
          width: 650,
          height: MediaQuery.of(context).size.height / 6,
          alignment: Alignment.center,
          child: Text('Etkinlik  isteklerim',style: TextStyle(color: Colors.white,fontSize: 26),),
        ),

        Container(  margin: EdgeInsets.symmetric(vertical: 4),child:  _getSlideble()
          ,),
        Container(  margin: EdgeInsets.symmetric(vertical: 4),child: GestureDetector(child: _getSlideble(),onTap: (){


        },),),
          Container(  margin: EdgeInsets.symmetric(vertical: 4),child: GestureDetector(child: _getSlideble(),onTap: (){},),),
        Container(  margin: EdgeInsets.symmetric(vertical: 4),child: GestureDetector(child: _getSlideble(),onTap: (){},),),


      ],

    ));

  }

  Widget _showSnackBar(String title) {
    return SnackBar(
      content: Text(title),
    );
  }

  Widget _getSlideble()
  {
    return Slidable(

      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        color: Colors.cyan,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.indigoAccent,
            child: ClipOval(
              child: Image.network(
                'https://i.picsum.photos/id/10/2500/1667.jpg',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),

            ),
            foregroundColor: Colors.white,
          ),
          title: Text('Baskete adam lazım',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
          subtitle: Text('DAÖASDDSAÖLSŞAD istek mesajı',style: TextStyle(color: Colors.white),),
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Archive',
          color: Colors.blue,
          icon: Icons.archive,
          onTap: () => _showSnackBar('Archive'),
        ),
        IconSlideAction(
          caption: 'Detaylar',
          color: Colors.indigo,
          icon: Icons.details,
          onTap: () =>   showDialog(
          context: context,
  builder: (context) {
  return Dialog(backgroundColor: Colors.transparent,child: requestDetailMain());
  })
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'More',
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => _showSnackBar('More'),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _showSnackBar('Delete'),
        ),
      ],
    );
  }


  Widget getUserCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 7,
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width / 8)),
            color: Colors.lightBlue,
          ),
          child: Center(child: Text('Yorum')),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.height / 7,
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(
                Radius.circular(MediaQuery.of(context).size.width / 8)),
            color: Colors.lightBlue,
          ),
          child: Center(child: Text('Etkinlik')),
        )
      ],
    );
  }
  SingleChildScrollView _eventDetailField(String detay) {
    return SingleChildScrollView(
      child:Container(
      height: MediaQuery.of(context).size.height / 8,
      width: MediaQuery.of(context).size.width/1.2,
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.black),
        borderRadius: BorderRadius.all(
            Radius.circular(8.0) //                 <--- border radius here
        ),
      ),
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 50,
          right: MediaQuery.of(context).size.width / 25,
          left: MediaQuery.of(context).size.width / 25),


        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: SingleChildScrollView(
            child: Text(
                detay,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height / 40),
            )),
      )
    );
  }

  Widget _dateTimePicker() {
    DateTime dt = new DateTime.now();
    DateTime dt2 = new DateTime.now().add(Duration(days: 90));
    return GestureDetector(
      onTap: () {
        DatePicker.showDateTimePicker(context,
            showTitleActions: true,
            minTime: DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute),
            maxTime: DateTime(dt2.year, dt2.month), onChanged: (date) {
              print('change $date in time zone ' +
                  date.timeZoneOffset.inHours.toString());
            }, onConfirm: (date) {
              print('confirm $date');
              setState(() {
                dtBeginSelected = date;
              });
            }, locale: LocaleType.tr);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width / 3,
        child: Column(
          children: <Widget>[
            Text(
              'Tarih',
              style: TextStyle(fontSize: 20,color: Colors.purple),
            ),
            Icon(Icons.date_range, size: 30),
            Text(
              "${dtBeginSelected.year.toString()}"
                  "-${dtBeginSelected.month.toString()}"
                  "-${dtBeginSelected.day.toString()}"
                  "  ${dtBeginSelected.hour.toString()}"
                  ":${dtBeginSelected.minute.toString()}"
                  "",
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
  Container _createEventTitleField()
  {
    return
      Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.symmetric(
            horizontal: 8, vertical: 4),
        child: TextField(
          decoration: new InputDecoration(
              labelText: "Etkinlik Başlığı",
              errorText: _validateEventTitle
                  ? 'İstek mesajı boş olamaz...'
                  : null,
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                  borderRadius:
                  new BorderRadius.circular(
                      25.0),
                  borderSide: new BorderSide())),
          maxLength: 128,
          maxLengthEnforced: true,
          controller: _eventCreateTitleTEC,
        ),
      );
}
Container _createEventDetailField()
{
  return  Container(
    decoration: BoxDecoration(),
    padding: EdgeInsets.symmetric(
        horizontal: 8, vertical: 4),
    child: TextField(
      decoration: new InputDecoration(
          labelText: "Etkinlik Detayı Mesajım",
          errorText: _validate
              ? 'Etkinlik detayı boş olamaz...'
              : null,
          fillColor: Colors.white,
          border: new OutlineInputBorder(
              borderRadius:
              new BorderRadius.circular(
                  25.0),
              borderSide: new BorderSide())),
      maxLines: 2,
      maxLength: 128,
      maxLengthEnforced: true,
      controller: _eventDetailTEC,
    ),
  );


}

Widget _createEventDialog(LatLng koordinatlar)
{

return Dialog(
      backgroundColor: Colors.white70,
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(20.0))),
      child: Container(

        child: SingleChildScrollView(
          child:   Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0)),
              height: MediaQuery.of(context).size.height/1.5 ,
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Başlık',
                      style: TextStyle(fontSize: 20,color: Colors.purple),
                    ),
                   _createEventTitleField(),
                    _dateTimePicker(),
                    Text(
                      'Etkinlik Detayı',
                      style: TextStyle(fontSize: 20,color: Colors.purple),
                    ),
                    _createEventDetailField(),
                    _btnEventCreate(koordinatlar)
                  ],
                ),
              )),

        ),
      ),
    );
}

 Center _btnEventCreate(LatLng koordinatlar) {
   double dialogKenarlik = MediaQuery.of(context).size.width / 8;

   return

      Center(
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
              1.35,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(
                      9.0),
                  side: BorderSide(
                      color: Colors.white)),
              color: Colors.green,
              child: Text(
                'Etkinliği Oluştur',
                style: TextStyle(
                    color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  _eventCreateTitleTEC.text.isEmpty
                      ? _validate = true
                      : _validate = false;

                  _eventDetailTEC.text.isEmpty
                      ? _validate = true
                      : _validate = false;
                });

                eventCreateClass newEvent=new eventCreateClass();
                newEvent.event_title=_eventCreateTitleTEC.text;
                newEvent.event_owner_id=widget.userID;
                newEvent.event_isAvailable=1;
                newEvent.event_detail=_eventDetailTEC.text;
                newEvent.event_latitude=koordinatlar.latitude.toString();
                newEvent.event_longitude=koordinatlar.longitude.toString();
                newEvent.event_date=dtBeginSelected;



                _etkinlikOlustur(newEvent);

              }),
        ),
      );

  }

  _showCreateEventDialog(LatLng latlng) {
    return  (showDialog(
        context: context,
        builder: (context) {

          return new Dialog(backgroundColor: Colors.transparent, child: _createEventDialog(latlng));
        }));


  }

  void _etkinlikOlustur(eventCreateClass event) {

    createNewEvent(event,context);
    Navigator.of(context).pop();
  }
  void _etkinlikKatilimIstegiGonder(eventJoinRequest event)
  {

    createNewRequest(event,context);
    Navigator.of(context).pop();

  }

   _getMarkers() {
    print(widget.userID);
    return getEvents(widget.userID, context);

  }

  Dialog _requestDialog(dialogKenarlik,var event) {
    return Dialog(
      backgroundColor: Colors.white70,
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(20.0))),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.3,
        width: MediaQuery.of(context).size.height / 1.3,
        child: SingleChildScrollView(
          child:   Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0)),
              height: MediaQuery.of(context).size.height ,
              width: MediaQuery.of(context).size.height,
              child: Container(
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
                    Text(
                      '${event["event_title"]}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Container(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        color: Colors.white,
                        onPressed: () {},
                        child: Text(
                          'Düzenleyen text',
                          style: TextStyle(
                              fontSize: 20, color: Colors.red),
                        ),
                      ),
                    ),

                    Text(
                      '${DateTime.parse(event["event_date"])
                      }',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'Etkinlik Detayı',
                      style: TextStyle(fontSize: 20,color: Colors.purple),
                    ),
                    _eventDetailField(event["event_detail"]),
                    Text(
                      'İstek Mesajı Detayı',
                      style: TextStyle(fontSize: 20,color: Colors.purple),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: TextField(
                        decoration: new InputDecoration(
                            labelText: "İstek Mesajım",
                            errorText: _validate
                                ? 'İstek mesajı boş olamaz...'
                                : null,
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                                borderRadius:
                                new BorderRadius.circular(
                                    25.0),
                                borderSide: new BorderSide())),
                        maxLines: 2,
                        maxLength: 128,
                        maxLengthEnforced: true,
                        controller: eventRequestTEC,
                      ),
                    ),

                    Center(
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
                            1.35,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(
                                    9.0),
                                side: BorderSide(
                                    color: Colors.white)),
                            color: Colors.green,
                            child: Text(
                              'İstek Gönder',
                              style: TextStyle(
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                eventRequestTEC.text.isEmpty
                                    ? _validate = true
                                    : _validate = false;
                              });
                              eventJoinRequest newRequest=new eventJoinRequest();
                              newRequest.request_detail=eventRequestTEC.text;
                              newRequest.receiver_id=event["event_owner_id"];
                              newRequest.requester_id=widget.userID;


                              _etkinlikKatilimIstegiGonder(newRequest);



                            }),
                      ),
                    ),
                  ],
                ),
              )),

        ),
      ),
    );


  }
/*
     GestureDetector(
                                onTap: (){

                                  return (showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          child: userCommentsMain()
                                        );
                                      }));



                                },
                                child: Container(
                                  decoration: new BoxDecoration(
                                    borderRadius: new BorderRadius.all(
                                      const Radius.circular(12.0),
                                    ),
                                    color: Color(0xff9932CC),
                                  ),
                                  margin: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width / 6,
                                  ),
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Center(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          child: Text(
                                            'Toplam',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text('Yorum : 22'),
                                          ))
                                    ],
                                  )),
                                ),
                              )



 */

/*

      Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: MaterialButton(
                        child: Text('Tüm Yorumlarımı Görüntüle (17)'),
                        onPressed: () {},
                      ),
                    ))


 */
}
