import 'package:flutter/material.dart';
import 'package:project/theme/theme.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color splash= Color(0xFF000930);
    return Container(
      color: splash,
      height: double.maxFinite,
      child: Center(
        child: Image.asset("assets/collegeLogo.jpg"),
      ),
    );
  }
}