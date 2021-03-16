import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/models/ClassStudents.dart';

class StudentDatabase{
  final String uid;
  final String department;
  final int year;
  StudentDatabase({this.department,this.uid,this.year});

  //get Studentuser stream
  Stream<Students> get studentData{
    CollectionReference studentcollection = FirebaseFirestore.instance.collection(this.year.toString());
    return studentcollection.doc(this.uid).snapshots()
      .map(_studentDataFromSnapshot);
  }

  //Studentdata from snapshot
  Students _studentDataFromSnapshot(DocumentSnapshot snapshot) {
    print("WORKED");
    return Students(
      uid: snapshot.data()['uid'],
      name: snapshot.data()["name"],
      department:snapshot.data()["department"],
      phone:snapshot.data()["phone"],
      picture: snapshot.data()["picture"],
      semester: snapshot.data()["semester"],
      sem1:snapshot.data()["Semester 1"],
      sem2:snapshot.data()["Semester 2"],
      sem3:snapshot.data()["Semester 3"],
      sem4:snapshot.data()["Semester 4"],
      sem5:snapshot.data()["Semester 5"],
      sem6:snapshot.data()["Semester 6"],
      sem7:snapshot.data()["Semester 7"],
      sem8:snapshot.data()["Semester 8"],
    );
  }

  



}