import 'package:flutter/material.dart';
import 'package:project/models/user.dart';
import 'package:project/services/auth.dart';
import 'package:project/shared/loading.dart';
import 'package:project/shared/logindeco.dart';
import 'package:project/theme/theme.dart';

class Login extends StatefulWidget {
  final String user;
  Login({Key key,this.user}):super(key:key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth =AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field state
  String email="";
  RegExp emailcheck = new RegExp(r'^(?=.*?[@])');
  String password="";
  String error="";
  String college="@cambridge.edu.in";
  @override 
  Widget build(BuildContext context) {
    return loading?Loading():Scaffold(
      backgroundColor:colors.pricolor,
      appBar: AppBar(
        backgroundColor:colors.pricolor,
        elevation: 0.0,
        title: Text("Sign in"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical:20.0,horizontal:50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children:<Widget> [
              Text(widget.user,style: TextStyle(color: Colors.redAccent),),
              SizedBox(height:20),
              TextFormField(
                textAlign: TextAlign.start,
                decoration: textInputDecoration.copyWith(
                  hintText: "College Email",
                  suffix: Text(college),
                ),
                validator: (val)=>emailcheck.hasMatch(val)?'Enter email without domain':null,
                onChanged: (val){
                  setState(() {
                    email=val;
                  });
                },
              ),
              SizedBox(height:20),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                validator: (val)=>val.length>6?null:"Enter password",
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password=val;
                  });
                },
              ),
              SizedBox(height:10.0),
              Text(
                error,
                style: TextStyle(
                color: Colors.red,fontSize:14.0
                ),
              ),
              SizedBox(height:15.0),
              RaisedButton(
                color: colors.seccolor,
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    color:Colors.white,
                  ) ,
                ),
                onPressed: ()async{
                  if(_formKey.currentState.validate())
                  {
                    print(email);
                    print(password);
                    setState(()=>loading=true);
                    dynamic result=await _auth.signInWithEmailAndPassword(email+college, password);
                    if(result ==null){
                      setState(() {
                        error="Could not sign in";                  
                        loading=false;
                      });
                    }
                    else if(result=='exception'){
                      setState(() {
                        error="Invalid email or password";                  
                        loading=false;
                      });
                    }
                    else{
                      Navigator.pop(context);
                    }
                  }
                }
              ),              
              SizedBox(height:20.0),
              if(widget.user.compareTo('Teacher')==0)
              RaisedButton(
                color: colors.seccolor,
                child: Text(
                  "Register",
                  style: TextStyle(
                    color:Colors.white,
                  ) ,
                ),
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}