
import 'package:flutter/material.dart';
import 'package:project/database/hod_database.dart';
import 'package:project/screens/HOD/hod.dart';
import 'package:project/models/Classteacher.dart';
import 'package:provider/provider.dart';


class HodHome extends StatelessWidget {
  final String department;
  HodHome({this.department});
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Teachers>>.value(
      value:HodDatabase(department: this.department).teachers ,
      child: Hod(department: this.department,),
    );
  }
}