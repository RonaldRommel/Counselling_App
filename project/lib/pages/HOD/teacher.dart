import 'package:flutter/material.dart';
import 'package:project/ClassStudents.dart';
// import 'package:project/pages/drawer.dart';
// import 'package:project/teacher.dart';
import 'package:project/theme/theme.dart';
class Teacher extends StatefulWidget {
  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
   //list of students of class Students
  List<Students> students=[
    Students(name: "Ron",picture: "ronaldo.jpg",teacher: "",section: "C1"),
    Students(name: "Mes",picture: "messi.jpg",teacher: "Messi",section: "C2"),
    Students(name: "Inia",picture: "iniesta.jpg",teacher: "Ronaldo",section: "C1"),
    Students(name: "Near",picture: "neymar.jpg",teacher: "Iniesta",section: "C1"),
    Students(name: "Raldo",picture: "ronaldo.jpg",teacher: "Messi",section: "C2"),
    Students(name: "Msia",picture: "messi.jpg",teacher: "Neymar",section: "C1"),
    Students(name: "Iista",picture: "iniesta.jpg",teacher: "Ronaldo",section: "C1"),
    Students(name: "Mar",picture: "neymar.jpg",teacher: "Messi",section: "C2"),
    Students(name: "Aldo",picture: "ronaldo.jpg",teacher: "Ronaldo",section: "C2"),
    Students(name: "Essi",picture: "messi.jpg",teacher: "Iniesta",section: "C1"),
    Students(name: "Esta",picture: "iniesta.jpg",teacher: "Messi",section: "C2"),
    Students(name: "Ney",picture: "neymar.jpg",teacher: "",section: "C1"),
    Students(name: "Nado",picture: "ronaldo.jpg",teacher: "Iniesta",section: "C1"),
    Students(name: "Messir",picture: "messi.jpg",teacher: "Neymar",section: "C2"),
    Students(name: "Nasta",picture: "iniesta.jpg",teacher: "Messi",section: "C1"),
    Students(name: "Nari",picture: "neymar.jpg",teacher: "",section: "C1"),
  ]; 
  Map data={};
  @override
  Widget build(BuildContext context) {
  List<Students> stud=[];
  //used to store arguments from nav.push
  data=ModalRoute.of(context).settings.arguments;
  //used to store students of the clicked teacher
  for (var i = 0; i < students.length ; i++) {
    if(students[i].teacher==data['name'])
      stud.add(students[i]);
  }
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        backgroundColor: colors.dkblue,
        automaticallyImplyLeading: true,
        title:Text("WNC",
          style:  Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Column(
        children: [
          // row below appbar
          Container(
            color: colors.ltblue,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.06,
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              children: [
                Text(data['name'],style: Theme.of(context).textTheme.headline2,),
                Spacer(),
                Text('${stud.length}',style: Theme.of(context).textTheme.headline2,),
                SizedBox(width: 20,),
              ],
            ),
          ),
          // List
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: stud.length,
              itemBuilder: (context,index){
                return Container(
                  height: MediaQuery.of(context).size.height*0.1 ,
                  child: Card(
                    child: ListTile(
                      onTap: (){},
                      leading: CircleAvatar(
                        radius: MediaQuery.of(context).size.height*0.035,
                        backgroundColor: Colors.grey[400],
                      ),
                      title: Text(stud[index].name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Text("${students[index].section}",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    )
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, '/mapping');
        },
        backgroundColor: colors.ltblue,
        foregroundColor: Colors.white,
        elevation:10,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}