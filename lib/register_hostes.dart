
import 'main.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Hostess {
  String name;
  String surname;
  String phoneNumber;
  String shuttleCode;

  Hostess({
    required this.name,
    required this.surname,
    required this.phoneNumber,
    required this.shuttleCode,
  });
}

class HostesRegister extends StatelessWidget {

  TextEditingController shuttleCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

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
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Name",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: surnameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Surname",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  obscureText: true,
                  controller: shuttleCodeController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Shuttle Code",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Phone Number",
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async{
                    String name = nameController.text;
                    String surname = surnameController.text;
                    String phoneNum = phoneNumberController.text;
                    String shuttleCode = shuttleCodeController.text;

                    Hostess hostes = Hostess(
                      name : name,
                      surname: surname,
                      phoneNumber: phoneNum,
                      shuttleCode: shuttleCode,
                    );

                    await FirebaseFirestore.instance.collection('Hostess').add({
                      'name': hostes.name,
                      'surname': hostes.surname,
                      'phoneNumber': hostes.phoneNumber,
                      'shuttleCode': hostes.shuttleCode,
                    });

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
