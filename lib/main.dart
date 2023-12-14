import 'package:flutter/material.dart';
import 'package:mobile_dev/DAOServices/MyFirebase.dart';
import 'package:mobile_dev/Pages/LogIn/HostessLoginPage.dart';
import 'package:mobile_dev/Pages/LogIn/ParentLoginPage.dart';
import 'package:mobile_dev/Pages/Parent/AddChildPage.dart';
import 'package:mobile_dev/Pages/Register/HostessRegisterPage.dart';
import 'package:mobile_dev/Pages/Register/ParentRegisterPage.dart';
import 'Pages/Home/HomePage.dart';

void main() {
  MyFirebase fb=MyFirebase();
  fb.initilaize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:   ParentRegister(),
    );
  }
}
