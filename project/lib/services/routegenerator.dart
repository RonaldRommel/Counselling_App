import 'package:flutter/material.dart';
import 'package:project/autheticate/login.dart';
import 'package:project/screens/HOD/hod_home.dart';
import 'package:project/screens/HOD/mapping.dart';
import 'package:project/screens/HOD/teacher.dart';
import 'package:project/screens/wrapper.dart';
import 'package:project/autheticate/authenticate.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args=settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder:(context)=>Wrapper());
      case '/login':
        return MaterialPageRoute(builder: (context) => Login(user: args,));
      case '/hoddashboard':
        return MaterialPageRoute(builder:(context)=>HodHome());
      case '/teacherlist':
        return MaterialPageRoute(builder:(context)=>Teacher(data: args,));
      // case '/mappping':
      //   return MaterialPageRoute(builder:(context)=>Mapping());

      return  _errorRoute();
      default:
        _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (context){
      return Scaffold(
        appBar: AppBar(
          title: Text("ERROR"),
        ),
        body: Center(
          child: Text("ERROR"),
        ),
      );
    }
    
    );
  } 
}