import 'package:flutter/material.dart';
import 'package:project/services/auth.dart';
import 'package:project/theme/theme.dart';

class TeacherHome extends StatefulWidget {
  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.pricolor,
        title: Text(
          "Teacher",style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Center(
        child: FlatButton(
          onPressed: (){
            _auth.signOut();            
          },
          child: Icon(Icons.logout),
        ),
      ),
    );
  }
}