import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:project/models/user.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  TheUser _userFromFirebaseUser(User user){
    return user!=null? TheUser(uid:user.uid):null;
  }
  
  //auth change user stream
  Stream<TheUser> get user{
    return _auth.authStateChanges()
    .map((_userFromFirebaseUser));
    // .map((event) => _userFromFirebaseUser(user));
  } 

//   //sign in anon
//   Future signInAnon()async{
//     try {
//       UserCredential result = await _auth.signInAnonymously().timeout(const Duration(seconds: 3));   
//       User user = result.user;  
//       return _userFromFirebaseUser(user);
//     } catch(e){
//       print(e.toString());
//       return null;
//     }
  // }
  //sign in with email password
    Future signInWithEmailAndPassword(String email,String password)async{
    try{
      UserCredential result =await _auth.signInWithEmailAndPassword(email: email, password: password).timeout(const Duration(seconds: 10));
      User user = result.user;
      print("Sign in worked");
      return _userFromFirebaseUser(user);
    }
    on PlatformException catch (e){
      return 'exception';
    }
    on Exception catch (exception){
      print(exception.toString());
      return 'exception';
    }
    catch(error){
      print(error.toString());
      return null;
    }
  }
//   //register with e5mail and password
//   Future registerWithEmailAndPassword(String email,String password)async{
//     try{
//       UserCredential result =await _auth.createUserWithEmailAndPassword(email: email, password: password).timeout(const Duration(seconds: 7));
//       User user = result.user;
//       // create a new document for the user with the uid
//       await DatabaseService(uid:user.uid).updateUserData('0', 'new memeber', 100);
//       print("updated cloud");
//       return _userFromFirebaseUser(user);
//     }catch(error){
//       print(error.toString());
//       return null;
//     }
//   }
//   //sign out
  Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}