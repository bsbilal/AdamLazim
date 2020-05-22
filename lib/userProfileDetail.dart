import 'package:adam_lazim_v03/screenMain.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'screenMain.dart';
import 'userSettings.dart';




class userProfileDetailMain extends StatefulWidget {
  @override
  _userProfileDetailMainState createState() => _userProfileDetailMainState();
}
class _userProfileDetailMainState extends State<userProfileDetailMain> {
  List<NetworkImage> myimages = List<NetworkImage>();final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  int userID;

  @override
  void initState() {


  }

  int i =0;
  String profileImagePath="https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";

  _changeImage(imgURL)
  {

    setState(() {
      profileImagePath=imgURL;
    });

  }



  @override
  Widget build(BuildContext context) {
    return profileChanges();

  }

  Widget profileChanges() {
    TextEditingController visibleNameTEC = new TextEditingController();
    return
      Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Column(children: <Widget>[
                Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width/6,
                  right: MediaQuery.of(context).size.width/6,
                  top: 22

              ),

              child:TextField(
                controller:visibleNameTEC ,

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gözüken Ad',
                ),
              ),
                ),


              Container(
                      child: ClipOval(
                        child: Image.network(
                          profileImagePath,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),

                      )
                  ),


                  Text('Fotoğraf seçin'),

                  CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                    ),
                    items: imgList.map((item) =>
                        Container(
                          child: GestureDetector(
                              onTap: (){
                                i++;
                                print('$item has clicked $i');
                                _changeImage(item);
                              },
                              child:Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                  ),
                                  child:
                                  ClipOval(

                                    child:  Image.network(item,
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                              )
                          ),
                        )).toList(),
                  ),
                ],
                ),),


              returnButton(),

            ],
          )
      );



  }
  Widget returnButton(){

    getUserID().then((int kid){
      userID =kid;
      print(' id: $userID');
    });

    if(userID==0)
      return     RaisedButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreenWidget()));
        },
        child: Text('Kaydet'),
      );
    else
      return  RaisedButton(
          onPressed: (){
            setUserID(1);

            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreenWidget()));
          },
          child: Text('Devam')
      );
  }

}

