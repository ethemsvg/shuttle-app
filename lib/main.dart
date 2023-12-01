// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_parent.dart';
import 'register_hostes.dart';
import 'add_child.dart';
import 'package:flutter/material.dart';
import 'register_parent.dart';


void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();


  //Platform.isAndroid ?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDfAWVlB6r-MK7nNGBftYSkqN5gir__QSg",
        appId: "1:304364720194:android:bacd9d16a1f7b5cf571ddb",
        messagingSenderId: "304364720194",
        projectId: "kid-cruiser-goat",
      ),
    );

  await Firebase.initializeApp();
  runApp(HostesRegister());

}