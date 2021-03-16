import 'package:flutter/material.dart';
import 'package:project/autheticate/login.dart';
import 'package:project/screens/HOD/hod_home.dart';
import 'package:project/screens/HOD/teacher.dart';
import 'package:project/screens/wrapper.dart';

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
      // case '/studentProfile':
      //   final args=settings.arguments ;
      //   return MaterialPageRoute(builder: (context)=>StudentProfile(studentProfile: args,));
      // case '/studentTable':
      //   final args=settings.arguments ;
      //   return MaterialPageRoute(builder: (context)=>StudentTable());
      default:
        return  _errorRoute();
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