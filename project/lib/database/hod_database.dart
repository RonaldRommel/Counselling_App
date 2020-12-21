import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/Classteacher.dart';


class HodDatabase{
  final String department;
  HodDatabase({this.department});

  //department collection reference
  CollectionReference dep = FirebaseFirestore.instance.collection("Physics");

  //stream for teacher of a department
  Stream<List<Teachers>> get teachers{
    return dep.snapshots().map(_teacherlist);
  }

  //List of teachers
  List<Teachers> _teacherlist(QuerySnapshot snapshot){
    return snapshot.docs.map((teacher){
      return Teachers(
        name: teacher.data()['name'],
        students: teacher.data()['students'],
        picture: teacher.data()['picture'],
      );
    }).toList();
  }  

}