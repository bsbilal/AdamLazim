
import 'dart:convert';

import 'package:adam_lazim_v03/Model/serverAddDataResponse.dart';
import 'package:flutter/material.dart';

import 'projectConsts.dart';
import 'package:http/http.dart' as http;

class eventCreateClass{
  String event_title;
  DateTime event_date;
  String event_detail;
  int event_owner_id;
  int event_isAvailable;
  String event_longitude;
  String event_latitude;
}


Future<void> createNewEvent(eventCreateClass eventNew,context) async {
  var url =getProjectServerURL()+'/CreateEvent';
  print(url);
  var body = jsonEncode({ 'data': {
    "event_title":"${eventNew.event_title}",
    "event_date":"${eventNew.event_date}",
    "event_detail":"${eventNew.event_detail}",
    "event_owner_id":"${eventNew.event_owner_id}",
    "event_isAvailable":"${eventNew.event_isAvailable}",
  "event_longitude":"${eventNew.event_longitude}",
  "event_latitude":"${eventNew.event_latitude}"

  }  });

  print("Req Body: " + body);

  print(body);
  http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  ).then((http.Response response) {
    var jsonString=response.body;
    final jsonResponse =json.decode(jsonString);

    print(jsonResponse);


    if(!_hasRegistered(jsonResponse,context))
    {
      showInfoAlert(context,'İşlem Başarısız..',Icons.cancel);
      return;
    }

  });
}

_hasRegistered(jsonResponse,context)
{

  serverAddDataResponse resp=new serverAddDataResponse.fromJson(jsonResponse);
  print(resp);
  if(resp!=null && resp.resultcode=="1")
    showInfoAlert(context,'İşlem başarılı!',Icons.done);
  else
    return false;

}
class eventJoinRequest{


  int requester_id;
  int receiver_id;
  String request_detail;


}



Future<void> createNewRequest(eventJoinRequest requestNew,context) async {
  var url =getProjectServerURL()+'/CreateEvent';
  print(url);
  var body = jsonEncode({ 'data': {
    "requester_id":"${requestNew.requester_id}",
    "receiver_id":"${requestNew.receiver_id}",
    "request_detail":"${requestNew.request_detail}"

  }  });

  print("Req Body: " + body);

  print(body);
  http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  ).then((http.Response response) {
    var jsonString=response.body;
    final jsonResponse =json.decode(jsonString);

    print(jsonResponse);


    if(!_hasRegistered(jsonResponse,context))
    {
      showInfoAlert(context,'İşlem Başarısız..',Icons.cancel);
      return;
    }

  });
}



Future<void> getEvents(int requesterID,context) async {
  var url =getProjectServerURL()+'/getEvents';
  print(url);
  var body = jsonEncode({ 'data': {
    "requester_id":"$requesterID"
  }  });

  print("Req Body: " + body);

  print(body);
  http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  ).then((http.Response response) {
    var jsonString=response.body;
    print('s');

    setpins(jsonString);
    return jsonString;


   /* if(!_hasRegistered(jsonResponse,context))
    {
      showInfoAlert(context,'İşlem Başarısız..',Icons.cancel);
      return;
    }*/

  });
}
