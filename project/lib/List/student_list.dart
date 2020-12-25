import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/models/ClassStudents.dart';
import 'package:project/screens/Teacher/teacher_home.dart';

class Student_List {

  List<Students> students1=[
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

  List<Students> students2=[
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
    Students(name: "Messi",picture: "messi.jpg"),
  ];

  studList(int sec){
    if(sec == 0) {
      return students1;
    }
    else if(sec == 1) {
      return students2;
    }
  }

}