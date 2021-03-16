import 'package:flutter/material.dart';
import 'package:project/models/ClassStudents.dart';
import 'package:project/screens/Student/student_drawer.dart';
import 'package:project/services/auth.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';


class Student extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Widget boldtext(String text){
    //   return Text(
    //     text,style: Theme.of(context).textTheme.bodyText1,
    //   );
    // }
    Widget lighttext(String text){
      return Text(
        text,style: Theme.of(context).textTheme.bodyText2,
      );
    }
    final studentdata=Provider.of<Students>(context);
    print(studentdata);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:20),
            Center(
              child: CircleAvatar(
                backgroundColor: colors.pricolor,
                radius: 68,
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.grey,
                  backgroundImage:NetworkImage(studentdata.picture),
                ),
              ),
            ),
            Divider(
              height: 80,
              color: colors.pricolor,
              thickness: 2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    lighttext("Name"),
                    SizedBox(height:15,),
                    lighttext("Department"),
                    SizedBox(height:15,),
                    lighttext("Semester"),
                    SizedBox(height:15,),
                    lighttext("Phone No."),
                    SizedBox(height:15,),  
                  ],
                ),
                SizedBox(width:20,),
                Column(
                  children: [
                    Text(":"),
                    SizedBox(height:15,),
                    Text(":"),
                    SizedBox(height:15,),
                    Text(":"),
                    SizedBox(height:15,),
                    Text(":"),
                    SizedBox(height:15,),
                  ],
                ),
                SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    lighttext(studentdata.name),
                    SizedBox(height:15,),
                    lighttext(studentdata.department),
                    SizedBox(height:15,),
                    lighttext(studentdata.semester.toString()),
                    SizedBox(height:15,),
                    lighttext(studentdata.phone.toString()),
                    SizedBox(height:15,),
                  ],
                ),
              ],
            ),
            SizedBox(height:20),
            Center(
              child: RaisedButton(
                color: colors.seccolor,
                textColor: Colors.white,
                child: Text("Edit Profile"),
                elevation: 0,
                onPressed: (){
                  Navigator.pushNamed(context,
                    "/studentProfile",
                    arguments: {
                      "data":studentdata,
                    }
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: colors.seccolor),
                ),
              )
            ),
            SizedBox(height:20),
          ]
        ),
      ),
    );
  }
}
