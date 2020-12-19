import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/autheticate/authenticate.dart';
import 'package:project/models/user.dart';
import 'package:project/screens/HOD/hod_home.dart';
import 'package:project/screens/Student/student_home.dart';
import 'package:project/screens/Teacher/teacher_home.dart';
import 'package:project/services/auth.dart';
import 'package:project/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:project/services/database.dart';

class Wrapper extends StatelessWidget {
  final bool loading =true;
  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    if(user==null){
     return Authenticate();
    }
    else{
      return FutureBuilder(
        future:DatabaseService().userAccess(user.uid),
        builder: (context,AsyncSnapshot<String> role) {
          if(role.data=="Hod")
            return HodHome();
          else if(role.data=="Teacher")
            return TeacherHome();
          else if(role.data=="Student")
            return StudentHome();
          else
            return Loading();
        },
      );
      // DatabaseService().userAccess(user.uid);
      // print("in wrapper : ${DatabaseService().userAccess(user.uid)}");
      // _auth.signOut();
      // return Authenticate();
      // return HodHome();
      // switch(DatabaseService().userAccess(user.uid))
      // {
      //   case "Hod":
      //     return HodHome();
      //   case "Teacher":
      //      return TeacherHome();
      //   case "Student":
      //     return StudentHome();
      //   default:
      //     print("Not available");
      //     return Authenticate();
      // }
    }
  }
}