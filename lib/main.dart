import 'package:flutter/material.dart';
import 'package:mobile_dev/DAOServices/Firebase.dart';
import 'Pages/home.dart';
void main() {
  firebase fb=firebase();
  fb.initilaize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: homePage(),
    );
  }
}
