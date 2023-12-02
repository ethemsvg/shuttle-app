
import 'package:mobile_dev/Controller/HostessRegisterController.dart';
import 'package:mobile_dev/Controller/InputController.dart';
import 'package:mobile_dev/Entities/Concretes/Hostess.dart';

import '../main.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class HostesRegister extends StatelessWidget {

  Hostess hostess=Hostess();
  HostessRegisterController hostessRegisterController=HostessRegisterController();
  InputController inputController=InputController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hostess Sign-Up",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: inputController.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Name",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: inputController.surnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Surname",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: inputController.phoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Phone Number",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  controller: inputController.shuttleCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Shuttle Code",
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async{
                    print("Buradasin!");
                    hostessRegisterController.register(hostess,inputController);
                  },
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
