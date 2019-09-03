import 'package:shared_preferences/shared_preferences.dart';

class Session{
  final _userName = 'username';
  final _fullName = 'fullname';
  Future<String> getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userName);
  }
  Future<bool> setUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userName, value);
  }
  Future<String> getFullName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_fullName);
  }
  Future<bool> setFullName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_fullName, value);
  }
}