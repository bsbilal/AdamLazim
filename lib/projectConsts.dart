import 'package:status_alert/status_alert.dart';

String _projectServerURL="http://10.0.2.2:3850";


getProjectServerURL(){

  return _projectServerURL;
}



void showInfoAlert  (_context,_successText,_icon) async
{
  StatusAlert.show(
      _context,
      duration: Duration(seconds: 1),
      title: '$_successText',
      configuration: IconConfiguration(icon: _icon)
  );

}