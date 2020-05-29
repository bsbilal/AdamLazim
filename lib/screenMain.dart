import 'package:adam_lazim_v03/register.dart';
import 'package:adam_lazim_v03/requestDetail.dart';
import 'package:adam_lazim_v03/showOldEvents.dart';
import 'package:adam_lazim_v03/userComments.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  GlobalKey bottomNavigationKey = GlobalKey();

  TextEditingController eventRequestTEC = new TextEditingController();
  bool _validate = false;

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
        return _PageUpdates();

      case 1:
        return _PageMap();
      case 2:
        return _PageProfile();
      case 3:
        return MessagesMain();
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
            "Name of Human",
            style: TextStyle(
                color: Colors.indigoAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(margin: EdgeInsets.only(bottom: 8), child: _getUserStars()),
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
    return <Marker>[
      Marker(
          markerId: MarkerId('fdsfdas'),
          position: _kGooglePlex.target,
          icon: BitmapDescriptor.defaultMarkerWithHue(
              (BitmapDescriptor.hueAzure)),
          infoWindow: InfoWindow(
              title: 'Baskete Adam Lazım!',
              onTap: () {
                double dialogKenarlik = MediaQuery.of(context).size.width / 8;

                return showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0))),
                        child: SingleChildScrollView(
                          child:   Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0)),
                              height: MediaQuery.of(context).size.height / 1.5,
                              width: MediaQuery.of(context).size.height / 1.3,
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
                                      'Baskete Adam Lazım',
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
                                      '02/12/2002 19-00',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Etkinlik Detayı',
                                      style: TextStyle(fontSize: 20,color: Colors.purple),
                                    ),
                                    _eventDetailField(),
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

                                    Expanded(
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
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
                                                }),
                                          )),
                                    ),
                                  ],
                                ),
                              )),

                        ),
                      );
                    });
              }))
    ].toSet();
  }



  Set<Marker> _createXd(markernew) {
    return <Marker>[
      Marker(
          markerId: MarkerId('fdsfdas'),
          position: markernew,
          icon: BitmapDescriptor.defaultMarkerWithHue(
              (BitmapDescriptor.hueAzure)),
          infoWindow: InfoWindow(
              title: 'Baskete Adam Lazım!',
              onTap: () {
                double dialogKenarlik = MediaQuery.of(context).size.width / 8;

                return showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0)),
                            height: MediaQuery.of(context).size.height / 2,
                            width: MediaQuery.of(context).size.height / 1.3,
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
                                    'Baskete Adam Lazım',
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
                                    '02/12/2002 19-00',
                                    style: TextStyle(fontSize: 14),
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
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
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
                                              }),
                                        )),
                                  ),
                                ],
                              ),
                            )),
                      );
                    });
              }))
    ].toSet();
  }

  Widget _PageMap() {
    return Center(
        child: Scaffold(
      body: GoogleMap(

         onTap: (latlng){
           _createXd(latlng);
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
                  child: Text(
                    "Name of Human",
                    style: TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                  ExpansionTile(
                    leading: Icon(
                      Icons.event,
                      color: Colors.redAccent,
                    ),
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 12,
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
                                  width: MediaQuery.of(context).size.width / 3,
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
                                        alignment: Alignment.topCenter,
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
                                            child: Text('Sayımız : 22'),
                                          ))
                                    ],
                                  )),
                                ),
                              ),
                              //aldıgımız yorumlar
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
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: MaterialButton(
                        child: Text('Tüm Yorumlarımı Görüntüle (17)'),
                        onPressed: () {},
                      ),
                    ))
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
        Container(  margin: EdgeInsets.symmetric(vertical: 4),child: GestureDetector(child: _getSlideble(),onTap: (){},),),
        Container(  margin: EdgeInsets.symmetric(vertical: 4),child: GestureDetector(child: _getSlideble(),onTap: (){},),),

        Container(  margin: EdgeInsets.symmetric(vertical: 4),child: GestureDetector(child: _getSlideble(),onTap: (){},),),
        Container(  margin: EdgeInsets.symmetric(vertical: 4),child: GestureDetector(child: _getSlideble(),onTap: (){},),),
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
  Container _eventDetailField() {
    return Container(
      height: MediaQuery.of(context).size.height / 8,
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
            'Yaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır. Virginiadan Latince profesörü Richard McClintock, bir Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri ola özcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır. Lorm Ipsum, Çiçero tarafından M.Ö. 45 tarihinde kaleme alınan "de Finibus Bonorum et Malorum" (İyi ve Kötünün Uç Sınırları) eserinin 1.10.32 ve 1.10.33 sayılı bölümlerinden gelmektedir. Bu kitap, ahlak kuramı üzerine bir tezdir ve Rönesans döneminde çok popüler olmuştur. Lorem Ipsum pasajının ilk satırı olan "Lorem ipsum dolor sit amet" 1.10.32 sayılı bölümdeki bir satırdan gelmektedir.',
            style: TextStyle(
                color: Colors.black,
                fontSize: MediaQuery.of(context).size.height / 40),
          )),
    );
  }

}
