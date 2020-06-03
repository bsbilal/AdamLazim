import 'package:status_alert/status_alert.dart';

String _projectServerURL="http://10.0.2.2:3850";

String _pinStrings="";

String _myEvents="";

String _requests="";

 setpins(gelenVal)
 {
   _pinStrings=gelenVal;
 }
getPins()
{
  return _pinStrings;

}
setMyEvents(gelenVal)
{
  _myEvents=gelenVal;
}
getMyEvents()
{
  print(_myEvents);
  return _myEvents;

}


setRequests(gelenVal)
{
  _requests=gelenVal;
}
getRequests()
{

  return _requests;

}


getProjectServerURL(){

  return _projectServerURL;
}



void showInfoAlert  (_context,_successText,_icon) async
{
  StatusAlert.show(
      _context,
      duration: Duration(seconds: 2),
      title: '$_successText',
      configuration: IconConfiguration(icon: _icon)
  );

}