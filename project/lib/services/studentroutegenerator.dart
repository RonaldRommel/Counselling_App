import 'package:flutter/material.dart';
import 'package:project/screens/Student/studentTable.dart';
import 'package:project/screens/Student/student_nav.dart';
import 'package:project/screens/Student/student_profile.dart';
class StudentRouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final  args=settings.arguments;
    switch (settings.name) {
      case '/':
        final  args=settings.arguments;
        return MaterialPageRoute(builder:(context)=>StudentNav());
      case '/studentProfile':
        final args=settings.arguments ;
        return MaterialPageRoute(builder: (context)=>StudentProfile());
      case '/studentTable':
        final args=settings.arguments as Map;
        return MaterialPageRoute(builder: (context)=>StudentTable(sem: args,));
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