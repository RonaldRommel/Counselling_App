import 'package:flutter/material.dart';
import 'package:project/models/ClassStudents.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';

class StudentProfile extends StatefulWidget {
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  static const departmentlist=<String>["Physics","Chemistry"];
  final List<DropdownMenuItem<String>> _departments=departmentlist.map(
    (String department)=>DropdownMenuItem<String>(
      value: department,
      child: Text(department),
    ),
  ).toList();
  @override
  Widget build(BuildContext context) {
    final studentdata=Provider.of<Students>(context);
    return Scaffold(
    backgroundColor: Colors.grey[100],
      appBar: new AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        backgroundColor: colors.pricolor,
        automaticallyImplyLeading: true,
        title: Text("Profile",
              style:  Theme.of(context).textTheme.headline1,
        ),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal:20),
          child: Column(
            children:[
              SizedBox(height:20),
              TextFormField(
                initialValue:studentdata.name,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.person_rounded),
                  labelText: "Name *"
                ),
                onSaved: (String value){},
              ),
              SizedBox(height:20),
              TextFormField(
                initialValue:studentdata.phone.toString(),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  icon: Icon(Icons.call_rounded),
                  labelText: "Phone no. *"
                ),
                onSaved: (String value){},
              ),
              SizedBox(height:20),
              ListTile(
                title: Text("Department"),
                leading: Icon(Icons.class__rounded,size: 27 ,),
                trailing: DropdownButton(
                  value: studentdata.department,
                  items: _departments,
                  onChanged: (String value){},
                ),
              ),
              SizedBox(height:20),
              Center(
              child: RaisedButton(
                color: colors.seccolor,
                textColor: Colors.white,
                child: Text("Update profile"),
                elevation: 0,
                onPressed: (){
                  Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: colors.seccolor),
                ),
              )
            ),
            ],
          ),
        ),
      ),
    );
  }
}