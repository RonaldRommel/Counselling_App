import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/models/hoduser.dart';
import 'package:project/services/auth.dart';
import 'package:project/theme/theme.dart';
import 'package:provider/provider.dart';

class HodDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override  
  Widget build(BuildContext context) {
  final hoddata=Provider.of<HodUser>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: colors.pricolor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 32.0,
                  child: CircleAvatar(
                      backgroundImage: AssetImage('assets/user.jpg'),
                      radius: 30.0,
                  ),
                ),
                SizedBox(height: 15,),
                Text("${hoddata.name}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18 
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: ()async{
                await _auth.signOut();
              },
          ),
        ],
      ),
    );
  }
}