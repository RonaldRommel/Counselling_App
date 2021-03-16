import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/models/ClassStudents.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';
class StudentTable extends StatefulWidget {
  final Map sem;
  StudentTable({this.sem});
  @override
  _StudentTableState createState() => _StudentTableState();
}

class _StudentTableState extends State<StudentTable> {
  bool _edit = true;
  String button="Edit Details";
  List subject1=[];
  List subject2=[];
  List subject3=[];
  List subject4=[];
  List subject5=[];
  List subject6=[];
  bool inactive=false;
  @override
  Widget build(BuildContext context) {
    print(widget.sem);
    final studentdata=Provider.of<Students>(context);
    switch (widget.sem["semester"]) {
      case "Semester 1":
        print("----Semester1------");
        if(studentdata.sem1!=null)
        {
          subject1=studentdata.sem1[widget.sem["counselling"]]["Subject 1"]??[];
          subject2=studentdata.sem1[widget.sem["counselling"]]["Subject 2"]??[];
          subject3=studentdata.sem1[widget.sem["counselling"]]["Subject 3"]??[];
          subject4=studentdata.sem1[widget.sem["counselling"]]["Subject 4"]??[];
          subject5=studentdata.sem1[widget.sem["counselling"]]["Subject 5"]??[];
          subject6=studentdata.sem1[widget.sem["counselling"]]["Subject 6"]??[];
          inactive=studentdata.sem1[widget.sem["counselling"]]["inactive"]??false;
        }
        break;
        case "Semester 2":
        print("----Semester2------");
        if(studentdata.sem2!=null)
        {
          subject1=studentdata.sem2[widget.sem["counselling"]]["Subject 1"]??[];
          subject2=studentdata.sem2[widget.sem["counselling"]]["Subject 2"]??[];
          subject3=studentdata.sem2[widget.sem["counselling"]]["Subject 3"]??[];
          subject4=studentdata.sem2[widget.sem["counselling"]]["Subject 4"]??[];
          subject5=studentdata.sem2[widget.sem["counselling"]]["Subject 5"]??[];
          subject6=studentdata.sem2[widget.sem["counselling"]]["Subject 6"]??[];
          inactive=studentdata.sem2[widget.sem["counselling"]]["inactive"];
        }
        break;
        case "Semester 3":
        print("----Semester3------");
        if(studentdata.sem3!=null)
        {
          subject1=studentdata.sem3[widget.sem["counselling"]]["Subject 1"]??[];
          subject2=studentdata.sem3[widget.sem["counselling"]]["Subject 2"]??[];
          subject3=studentdata.sem3[widget.sem["counselling"]]["Subject 3"]??[];
          subject4=studentdata.sem3[widget.sem["counselling"]]["Subject 4"]??[];
          subject5=studentdata.sem3[widget.sem["counselling"]]["Subject 5"]??[];
          subject6=studentdata.sem3[widget.sem["counselling"]]["Subject 6"]??[];
          inactive=studentdata.sem3[widget.sem["counselling"]]["inactive"];
        }
        break;
        case "Semester 4":
        print("----Semester4------");
        if(studentdata.sem4!=null)
        { 
          subject1=studentdata.sem4[widget.sem["counselling"]]["Subject 1"]??[];
          subject2=studentdata.sem4[widget.sem["counselling"]]["Subject 2"]??[];
          subject3=studentdata.sem4[widget.sem["counselling"]]["Subject 3"]??[];
          subject4=studentdata.sem4[widget.sem["counselling"]]["Subject 4"]??[];
          subject5=studentdata.sem4[widget.sem["counselling"]]["Subject 5"]??[];
          subject6=studentdata.sem4[widget.sem["counselling"]]["Subject 6"]??[];
          inactive=studentdata.sem4[widget.sem["counselling"]]["inactive"]??true;
        }
        break;
        case "Semester 5":
        print("----Semester5------");
        if(studentdata.sem5!=null)
        {
          subject1=studentdata.sem5[widget.sem["counselling"]]["Subject 1"]??[];
          subject2=studentdata.sem5[widget.sem["counselling"]]["Subject 2"]??[];
          subject3=studentdata.sem5[widget.sem["counselling"]]["Subject 3"]??[];
          subject4=studentdata.sem5[widget.sem["counselling"]]["Subject 4"]??[];
          subject5=studentdata.sem5[widget.sem["counselling"]]["Subject 5"]??[];
          subject6=studentdata.sem5[widget.sem["counselling"]]["Subject 6"]??[];
          inactive=studentdata.sem5[widget.sem["counselling"]]["inactive"];
        }
        break;
        case "Semester 6":
        print("----Semester6------");
        if(studentdata.sem6!=null)
        {
          subject1=studentdata.sem6[widget.sem["counselling"]]["Subject 1"]??[];
          subject2=studentdata.sem6[widget.sem["counselling"]]["Subject 2"]??[];
          subject3=studentdata.sem6[widget.sem["counselling"]]["Subject 3"]??[];
          subject4=studentdata.sem6[widget.sem["counselling"]]["Subject 4"]??[];
          subject5=studentdata.sem6[widget.sem["counselling"]]["Subject 5"]??[];
          subject6=studentdata.sem6[widget.sem["counselling"]]["Subject 6"]??[];
          inactive=studentdata.sem6[widget.sem["counselling"]]["inactive"];
        }
        break;

        case "Semester 7":
        print("----Semester7------");
        if(studentdata.sem7!=null)
        {
          subject1=studentdata.sem7[widget.sem["counselling"]]["Subject 1"]??[];
          subject2=studentdata.sem7[widget.sem["counselling"]]["Subject 2"]??[];
          subject3=studentdata.sem7[widget.sem["counselling"]]["Subject 3"]??[];
          subject4=studentdata.sem7[widget.sem["counselling"]]["Subject 4"]??[];
          subject5=studentdata.sem7[widget.sem["counselling"]]["Subject 5"]??[];
          subject6=studentdata.sem7[widget.sem["counselling"]]["Subject 6"]??[];
          inactive=studentdata.sem7[widget.sem["counselling"]]["inactive"];
        }
        break;
        case "Semester 8":
        print("----Semester8------");
        if(studentdata.sem8!=null)
        {
          subject1=studentdata.sem8[widget.sem["counselling"]]["Subject 1"]??[];
          subject2=studentdata.sem8[widget.sem["counselling"]]["Subject 2"]??[];
          subject3=studentdata.sem8[widget.sem["counselling"]]["Subject 3"]??[];
          subject4=studentdata.sem8[widget.sem["counselling"]]["Subject 4"]??[];
          subject5=studentdata.sem8[widget.sem["counselling"]]["Subject 5"]??[];
          subject6=studentdata.sem8[widget.sem["counselling"]]["Subject 6"]??[];
          inactive=studentdata.sem8[widget.sem["counselling"]]["inactive"];
        }
        break;
    }
    
    DataRow tablerow(List subject){
      return DataRow(
        cells: [
          DataCell(
            TextFormField(
              initialValue: (subject.isNotEmpty)?subject[0]:"",
              readOnly: _edit,
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.characters,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Subject Code"
              ),
            ),
          ),
          DataCell(
            TextFormField(
              readOnly: _edit,
              initialValue:(subject.isNotEmpty)?subject[1].toString():"",
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Marks scored",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      );
    }
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      backgroundColor: Colors.grey[100],
      appBar: new AppBar(
        title: Text(widget.sem["semester"],style: Theme.of(context).textTheme.headline1,),
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        backgroundColor: colors.pricolor,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.sem["counselling"],
                style: Theme.of(context).textTheme.headline1.copyWith(
                  color: colors.pricolor,
                ),
              ),
              SizedBox(height: 20,),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.white,
                  ),
                  child: DataTable(
                    headingTextStyle: TextStyle(
                      color: Colors.white, 
                      fontSize: 20,
                    ),
                    dataTextStyle: TextStyle(
                      color: colors.pricolor, 
                    ),
                    dividerThickness: 1,
                    dataRowHeight: 50,
                    dataRowColor:MaterialStateProperty.all(colors.seccolor.withOpacity(0.12)) ,
                    headingRowColor: MaterialStateProperty.all(colors.pricolor),
                    columns: [
                      DataColumn(label: Text("Subject")),
                      DataColumn(label: Text("Marks")),
                    ],
                    rows: [
                      tablerow(subject1),
                      tablerow(subject2),
                      tablerow(subject3),
                      tablerow(subject4),
                      tablerow(subject5),
                      tablerow(subject6),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 20),
            Center(
                child: RaisedButton(
                  disabledTextColor: Colors.white,
                  disabledColor: Colors.grey[600],
                  color: colors.seccolor,
                  textColor: Colors.white,
                  child: inactive?Text("Disabled"):Text(button),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: inactive?BorderSide(color: Colors.grey[600]):BorderSide(color: colors.seccolor),
                  ),
                  onPressed: inactive?null:(){
                    // SystemChannels.textInput.invokeMethod('TextInput.hide');
                    // Navigator.pop(context);
                    if(_edit==true)
                    {
                      setState(() {
                        _edit=false;
                        button="Update Details";
                      });
                    }
                    else
                    {
                      setState(() {
                        _edit=true;
                        button="Edit Details";
                      });
                    }
                  },
                )
              ),
            ]
          ),
        ),
      ),
    );
  }
}