import 'package:flutter/material.dart';
import 'package:project/theme/theme.dart';

class LoginTile extends StatelessWidget {
  final String user;
  LoginTile({this.user});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          height: 100,
          minWidth: 100,
          child: Text("click"),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.blue,
              width: 1,
              style: BorderStyle.solid
            ), 
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: (){
            Navigator.pushNamed(context, '/login',arguments: user);
          },
        ),
        SizedBox(height:20),
        Text(user,style: TextStyle(color:colors.seccolor)),
      ],
    );
  }
}