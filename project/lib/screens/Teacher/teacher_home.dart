import 'package:flutter/material.dart';
import 'package:project/List/student_list.dart';
import 'package:project/models/ClassStudents.dart';
import 'package:project/services/auth.dart';
import 'package:project/theme/theme.dart';

class TeacherHome extends StatefulWidget {
  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}
class _TeacherHomeState extends State<TeacherHome> {

  final Student_List _student = Student_List();

  List<Students> students = [
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
    Students(name: "Ronaldo",picture: "ronaldo.jpg"),
  ];

   List<Students> students1 = [];

  int sec = 0;

  final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
      students1 = _student.studList(sec);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.pricolor,
        title: Text('Faculty'),
        leading: GestureDetector(
          onTap: () {
            // on tap code
          },
          child: Icon(
            Icons.menu,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                // on tap code
              },
              child: Icon(
                Icons.search,
                size: 26.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                // on tap code
              },
              child: Icon(
                Icons.more_vert,
                size: 26.0,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(
                onPressed: () {
                  sec = 0;
                  setState(() {
                    students1 = _student.studList(sec);
                  });
                },
                child: Text("C Cycle"),
                textColor: Colors.white,
                color: colors.pricolor,
              ),
              RaisedButton(
                onPressed: () {
                  sec = 1;
                  setState(() {
                    students1 = _student.studList(sec);
                  });
                },
                child: Text("P Cycle"),
                textColor: Colors.white,
                color: colors.pricolor,
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                itemCount: students1.length,
                itemBuilder: (context , index) {
                  return Container(
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: MediaQuery.of(context).size.height*0.035,
                          backgroundImage: AssetImage('assets/${students1[index].picture}'),
                        ),
                        title: Text(students1[index].name,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  );
                },
              )
          ),
        ],
      )
    );
  }
}