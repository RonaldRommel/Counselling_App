import 'package:flutter/material.dart';
import 'package:project/shared/login_tile.dart';
import 'package:project/theme/theme.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.pricolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: MediaQuery.of(context).size.height*0.08,
        backgroundColor: colors.pricolor,
        title: Center(
          child: Text("WNC",
            style:  Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginTile(user: 'HOD'),
                SizedBox(width: 20),
                LoginTile(user: 'Teacher'),
              ],
            ),
            SizedBox(height: 20),
            LoginTile(user: 'Student'),
          ] 
        ),
      ),
    );
  }
}