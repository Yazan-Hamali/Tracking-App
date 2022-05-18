import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences sharedPreferences;
Future<void> logIn(BuildContext context, String email, pass) async {
  sharedPreferences = await SharedPreferences.getInstance();
  Map<String, dynamic> data = {};
  Map<String, dynamic> info = {
    "login": email,
    "password": pass
  }; //{'login': email, 'password': pass};

  data["params"] = info;
  var bodyy = jsonEncode(data);
  int len = bodyy.length;
  try {
    var response = await http
        .post("http://127.0.0.1/api/login/", body: bodyy, headers: {
      "Content-Type": "application/json",
      "Content-Length": "$len",
      "Accept": "application/json"
    });
    //print(jsonEncode((response.statusCode)));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      //print(jsonResponse);
      if (jsonResponse['result']['success']) {
        print(jsonResponse['result']['message']);
        sharedPreferences.setString("token", jsonResponse['result']['token']);
        sharedPreferences.setString("email", email);
        sharedPreferences.setString("password", pass);
        Navigator.pushReplacementNamed(context, '/map_page');
      } else {
        String msg = jsonResponse['result']['message'];
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Wrong Credentials"),
                content: Text("$msg"),
                actions: [
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(context, '/login_page'); /////////////
                    },
                    child: Text("Ok"),
                  ),
                ],
              );
            });
        
      }
    } else {
      print(response.body);
    }
  } catch (e) {
    print(e);
  }
}
