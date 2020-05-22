import 'package:shared_preferences/shared_preferences.dart';

setUserID(userID)
async {
  if(userID!=0)
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('userID', userID);
  }
  else
    {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('userID', 0);
    }
  print(userID);


}

Future<int> getUserID()
async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int id = (prefs.getInt('userID'));
  print(id);
  return Future.value(id);
}