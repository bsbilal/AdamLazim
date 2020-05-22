import 'package:adam_lazim_v03/register.dart';
import 'package:flutter/material.dart';

class LoginMain extends StatelessWidget {

  final TextEditingController UsernameTEC=new TextEditingController();
  final TextEditingController PasswordTEC=new TextEditingController();


  //show dialog
   _showDialogg (context){
    return( showDialog(context: context,
        builder: (context){
          return Dialog(
              child:Container(
                margin: EdgeInsets.all(12),
                child: (
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          child:
                          Text('Hoşgeldin ${UsernameTEC.text}',),

                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child:
                          Text('Şifreniz : ${PasswordTEC.text}',),

                        ),


                        RaisedButton(
                            child: Text('Anladım ${UsernameTEC.text}',style: TextStyle(color: Colors.white)),
                            color: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.red)
                            ),
                            onPressed: (){


                              Navigator.of(context, rootNavigator: true).pop('dialog') ; }

                        )
                      ],
                    )
                ),
              )
          ) ;

        }


    )
    );
  }



  //end of dialog

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(       
      backgroundColor: Colors.yellow,

        body: Container(

        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/login_bg.jpg"),
        fit: BoxFit.fill,
      ),

    ),





          child:Center(

          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                //BEGINNING OF TEXTFIELDS
                Container(
                  color: Colors.white,

                  margin:EdgeInsets.all((MediaQuery.of(context).size.width)/6),

                  child:TextField(

                    controller:UsernameTEC ,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),


                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width/6,
                    right: MediaQuery.of(context).size.width/6,
                    top: 10

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
                //END OF TEXT FIELDS
                 Center(
                   child: Column(

                     children: <Widget>[

                       //LOGIN BUTTON

                       Container(
                           margin:
                           EdgeInsets.only(top: 33,),
                           width: (MediaQuery.of(context).size.width)/1.5,

                           height:50,
                           child:(
                               RaisedButton(
                                 color: Colors.cyan,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: new BorderRadius.circular(8.0),
                                 ),
                                 onPressed: (){
                                   _showDialogg(context);
                                 },
                                 child:
                                 Text('LOGIN',style: TextStyle(fontSize: 20, color: Colors.white),
                                 ),

                               )


                           )//chi


                         // ld
                       ),
//Regıster button


                       Container(
                           margin:
                           EdgeInsets.only(top: ((MediaQuery.of(context).size.width)/30)),
                           width: (MediaQuery.of(context).size.width)/1.5,

                           height:50,
                           child:(
                               RaisedButton(
                                 color: Colors.indigoAccent,
                                 shape: RoundedRectangleBorder(
                                     borderRadius: new BorderRadius.circular(8.0),
                                 ),
                                 onPressed: (){
                                   //OPEN SIGNUP PAGE
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(builder: (context) => RegisterMain()),
                                   );


                                 },
                                 child:
                                 Text('REGISTER',style: TextStyle(fontSize: 20, color: Colors.white),
                                 ),

                               )


                           )//chi


                         // ld
                       )



                     ],


                   ),
                 )

              ],


            ),
          ),


        ),


      ),

    );


  }





}