import 'package:flutter/material.dart';
import 'package:project/models/ClassStudents.dart';
import 'package:provider/provider.dart';

class StudentSem extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    String counselling="Counselling ";
    Widget expandTile(String text){
      return Card(
        child: ExpansionTile(
          title: Text(text),  
          children: [
            for (var i = 1; i <=4; i++) 
              ListTile(
                title: Text(counselling+i.toString()),
                onTap: (){
                  Navigator.pushNamed(
                    context,
                    '/studentTable',
                    arguments: {
                      "semester":text,
                      "counselling" : counselling+i.toString(),
                    }
                  );
                },
              ),
          ]
        ),
      );
    }
    final studentdata=Provider.of<Students>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:20),
            expandTile("Semester 1"),
            expandTile("Semester 2"),
            expandTile("Semester 3"),
            expandTile("Semester 4"),
            expandTile("Semester 5"),
            expandTile("Semester 6"),
            expandTile("Semester 7"),
            expandTile("Semester 8"),
          ],
        ),
      ),
    );
  }
}