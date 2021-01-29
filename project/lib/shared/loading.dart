import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:project/theme/theme.dart';


class Loading extends StatelessWidget {
  final Color primary;
  final Color secondary;
  Loading({this.primary,this.secondary});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary??colors.pricolor,
      child: Center(
        child:SpinKitChasingDots(
          color: secondary??colors.seccolor,
          size: 50.0,
        ),
      ),
    );
  }
}