import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map student ={
    'name':'',
    'email':'',
    'phone':'',
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        body: Container(
          margin: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 50.0),
                    Text("Sign Up",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                      border: OutlineInputBorder(),
                        labelText: "Name",
                      ),
                      onChanged: (String name){
                        student['name']=name;
                      }
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email id",
                      ),
                      onChanged: (String email){
                        student['email']=email;
                        print(student['email']);
                      },
                    ),
                    SizedBox(height: 10),
                    TextField(
                      maxLength: 12,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        labelText: "Phone",
                      ),
                      onChanged: (String phone){
                        student['phone']=phone;
                      },
                    ),
                    SizedBox(height: 10),
                    FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/dashboard');
                        },
                        color: Colors.blue,
                        child: Text("OTP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}