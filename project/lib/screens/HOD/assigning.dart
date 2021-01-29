import 'package:flutter/material.dart';
import 'package:project/database/hod_database.dart';
import 'package:project/models/Classteacher.dart';
import 'package:project/screens/HOD/teacher_list.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';

class Assign extends StatelessWidget {
  final List unassigned;
  final int spt;
  Assign({Key key,this.unassigned,this.spt}):super(key:key);
  @override
  Widget build(BuildContext context) {
    Widget snackbar(String message){
        return SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
        backgroundColor: colors.pricolor,
        behavior: SnackBarBehavior.fixed,
      );
    }
    // final snackbar = SnackBar(
    //   content: Text(message),
    //   duration: Duration(seconds: 1),
    //   backgroundColor: colors.pricolor,
    //   behavior: SnackBarBehavior.fixed,
    // );
    final teachers =Provider.of<List<Teachers>>(context)??[];
    return FloatingActionButton(
          backgroundColor: colors.seccolor,
          child: IconButton(
            icon: Icon(Icons.add), 
            onPressed: (){
              List selected=[];
              print("Selected teachers : ");
              for (var teacher in teachers) {
                if(teacher.checkBoxValue==true){
                  print(teacher.name);
                  selected.add(teacher);
                } 
                // print("${teacher.name} = ${teacher.checkBoxValue}");
              }
              if(selected.length>0){
                if(unassigned.length>0)
                {
                  HodDatabase().assigning(unassigned,selected,spt); 
                  for (var teacher in teachers) {
                    teacher.checkBoxValue=false;
                  }
                }
                else{
                  Scaffold.of(context).showSnackBar(snackbar("No students left to assign"));
                }
              }
              else{
                Scaffold.of(context).showSnackBar(snackbar("No teacher selected"));
                print("Nothings selected");
              }
            },
          ),
          onPressed:null, 
        );
  }
}