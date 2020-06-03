import 'package:adam_lazim_v03/Model/serverAddDataResponse.dart';
import 'package:adam_lazim_v03/projectConsts.dart';
import 'package:adam_lazim_v03/screenMain.dart';
import 'package:adam_lazim_v03/serverMethods.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class RegisterMain extends StatefulWidget {
  @override
  _RegisterMainState createState() => _RegisterMainState();
}



class _RegisterMainState extends State<RegisterMain> {

  final UsernameTEC=  new TextEditingController();
  final PasswordTEC=  new TextEditingController();
  final PasswordRpTEC=  new TextEditingController();
  final MailTEC=  new TextEditingController();
  final ShownNameTEC=new TextEditingController();


  @override
  Widget build(BuildContext context) {

    Widget  _mainContainer()
    {
      return Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,

              height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/register_bg.jpg"),
                fit: BoxFit.cover,
              ),

            ),
              child:Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
//USERNAME
                    Container(
                      color: Colors.white70,
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width/6,
                        right: MediaQuery.of(context).size.width/6,


                      ),
                      child:TextField(

                        controller:UsernameTEC ,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),


                    ),
//MAIL
                    Container(
                      color: Colors.white70,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width/6,
                          right: MediaQuery.of(context).size.width/6,
                          top:22


                      ),
                      child:TextField(

                        controller:MailTEC ,

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mail Adress',
                        ),
                      ),


                    ),
//SHOWN NAME

                    Container(
                      color: Colors.white70,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width/6,
                          right: MediaQuery.of(context).size.width/6,
                          top: 22
                      ),
                      child:TextField(
                        controller:ShownNameTEC ,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Shown Name',
                        ),
                      ),


                    ),

//PASS
                    Container(

                      color: Colors.white70,
                      margin: EdgeInsets.only(

                          left: MediaQuery.of(context).size.width/6,
                          right: MediaQuery.of(context).size.width/6,
                          top: 22

                      ),

                      child:TextField(

                        controller:PasswordTEC ,
                        obscureText: true,
                        decoration: InputDecoration(

                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),


                    ),
                    //PASS REPEAT
                    Container(
                      color: Colors.white70,
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width/6,
                          right: MediaQuery.of(context).size.width/6,
                          top: 22
                      ),
                      child:TextField(
                        controller:PasswordRpTEC ,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password Confirm',
                        ),
                      ),


                    ),

                    //button row
                    //go login button
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width:  MediaQuery.of(context).size.width/3,

                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width/10,
                              top: 22,

                          ),


                          child: RaisedButton(
                            color: Colors.purple,

                            onPressed: (){
                              Navigator.pop(context);

                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)
                            ),
                            child:Text('Go Back',style: TextStyle(color: Colors.white,fontSize: 16),),
                          ),
                        ),

                        //register button
                        Container(
                          width:  MediaQuery.of(context).size.width/3,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width/8,
                              top: 22

                          ),

                          child: RaisedButton(

                            color: Colors.green,
                            onPressed: (){
                              registerNewUser();
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.greenAccent)
                            ),
                            child:Text('Register',style: TextStyle(color: Colors.white,fontSize: 16),),
                          ),
                        ),

                      ],


                    )
                  ],


                ),



              )


          ),
        ),
      );

    }

    return new   Scaffold(
      resizeToAvoidBottomPadding: true,
        appBar: AppBar(title: Text('REGISTER',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.bold),),centerTitle: true,backgroundColor: Colors.teal),
        body:_mainContainer()
    );




  }

  Future<void> registerNewUser() async {
    var url =getProjectServerURL()+'/register';
    var body = jsonEncode({ 'data': {
      "username":"${UsernameTEC.text}",
      "password":"${PasswordTEC.text}",
      "path":"sdaffds.jpg",
      "shownName":"${ShownNameTEC.text}",
      "mail":"${MailTEC.text}"
    }  });

    print("Req Body: " + body);
    http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    ).then((http.Response response) {
      var jsonString=response.body;
      final jsonResponse =json.decode(jsonString);

      print(jsonResponse);


    if(!_hasRegistered(jsonResponse))
        {
          showInfoAlert(context,'Kayıt olma başarısız..',Icons.cancel);
          return;
        }

    });
  }

  _hasRegistered(jsonResponse)
  {

    serverAddDataResponse resp=new serverAddDataResponse.fromJson(jsonResponse);
    print(resp);
    if(resp!=null && resp.resultcode=="1")
    {
      showInfoAlert(context,'Kayıt olma başarılı!',Icons.done);

      getEvents(int.parse(resp.resuldata), context);

      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainScreenWidget(userID: int.parse(resp.resuldata))));
    }
    else
      return false;

  }


}
