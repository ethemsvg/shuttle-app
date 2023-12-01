// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_parent.dart';
import 'register_hostes.dart';
import 'add_child.dart';
import 'package:flutter/material.dart';
import 'register_parent.dart';


Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ParentRegister());

}