import 'package:flutter/material.dart';
import 'package:project/database/hod_database.dart';
import 'package:project/models/Classteacher.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';

class Teacherlist extends StatefulWidget {
  final List assignedstudents;
  Teacherlist({Key key,this.assignedstudents}):super(key:key);
  @override
  _TeacherlistState createState() => _TeacherlistState();
}

class _TeacherlistState extends State<Teacherlist> {
  final snackbar = SnackBar(
    content: Text("No student is assigned ",style: TextStyle(color:colors.pricolor),),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.white,
    behavior: SnackBarBehavior.floating,
  );
  @override
  Widget build(BuildContext context) {
    final teachers =Provider.of<List<Teachers>>(context)??[];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: teachers.length,
      itemBuilder: (context,index){
        return Container(
          height: MediaQuery.of(context).size.height*0.1 ,
          child: Card(
            child: ListTile(
              onTap: (){
                List teacherStudents=HodDatabase().studentsOfTeacher(widget.assignedstudents, teachers[index].uid);
                if(teacherStudents.length>0)
                {
                  Navigator.pushNamed(context, '/studentslist',arguments: {
                    "name": teachers[index].name,
                    "uid": teachers[index].uid,
                    "students": teachers[index].students,
                    "picture": teachers[index].picture,
                    "department":teachers[index].department,
                    "list":teacherStudents,
                  });
                }
                else{
                  Scaffold.of(context).showSnackBar(snackbar);
                }
                print("NAME:${teachers[index].name}, UID:${teachers[index].uid}");
              },
              leading: CircleAvatar(
                radius: MediaQuery.of(context).size.height*0.035,
                // backgroundImage:AssetImage('assets/${teachers[index].picture}'),
                backgroundColor: colors.pricolor,
              ),
              title: Text(teachers[index].name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle: Text("${teachers[index].students} students",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing:Checkbox(
                value: teachers[index].checkBoxValue,
                onChanged: (bool value){
                  print(value);
                  setState(() {
                    teachers[index].checkBoxValue=value;
                  });
                },
                activeColor: colors.pricolor,
              )
            )
          ),
        );
      },
    );
  }
}
