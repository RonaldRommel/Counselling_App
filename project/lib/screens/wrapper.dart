import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/autheticate/authenticate.dart';
import 'package:project/models/user.dart';
import 'package:project/screens/HOD/hod_home.dart';
import 'package:project/screens/Student/student_home.dart';
import 'package:project/screens/Teacher/teacher_home.dart';
import 'package:project/services/auth.dart';
import 'package:project/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:project/database/database.dart';

class Wrapper extends StatelessWidget {
  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    if(user==null){
     return Authenticate();
    }
    else{
      return FutureBuilder(
        future:DatabaseService(uid: user.uid).userAccess(),
        builder: (context,AsyncSnapshot<Map> user) {
          //check role from database.dart  
          if(user.connectionState==ConnectionState.done)
          {
            switch(user.data['role'])
            {
              case 'Hod':
                return HodHome(department: user.data['department'],);
              case 'Teacher':
                return TeacherHome();
              case 'Student':
                return StudentHome();  
              default:
                _auth.signOut();
                return Authenticate();
            }
          }
          else if(user.connectionState==ConnectionState.waiting){
            return Loading();            
          }
          else{
            _auth.signOut();
            return Authenticate();
          }
        },
      );
    }
  }
}