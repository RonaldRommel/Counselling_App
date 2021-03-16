import 'package:flutter/material.dart';
import 'package:project/models/ClassStudents.dart';
import 'package:project/screens/Student/student.dart';
import 'package:project/screens/Student/student_drawer.dart';
import 'package:project/screens/Student/student_sem.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';

class StudentNav extends StatefulWidget {
  @override
  _StudentNavState createState() => _StudentNavState();
}

class _StudentNavState extends State<StudentNav> {
  int _currentIndex=0;
  List<Widget> tabs=[Student(),StudentSem()];
  @override
  Widget build(BuildContext context) {
    final studentdata=Provider.of<Students>(context);
    return Scaffold(
    backgroundColor: Colors.grey[50],
      drawer:StudentDrawer(),
      appBar: new AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        backgroundColor: colors.pricolor,
        automaticallyImplyLeading: true,
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children:[ 
        //     ClipRRect(
        //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //       child: Image.asset(
        //               'assets/logo.png',
        //               fit: BoxFit.cover,
        //               height: MediaQuery.of(context).size.height*0.055,
        //       ),
        //     ),
        //     SizedBox(width: 20),
        //     Text("WNC",
        //       style:  Theme.of(context).textTheme.headline1,
        //     ),
        //   ],
        // ),
      ),
      body:tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: "Academics",
          ),
        ],
        backgroundColor: colors.pricolor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
        unselectedItemColor: Colors.white,
      ),
    );
  }
}