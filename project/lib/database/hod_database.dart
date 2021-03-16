import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/models/ClassStudents.dart';
import 'package:project/models/Classteacher.dart';
import 'package:project/models/hoduser.dart';


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
    return dep.orderBy("students",descending:false).snapshots().map(_teacherlist);
  }

  //List of teachers
  List<Teachers> _teacherlist(QuerySnapshot snapshot){
    return snapshot.docs.map((teacher){
      return Teachers(
        name: teacher.data()['name'],
        department: teacher.data()['department'],
        students: teacher.data()['students'],
        picture: teacher.data()['picture'],
        uid: teacher.data()['uid'],
        checkBoxValue: false,
      );
    }).toList();
  }

  //get Hoduser stream
  Stream<HodUser> hodData(String uid) {
      CollectionReference hod = FirebaseFirestore.instance.collection("Hod");
    return hod.doc(uid).snapshots()
      .map(_hodDataFromSnapshot);
  }

  //HodUser data from snapshot
  HodUser _hodDataFromSnapshot(DocumentSnapshot snapshot) {
    return HodUser(
      uid: snapshot.data()['uid'],
      name: snapshot.data()['name'],
      department:snapshot.data()['department'],
      phone:snapshot.data()['phone'],
    );
  }


  //Returns list of years 
  Future yearList() async{
    CollectionReference yearCollection = FirebaseFirestore.instance.collection("Students");
    return await yearCollection.orderBy("year",descending:true).get();  
  }
  
  //returns list of students of a branch
  Future<List> studentList(String department) async{
    List studentslist=[];
    var years=await yearList();
    for (var year in years.docs) {
      print(year.data()['year']);
      CollectionReference studentsYear = FirebaseFirestore.instance.collection(year.data()['year'].toString());
      var students =await studentsYear.get();
      for (var student in students.docs) {
        if(student.data()['department']==department){
          studentslist.add(
            Students(
              name: student.data()['name'],
              uid: student.data()['uid'],
              department: student.data()['department'],
              teacher: student.data()['teacher'],
            )
          );
        }
      }
      print("SUCCESFUL");
    }
    return studentslist;
  }

  //Returns list of students of a teacher
  List studentsOfTeacher(List studentslist,String uid) {
    List studentofteacher=[];
    for (var student in studentslist) {
      if(student.teacher==uid)
      {
        studentofteacher.add(student);
      }      
    }
    return studentofteacher;
  }

  //returns Map of List assigned and unassigned students
  Future<Map> assignedStudents(List teachers,String department)async{
    List students = await studentList(department);
    List assigned=[];
    List unassigned=[];
    for (var student in students) {
      if(student.teacher=="null"){
        unassigned.add(student);
      }
      else{
        assigned.add(student);
      }
    }
    return ({"assigned":assigned,"unassigned":unassigned});
  }

  //assigning students to teachers
  Future<void> assigning(List unassigned,List teachers,int spt)async{
    int len=unassigned.length;
    for (var teacher in teachers) {
      int counter=teacher.students;
      while(counter<=spt){
        //todo assign students
        if(len>0)
        {
          len--;
        }
        else{
          return "All done";
        }
      }
    }
  }



}