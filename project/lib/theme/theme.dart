import 'package:flutter/material.dart';
import 'package:project/theme/appcolors.dart';
const colors=AppColors();
ThemeData basicTheme(){
  TextTheme _basicTextTheme(TextTheme base){
    return base.copyWith(
      headline1: base.headline1.copyWith(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 25,
        color: Colors.white,
      ),
      headline2: base.headline2.copyWith(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 25,
        color: Colors.white,
      ),
      bodyText1: base.bodyText1.copyWith(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.black,
      ),
      bodyText2: base.bodyText2.copyWith(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: 17,
        color: Colors.black54,
      ),
    );
  }
  final ThemeData base=ThemeData.light();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    // iconTheme: IconThemeData(
    //   color: Colors.white
    // ),
  );
}
