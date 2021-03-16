import 'package:flutter/material.dart';
import 'package:project/database/student_database.dart';
import 'package:project/models/ClassStudents.dart';
import 'package:project/services/studentroutegenerator.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';

class StudentHome extends StatelessWidget {
  final String uid;
  final String department;
  final int year;
  StudentHome({this.department,this.uid,this.year});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Students>.value(
      initialData: Students.initialData(),
      value: StudentDatabase(department: this.department,uid: this.uid,year: this.year).studentData,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: basicTheme(),
        initialRoute: '/',
        onGenerateRoute: StudentRouteGenerator.generateRoute,

      ),
    );
  }
}