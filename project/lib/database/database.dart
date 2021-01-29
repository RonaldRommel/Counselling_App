import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});
  final CollectionReference access = FirebaseFirestore.instance.collection('Users');

  //after login check role
  Future<Map> userAccess() async {
    Map user = await access.doc(this.uid).get().then(
      (info){
        if(info.exists){
          print("...in database ${info.data()}");
          return info.data();
        }
        else{
          return(null);
        }
      }
    );
    print('user uid : ${this.uid}');
    await Future.delayed(Duration(seconds: 2));
    return user;
  }


}