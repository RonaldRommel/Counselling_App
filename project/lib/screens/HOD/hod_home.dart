
import 'package:flutter/material.dart';
import 'package:project/database/hod_database.dart';
import 'package:project/models/hoduser.dart';
import 'package:project/screens/HOD/hod.dart';
import 'package:project/models/Classteacher.dart';
import 'package:provider/provider.dart';


class HodHome extends StatelessWidget {
  final String department;
  final String uid;
  HodHome({this.department,this.uid});
  
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<List<Teachers>>.value(
//       value:HodDatabase(department: this.department).teachers ,
//       child: Hod(department: this.department,),
//     );
//   }
// }
      @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      StreamProvider<List<Teachers>>.value(value: HodDatabase(department: this.department).teachers),
      StreamProvider<HodUser>.value(value: HodDatabase().hodData(this.uid)),
    ],
    child: Hod(department: this.department,),
    );
  }
}