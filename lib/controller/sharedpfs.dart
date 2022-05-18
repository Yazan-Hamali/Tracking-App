
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences sharedPreferences;
String ema,pass,tok;
Future<String> getemail() async {
  sharedPreferences = await SharedPreferences.getInstance();
  ema=sharedPreferences.getString("email");
  return ema;
}
Future<String> getpass() async {
  sharedPreferences = await SharedPreferences.getInstance();
  pass=sharedPreferences.getString("password");
  return pass;
}
Future<String> gettoken() async {
  sharedPreferences = await SharedPreferences.getInstance();
  tok=sharedPreferences.getString("token");
  return tok;
}