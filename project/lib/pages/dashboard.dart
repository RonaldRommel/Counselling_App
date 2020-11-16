import 'package:flutter/material.dart';
import 'package:project/pages/drawer.dart';
import 'package:project/teacher.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final dkblue = const Color(0xFF0C0039);
  final ltblue = const Color(4278228447);
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
        toolbarHeight: 80,
        backgroundColor: dkblue,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[ 
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                      height: 60.0,
              ),
            ),
            SizedBox(width: 20),
            Text("Faculties",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: ltblue,
        foregroundColor: Colors.white,
        elevation:10,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){},
              leading: CircleAvatar(
                backgroundImage:AssetImage('assets/${teachers[index].picture}'),
              ),
              title: Text(teachers[index].name,
                style: TextStyle(
                  fontSize:20,
                  fontWeight:FontWeight.w600,
                ),
              ),
              subtitle: Text("${teachers[index].students} students",
                style: TextStyle(
                  fontSize:17,
                  color: Colors.black54,
                  fontWeight:FontWeight.w700,
                ),
              ),
            )
          );
        }
      ),
      // bottomNavigationBar: BottomAppBar(
      //   elevation: 15,
      //   color: dkblue,
      //   child: Row(
      //     children: [
      //       IconButton(icon: Icon(Icons.menu),color: Colors.white ,onPressed: () {
      //         Drawer();
      //       }),
      //       Spacer(),
      //       IconButton(icon: Icon(Icons.search),color: Colors.white , onPressed: () {}),
      //       IconButton(icon: Icon(Icons.more_vert),color: Colors.white , onPressed: () {}),
      //     ],
      //   ),
      ),
    );
  }
}