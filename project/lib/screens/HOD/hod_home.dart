import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/database/hod_database.dart';
import 'package:project/screens/HOD/teacher_list.dart';
import 'package:project/services/auth.dart';
import 'package:project/shared/drawer.dart';
import 'package:project/models/Classteacher.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';

class HodHome extends StatelessWidget {
  final String department;
  HodHome({this.department});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Teachers>>.value(
      value: HodDatabase(department: this.department).teachers,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        endDrawer:NavDrawer(),
        appBar: new AppBar(
          toolbarHeight: MediaQuery.of(context).size.height*0.08,
          backgroundColor: colors.pricolor,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[ 
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height*0.055,
                ),
              ),
              SizedBox(width: 20),
              Text("WNC",
                style:  Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            //Row below appbar
            Container(
              color: colors.seccolor,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.06,
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                children: [
                  Text('${this.department} Department',style: Theme.of(context).textTheme.headline2,),
                  Spacer(),
                  FlatButton(
                    textColor: Colors.white,
                    onPressed: (){print("add");}, 
                    child: Icon(Icons.person_add),
                  ),
                ],
              ),
            ),
            //List of teachers
            Expanded(
              child: Teacherlist()
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 15,
          color: colors.pricolor,
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.menu),color: Colors.white ,onPressed: () {
              }),
              Spacer(),
              IconButton(icon: Icon(Icons.search),color: Colors.white , onPressed: () {}),
              IconButton(icon: Icon(Icons.more_vert),color: Colors.white , onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}