import 'package:flutter/material.dart';
import 'package:mobile_dev/DAOServices/MyFirebase.dart';
import 'package:mobile_dev/Entities/Concretes/Parent.dart';
import 'package:mobile_dev/Pages/LogIn/HostessLoginPage.dart';
import 'package:mobile_dev/Pages/LogIn/ParentLoginPage.dart';
import 'package:mobile_dev/Pages/Parent/AddChildPage.dart';
import 'package:mobile_dev/Pages/Parent/ChildrenProvider.dart';
import 'package:mobile_dev/Pages/Register/HostessRegisterPage.dart';
import 'package:mobile_dev/Pages/Register/ParentRegisterPage.dart';
import 'package:provider/provider.dart';
import 'Pages/Home/HomePage.dart';

void main() {
  MyFirebase fb=MyFirebase();
  fb.initilaize();
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ChildrenProvider()),
    ],
    child: MyApp(),
  );
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
