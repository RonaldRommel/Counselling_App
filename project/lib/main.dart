import 'package:flutter/material.dart';
import 'package:project/pages/dashboard.dart';
import 'package:project/pages/login.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context) => Login(),
    '/dashboard':(context) => Dashboard(),
  },
));


