import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/ClassStudents.dart';
import 'package:project/models/Classteacher.dart';


class HodDatabase{
  final String department;
  HodDatabase({this.department});
  List yearjoined =[];

  //department collection reference
  String _department(){
    return this.department;
  }

  //stream for teacher of a department
  Stream<List<Teachers>> get teachers{
      CollectionReference dep = FirebaseFirestore.instance.collection(_department());
    return dep.snapshots().map(_teacherlist);
  }

  //List of teachers
  List<Teachers> _teacherlist(QuerySnapshot snapshot){
    return snapshot.docs.map((teacher){
      return Teachers(
        name: teacher.data()['name'],
        students: teacher.data()['students'],
        picture: teacher.data()['picture'],
        uid: teacher.data()['uid'],
        checkBoxValue: false,
      );
    }).toList();
  }


  //Returns list of years 
  Future yearList() async{
    CollectionReference yearCollection = FirebaseFirestore.instance.collection("Students");
    return await yearCollection.orderBy("year",descending:true).get();  
  }
  
  //returns list of students of a branch
  Future<List> studentList() async{
    List studentslist=[];
    var years=await yearList();
    for (var year in years.docs) {
      print(year.data()['year']);
      CollectionReference studentsYear = FirebaseFirestore.instance.collection(year.data()['year'].toString());
      var students =await studentsYear.get();
      for (var student in students.docs) {
        studentslist.add(
          Students(
            name: student.data()['name'],
            uid: student.data()['uid'],
            department: student.data()['department'],
            teacher: student.data()['teacher'],
          )
        );
      }
      print("SUCCESFUL");
    }
    return studentslist;
  }

  //Returns list of students of a teacher
  Future<List> studentsOfTeacher(String uid) async{
    List studentslist= await studentList();
    List studentofteacher=[];
    for (var student in studentslist) {
      if(student.teacher==uid)
      {
        studentofteacher.add(student);
      }      
    }
    return studentofteacher;
  }





  //Assign students
  Future<void> assignStudents(List teachers)async{
    List students = await studentList();
    List assigned=[];
    List unassigned=[];
    int spt;//students per teacher
    spt=(students.length/teachers.length).ceil();
    for (var student in students) {
      if(student.teacher=="null"){
        unassigned.add(student);
      }
      else{
        assigned.add(student);
      }
    }
    print("Number of students assigned : ${assigned.length}");
    print("Number of students unassigned : ${unassigned.length}");
    print("Number of students per teacher : $spt");
    // 




  }





}