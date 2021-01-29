// import 'package:flutter/material.dart';
// import 'package:project/database/hod_database.dart';
// import 'package:project/models/Classteacher.dart';
// import 'package:project/screens/HOD/assigning.dart';
// import 'package:project/screens/HOD/teacher_list.dart';
// import 'package:project/shared/drawer.dart';
// import 'package:project/shared/loading.dart';
// import 'package:project/theme/theme.dart';
// import 'package:provider/provider.dart';

// class Hod extends StatefulWidget {
//   final String department;
//   Hod({this.department});
  
//   @override
//   _HodState createState() => _HodState();
// }

// class _HodState extends State<Hod> {
//   List assigned=[];
//   List unassigned=[];
//   int spt=0;
//   @override
//   Widget build(BuildContext context) {
//     final teachers =Provider.of<List<Teachers>>(context)??[];
//     return FutureBuilder(
//       future: HodDatabase().assignedStudents(teachers, widget.department),
//       builder: (BuildContext context, AsyncSnapshot<Map> studentsnapshot) {
//         if(studentsnapshot.connectionState==ConnectionState.done)
//         {
//           assigned=studentsnapshot.data["assigned"];
//           unassigned=studentsnapshot.data["unassigned"];
//           spt=((assigned.length+unassigned.length)/teachers.length).ceil();
//           return Scaffold(
//             backgroundColor: Colors.grey[100],
//             endDrawer:NavDrawer(),
//             appBar: new AppBar(
//               toolbarHeight: MediaQuery.of(context).size.height*0.08,
//               backgroundColor: colors.pricolor,
//               automaticallyImplyLeading: false,
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children:[ 
//                   ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     child: Image.asset(
//                             'assets/logo.png',
//                             fit: BoxFit.cover,
//                             height: MediaQuery.of(context).size.height*0.055,
//                     ),
//                   ),
//                   SizedBox(width: 20),
//                   Text("WNC",
//                     style:  Theme.of(context).textTheme.headline1,
//                   ),
//                 ],
//               ),
//             ),
//             body: Column(
//               children: [
//                 //Row below appbar
//                 Container(
//                   color: colors.seccolor,
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height*0.06,
//                   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//                   child: Row(
//                     children: [
//                       Text('${widget.department} Department',style: Theme.of(context).textTheme.headline2,),
//                       Spacer(),
//                       Text("${assigned.length}/${assigned.length+unassigned.length}",style: Theme.of(context).textTheme.headline2,),
//                       // FlatButton(
//                       //   textColor: Colors.white,
//                       //   onPressed: (){print("add");}, 
//                       //   child: Icon(Icons.person_add),
//                       // ),
//                     ],
//                   ),
//                 ),
//                 //List of teachers
//                 Expanded(
//                   child: Teacherlist(assignedstudents: assigned,),
//                 ),
//               ],
//             ),
//             floatingActionButton: Assign(unassigned: unassigned,spt: spt,),
//             floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
//             bottomNavigationBar: BottomAppBar(
//               elevation: 15,
//               color: colors.pricolor,
//               child: Row(
//                 children: [
//                   IconButton(icon: Icon(Icons.menu),color: Colors.white ,onPressed: () {
//                   }),
//                   Spacer(),
//                   IconButton(icon: Icon(Icons.search),color: Colors.white , onPressed: () {}),
//                   IconButton(icon: Icon(Icons.more_vert),color: Colors.white , onPressed: () {}),
//                 ],
//               ),
//             ),
//           );
//         }
//         else{
//           return Loading();
//         }
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:project/database/hod_database.dart';
import 'package:project/models/Classteacher.dart';
import 'package:project/screens/HOD/assigning.dart';
import 'package:project/screens/HOD/teacher_list.dart';
import 'package:project/shared/drawer.dart';
import 'package:project/shared/loading.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';

class Hod extends StatefulWidget {
  final String department;
  Hod({this.department});
  @override
  _HodState createState() => _HodState();
}

class _HodState extends State<Hod> {
  List assigned=[];
  List unassigned=[];
  int spt=0;
  @override
  Widget build(BuildContext context) {
    final teachers =Provider.of<List<Teachers>>(context)??[];
    return Scaffold(
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
      body: FutureBuilder(
        future: HodDatabase().assignedStudents(teachers, widget.department),
        builder: (BuildContext context, AsyncSnapshot<Map> studentsnapshot) {
          if(studentsnapshot.connectionState==ConnectionState.done)
          {
            assigned=studentsnapshot.data["assigned"];
            unassigned=studentsnapshot.data["unassigned"];
            spt=((assigned.length+unassigned.length)/teachers.length).ceil();
            return Column(
              children: [
                //Row below appbar
                Container(
                  color: colors.seccolor,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.06,
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Row(
                    children: [
                      Text('${widget.department} Department',style: Theme.of(context).textTheme.headline2,),
                      Spacer(),
                      Text("${assigned.length}/${assigned.length+unassigned.length}",style: Theme.of(context).textTheme.headline2,),
                      // FlatButton(
                      //   textColor: Colors.white,
                      //   onPressed: (){print("add");}, 
                      //   child: Icon(Icons.person_add),
                      // ),
                    ],
                  ),
                ),
                //List of teachers
                Expanded(
                  child: Teacherlist(assignedstudents: assigned,),
                ),
              ],
            );
          }
          else{
            return Loading(primary: Colors.white,secondary: colors.seccolor,);
          }
        }
      ),
      floatingActionButton: Assign(unassigned: unassigned,spt: spt,),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
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
    );
  }
}