import 'package:flutter/material.dart';
import 'package:project/database/hod_database.dart';
import 'package:project/models/Classteacher.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';

class Assign extends StatelessWidget {
  List selected=[];
  @override
  Widget build(BuildContext context) {
    final teachers =Provider.of<List<Teachers>>(context)??[];
    return FloatingActionButton(
          backgroundColor: colors.seccolor,
          child: IconButton(
            icon: Icon(Icons.add), 
            onPressed: (){
              print("Selected teachers : ");
              for (var teacher in teachers) {
                if(teacher.checkBoxValue==true){
                  print(teacher.name);
                  selected.add(teacher);
                } 
                // print("${teacher.name} = ${teacher.checkBoxValue}");
              }
              if(selected.length>0){
                HodDatabase().assignStudents(selected); 
              }
              else{
                //TODO: adding snackbar
                print("Nothings selected");
              }
            },
          ),
          onPressed:null, 
        );
  }
}