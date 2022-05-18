import 'package:flutter/material.dart';
import 'package:et_tracking/view/screens/loading_screen.dart';
import 'package:et_tracking/view/screens/login_screen.dart';
import 'package:et_tracking/view/screens/map_screen.dart';





void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,

  initialRoute: '/',
 routes: {
      '/': (context) => LOD(),
      '/login_page': (context) => LOG(),
      '/map_page': (context) => MapSample(),
    }));
