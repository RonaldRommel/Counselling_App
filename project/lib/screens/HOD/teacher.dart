import 'package:flutter/material.dart';
import 'package:project/database/hod_database.dart';
import 'package:project/shared/loading.dart';
// import 'package:project/pages/drawer.dart';
// import 'package:project/teacher.dart';
import 'package:project/theme/theme.dart';
class Teacher extends StatefulWidget {
  final Map teacherinfo;
  Teacher({Key key,this.teacherinfo}):super(key:key);
  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  
  final snackbar = SnackBar(
    content: Text("No student is assigned"),
    duration: Duration(seconds: 1),
    backgroundColor: colors.pricolor,
  );
  @override
  Widget build(BuildContext context) {
    List student=widget.teacherinfo["list"];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        backgroundColor: colors.pricolor,
        automaticallyImplyLeading: true,
        title:Text(widget.teacherinfo['name'],
          style:  Theme.of(context).textTheme.headline1,
        ),
      ),
      body:Column(
        children: [
          // row below appbar
          // Container(
          //   color: colors.seccolor,
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height*0.06,
          //   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          //   child: Row(
          //     children: [
          //       Text(widget.data['name'],style: Theme.of(context).textTheme.headline2,),
          //       Spacer(),
          //       Text('${stud.length}',style: Theme.of(context).textTheme.headline2,),
          //       SizedBox(width: 20,),
          //     ],
          //   ),
          // ),
          // List
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: student.length,
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
                      title: Text(student[index].name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Text("${student[index].department}",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    )
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}