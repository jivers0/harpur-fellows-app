import 'package:shared_preferences/shared_preferences.dart';

addStringToSF(String key, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

addIntToSF(String key, int value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

addDoubleToSF(String key, double value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setDouble(key, value);
}

addBoolToSF(String key, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}

getStringValueSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String ret = prefs.getString(key) ?? '';
  return ret;
}

getIntValueSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int ret = prefs.getInt(key) ?? -1;
  return ret;
}

getDoubleValueSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  double ret = prefs.getDouble(key) ?? -1;
  return ret;
}

getBoolValueSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool ret = prefs.getBool(key) ?? false;
  return ret;
}

removeValueSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove(key);
}

Future<bool> checkIfValueExistsSF(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool ret = prefs.containsKey(key);
  return ret;
}
