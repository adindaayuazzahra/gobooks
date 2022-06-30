import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveSwitchState(bool val) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('switchstate', val);
  print('set switch status ${val}');
  return prefs.setBool('switchstate', val);
}

Future<bool?> getSwitchState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isNotif = prefs.getBool('switchstate');
  print('get switch status ${isNotif}');
  return isNotif;
}
