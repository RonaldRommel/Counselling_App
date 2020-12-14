import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/services/auth.dart';
import 'package:project/shared/drawer.dart';
import 'package:project/models/Classteacher.dart';
import 'package:project/theme/theme.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //list of teachers of class Teachers
  List<Teachers> teachers=[
    Teachers(name: "Ronaldo",picture: "ronaldo.jpg",students: "25"),
    Teachers(name: "Messi",picture: "messi.jpg",students: "24"),
    Teachers(name: "Iniesta",picture: "iniesta.jpg",students: "20"),
    Teachers(name: "Neymar",picture: "neymar.jpg",students: "22"),
    Teachers(name: "Ronaldo",picture: "ronaldo.jpg",students: "25"),
    Teachers(name: "Messi",picture: "messi.jpg",students: "24"),
    Teachers(name: "Iniesta",picture: "iniesta.jpg",students: "20"),
    Teachers(name: "Neymar",picture: "neymar.jpg",students: "22"),
    Teachers(name: "Ronaldo",picture: "ronaldo.jpg",students: "25"),
    Teachers(name: "Messi",picture: "messi.jpg",students: "24"),
    Teachers(name: "Iniesta",picture: "iniesta.jpg",students: "20"),
    Teachers(name: "Neymar",picture: "neymar.jpg",students: "22"),
    Teachers(name: "Ronaldo",picture: "ronaldo.jpg",students: "25"),
    Teachers(name: "Messi",picture: "messi.jpg",students: "24"),
    Teachers(name: "Iniesta",picture: "iniesta.jpg",students: "20"),
    Teachers(name: "Neymar",picture: "neymar.jpg",students: "22"),
  ];  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      endDrawer:NavDrawer(),
      appBar: new AppBar(
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        backgroundColor: colors.pricolor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[ 
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height*0.055,
              ),
            ),
            SizedBox(width: 20),
            Text("WNC",
              style:  Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          //Row below appbar
          Container(
            color: colors.seccolor,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.06,
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: Row(
              children: [
                Text('Faculties',style: Theme.of(context).textTheme.headline2,),
                Spacer(),
                FlatButton(
                  textColor: Colors.white,
                  onPressed: (){print("add");}, 
                  child: Icon(Icons.person_add),
                ),
              ],
            ),
          ),
          //List 
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: teachers.length,
              itemBuilder: (context,index){
                return Container(
                  height: MediaQuery.of(context).size.height*0.1 ,
                  child: Card(
                    child: ListTile(
                      onTap: (){
                        print(teachers[index].name);
                        Navigator.pushNamed(context, '/teacherlist',arguments: {
                          'name': teachers[index].name,
                          'students':teachers[index].students,
                        } );
                      },
                      leading: CircleAvatar(
                        radius: MediaQuery.of(context).size.height*0.035,
                        backgroundImage:AssetImage('assets/${teachers[index].picture}'),
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
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 15,
        color: colors.pricolor,
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.menu),color: Colors.white ,onPressed: () {
            }),
            Spacer(),
            IconButton(icon: Icon(Icons.search),color: Colors.white , onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert),color: Colors.white , onPressed: () {}),
          ],
        ),
      ),
    );
  }
}