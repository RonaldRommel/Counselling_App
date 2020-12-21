import 'package:flutter/material.dart';
import 'package:project/models/Classteacher.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';

class Teacherlist extends StatefulWidget {
  @override
  _TeacherlistState createState() => _TeacherlistState();
}

class _TeacherlistState extends State<Teacherlist> {
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
                // print(teachers[index].name);
                // Navigator.pushNamed(context, '/teacherlist',arguments: {
                //   'name': teachers[index].name,
                //   'students':teachers[index].students,
                // } );
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
            )
          ),
        );
      },
    );
  }
}