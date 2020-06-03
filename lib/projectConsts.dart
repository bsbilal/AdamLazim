import 'package:status_alert/status_alert.dart';

String _projectServerURL="http://10.0.2.2:3850";

String _pinStrings="";

 setpins(gelenVal)
 {
   _pinStrings=gelenVal;
 }
getPins()
{
  return _pinStrings;

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