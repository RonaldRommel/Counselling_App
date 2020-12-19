import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService{
  // final String uid;
  // DatabaseService({this.uid});

  final CollectionReference access = FirebaseFirestore.instance.collection('Users');

  Future<String> userAccess(String uid) async {
    String role =await access.doc(uid).get().then(
      (info)async{
        if(info.exists){
          print("in database ${info.data()['role']}");
          return ( await info.data()['role']);
        }
        else{
          return(null);
        }
      }
    );
    return role;
  }
  
//   Future<String> checkRole() async{
//     DocumentReference docref = loginfo.doc(uid);
//     var x= await docref.get();
//     String y=x.data()['role'].toString();
//     return y;
//   }
// //   async function getDoc(id) {
// //   const snapshot = await db.collection('users').doc(id).get();
// //   const data = snapshot.data();
// // }
// //   Future updateUserData(String sugars,String name,int strength)async{
// //     return await brewCollection.doc(uid).set({
// //       'name':name,
// //       'sugars':sugars,
// //       'strength':strength,
// //       } 
// //     );
// //   }

}