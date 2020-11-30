import 'package:flutter/material.dart';
import 'package:project/pages/HOD/dashboard.dart';
import 'package:project/pages/login.dart';
import 'package:project/pages/HOD/mapping.dart';
import 'package:project/pages/HOD/teacher.dart';
import 'package:project/theme/theme.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: basicTheme(),
  initialRoute: '/',
  routes: {
    '/':(context) => Login(),
    '/dashboard':(context) => Dashboard(),
    '/teacher':(context)=>Teacher(),
    '/mapping':(context)=>Mapping(),
  },
));


