import 'package:flutter/material.dart';
import 'package:project/services/auth.dart';
import 'package:project/theme/theme.dart';

class StudentHome extends StatefulWidget {
  @override
  _StudentHomeState createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.pricolor,
        title: Text(
          "Student",
          style: Theme.of(context).textTheme.headline1,
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