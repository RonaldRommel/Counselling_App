import 'package:flutter/material.dart';
import 'package:project/autheticate/authenticate.dart';
import 'package:project/models/user.dart';
import 'package:project/screens/HOD/dashboard.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser>(context);
    if(user==null){
     return Authenticate();
    }
    else{
      return Dashboard();
    }
  }
}