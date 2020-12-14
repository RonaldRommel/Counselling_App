import 'package:flutter/material.dart';
import 'package:project/theme/theme.dart';

final textInputDecoration = InputDecoration(
  filled:true,
  fillColor: Colors.white,
  focusedBorder:OutlineInputBorder(
    borderSide: BorderSide(
      color:colors.seccolor,
      width:3.0,
    )
  ), 
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color:Colors.white,
      width:3.0,
    )
  ),
);