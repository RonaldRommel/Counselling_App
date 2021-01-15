import 'package:flutter/material.dart';
import 'package:project/autheticate/login.dart';
import 'package:project/screens/HOD/hod_home.dart';
import 'package:project/screens/HOD/mapping.dart';
import 'package:project/screens/HOD/teacher.dart';
import 'package:project/screens/wrapper.dart';
import 'package:project/autheticate/authenticate.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final  args=settings.arguments;

    switch (settings.name) {
      case '/':
        final  args=settings.arguments;
        return MaterialPageRoute(builder:(context)=>Wrapper());
      case '/login':
        final  args=settings.arguments;
        return MaterialPageRoute(builder: (context) => Login(user: args,));
      case '/hoddashboard':
        final  args=settings.arguments;
        return MaterialPageRoute(builder:(context)=>HodHome());
      case '/studentslist':
        final args=settings.arguments as Map;
        return MaterialPageRoute(builder:(context)=>Teacher(teacherinfo: args,));
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