import 'package:flutter/material.dart';
import 'package:project/models/Classteacher.dart';
import 'package:project/theme/theme.dart';

class Mapping extends StatefulWidget {
  @override
  _MappingState createState() => _MappingState();
}

class _MappingState extends State<Mapping> {
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
      appBar: AppBar(
        backgroundColor: colors.pricolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var teacher in teachers)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage:AssetImage('assets/${teacher.picture}'),
                            ),
                            Text(teacher.name),
                            
                          ],
                        ),
                      )
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}